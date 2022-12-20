// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:convert';
import 'dart:developer';
import 'package:autobaloo/helper/auth_storage.dart';
import 'package:autobaloo/models/strapi_common/strapi_base_user.dart';
import 'package:autobaloo/models/strapi_common/strapi_configuration.dart';
import 'package:autobaloo/models/strapi_common/strapi_error.dart';
import 'package:autobaloo/models/strapi_common/strapi_query.dart';
import 'package:autobaloo/models/strapi_common/strapi_token.dart';
import 'package:http/http.dart' as http;

class Strapi {
  Strapi._(String endpoint, String? apiToken,
      {StrapiConfiguration? configuration}) {
    _endpoint = endpoint;
    _apiToken = apiToken;
    _configuration = configuration ?? StrapiConfiguration();
    AuthStorage.init(_configuration.jwtStoreKey);
  }

  static late Strapi _strapi;

  static Strapi get instance {
    return _strapi;
  }

  static Future<void> init(
      {required String endpoint,
      String? apiToken,
      StrapiConfiguration? configuration}) async {
    assert(endpoint != '');
    if (endpoint.endsWith('/')) {
      endpoint = endpoint.substring(0, endpoint.length - 1);
    }
    _endpoint = endpoint;
    _apiToken = apiToken;
    _strapi = Strapi._(_endpoint, apiToken,
        configuration: configuration ?? StrapiConfiguration());
    try {
      await instance.fetchUser();
    } catch (e) {
      // suppress error
    }
  }

  static late String _endpoint;
  static String? _apiToken;
  StrapiConfiguration _configuration = StrapiConfiguration();
  StrapiQuery query = StrapiQuery.instance();
  StrapiError? _error;
  static StrapiUser? _user;
  http.Response _response = http.Response('{}', 400);

  // getters
  String get endpoint => _endpoint;
  String? get apiToken => _apiToken;
  StrapiConfiguration get configuration => _configuration;
  StrapiError? get error => _error;
  StrapiUser? get user => _user;
  bool get isLogged => _user != null;
  http.Client get client => http.Client();
  http.Response get response => _response;

  // methods
  Uri __getEndpoint(String collection,
      {String? documentId, StrapiQuery? query}) {
    String url = '$_endpoint/$collection';
    if (documentId != null) {
      url = '$url/$documentId';
    }
    if (query != null) {
      url = '$url?${query.toQueryParams()}';
    }
    return Uri.parse(url);
  }

  void handleError(http.Response response) {
    final jsonBody = json.decode(response.body);
    try {
      if (jsonBody is Map && jsonBody.containsKey('error')) {
        _error = StrapiError.fromJson(jsonBody['error']);
      } else {
        _error = null;
      }
    } catch (e) {
      _error = StrapiError.fromClient();
    }
  }

  void _init() {
    _error = null;
    _response = http.Response('{}', 400);
    query = StrapiQuery.instance();
  }

  Future<dynamic> request(method, String url,
      [int successStatusCode = 200,
        Map<String, String> headers = const {}]) async {
    try {
      _init();
      http.StreamedResponse? response;
      final request = http.Request(method, Uri.parse(url));
      request.headers.addAll(headers);
      response = await request.send();
      final responseData = await response.stream.bytesToString();
      final jsonData = json.decode(responseData);
      if (response.statusCode == successStatusCode) {
        return jsonData;
      } else {
        throw jsonData;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> multipartRequest(method, String url,
      [int successStatusCode = 200,
      Map<String, String> fields = const {},
      List<dynamic> files = const [],
      Map<String, String> headers = const {}]) async {
    try {
      _init();
      http.StreamedResponse? response;
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(fields);
      request.headers.addAll(headers);
      for (final file in files) {
        request.files.add(await http.MultipartFile.fromPath(
          file['name'],
          file['path'],
        ));
      }
      response = await request.send();
      final responseData = await response.stream.bytesToString();
      final jsonData = json.decode(responseData);
      if (response.statusCode == successStatusCode) {
        return jsonData;
      } else {
        throw jsonData;
      }
    } catch (e) {
      rethrow;
    }
  }

//  CRUD methods
  // find
  Future<List<T>?>? find<T>(dynamic collection,
      {StrapiQuery? query,
      required T Function(Map<String, dynamic> json) converter}) async {
    _init();
    final Uri url = __getEndpoint(collection, query: query);
    final headers = await _configuration.headers;
    _response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      if (decodedJson is Map && decodedJson.containsKey('data')) {
        final List<T> result = <T>[];
        for (final item in decodedJson['data']) {
          result.add(converter(item));
        }
        return result;
      }
      return <T>[];
    }
    handleError(response);
    return null;
  }

  // find One
  Future<T?> findOne<T>(dynamic collection,
      {String? documentId,
      required T Function(Map<String, dynamic> json) converter}) async {
    _init();
    final Uri url = __getEndpoint(collection, documentId: documentId);
    _response = await http.get(url, headers: await _configuration.headers);
    if (response.statusCode == 200) {
      return converter(json.decode(response.body));
    }
    handleError(response);
    return null;
  }

  // create
  Future<T?> create<T>(String collection,
      {Map<String, dynamic>? data,
      T Function(Map<String, dynamic> json)? converter}) async {
    _init();
    final Uri url = __getEndpoint(collection);

    _response = await http.post(
      url,
      body: json.encode(data),
      headers: await _configuration.headers,
    );
    if (response.statusCode == 201) {
      if (converter != null) {
        return converter(json.decode(response.body));
      }
      return null;
    }
    handleError(response);
    return null;
  }

  // update
  Future<T?> update<T>(String collection, String documentId,
      {Map<String, dynamic>? data,
      required T Function(Map<String, dynamic> json) converter}) async {
    _init();
    final Uri url = __getEndpoint(collection, documentId: documentId);
    _response = await http.put(
      url,
      body: json.encode(data),
      headers: await _configuration.headers,
    );
    if (response.statusCode == 200) {
      return converter(json.decode(response.body));
    }
    handleError(response);
    return null;
  }

  // delete
  Future<bool> delete(String collection, String documentId) async {
    _init();
    final Uri url = __getEndpoint(collection, documentId: documentId);
    _response = await http.delete(
      url,
      headers: await _configuration.headers,
    );
    if (response.statusCode == 200) {
      return true;
    }
    handleError(response);
    return false;
  }

  // register : registers a user and sets the token
  Future<bool> register(String email, String password) async {
    _init();
    final Uri url = Uri.parse('$_endpoint/auth/local/register');
    _response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
      }),
      headers: await _configuration.headers,
    );
    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      if (jsonData is Map && jsonData.containsKey('jwt')) {
        await AuthStorage.instance.setToken(jsonData['jwt']);
        _user = StrapiUser.fromJson(jsonData['user']);
        return true;
      }
    }
    handleError(response);
    return false;
  }

  // login
  Future<bool> login(
      {required String identifier, required String password}) async {
    _init();
    final Uri url = Uri.parse('$_endpoint/auth/local');
    _response = await http.post(
      url,
      body: json.encode({
        'identifier': identifier,
        'password': password,
      }),
      headers: await _configuration.headers,
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData is Map && jsonData.containsKey('jwt')) {
        await AuthStorage.instance.setToken(jsonData['jwt']);
        _user = StrapiUser.fromJson(jsonData['user']);
        return true;
      }
    }
    log(response.body.toString());
    handleError(response);
    return false;
  }

  // forgotPassword
  Future<bool> forgotPassword({required String email}) async {
    _init();
    final Uri url = Uri.parse('$_endpoint/auth/forgot-password');
    log('email: $email');
    _response = await http.post(
      url,
      body: json.encode({
        'email': email,
      }),
      headers: await _configuration.headers,
    );
    if (response.statusCode == 200) {
      return true;
    }
    handleError(response);
    return false;
  }

  // resetPassword
  Future<bool> resetPassword(
      {required String code,
      required String password,
      required String passwordConfirmation}) async {
    _init();
    final Uri url = Uri.parse('$_endpoint/auth/reset-password');
    _response = await http.post(
      url,
      body: json.encode({
        'code': code,
        'password': password,
        'passwordConfirmation': passwordConfirmation,
      }),
      headers: await _configuration.headers,
    );
    if (response.statusCode == 200) {
      return true;
    }
    handleError(response);
    return false;
  }

  // sendEmailConfirmation
  Future<bool> sendEmailConfirmation(
      {required String email, required String confirmationUrl}) async {
    _init();
    final Uri url = Uri.parse('$_endpoint/auth/email-confirmation');
    _response = await http.post(
      url,
      body: json.encode({
        'email': email,
      }),
      headers: await _configuration.headers,
    );
    if (response.statusCode == 200) {
      return true;
    }
    handleError(response);
    return false;
  }

  // getProviderAuthenticationUrl

  String getProviderAuthenticationUrl({required String provider}) {
    return '$_endpoint/connect/$provider';
  }

  //logout
  Future<bool> logout() async {
    _init();
    await AuthStorage.instance.deleteToken();
    _user = null;
    _configuration.setHeaders = await _configuration.headers
      ..remove('Authorization');
    return true;
  }

  // fetchUser
  Future<bool> fetchUser({String? populates}) async {
    // Initialize the variables
    _init();

    // Build the URL for the HTTP request
    String url = '$_endpoint/users/me';
    if (populates != null) {
      url += '?populate=$populates';
    }
    final Uri meUrl = Uri.parse(url);

    // Get the headers for the HTTP request
    final headers = await _configuration.headers;
    // If the headers do not contain the 'Authorization' header...
    if (!headers.containsKey('Authorization')) {
      return false;
    }

    // Log the headers for debugging purposes
    log(headers.toString());

    // Make the HTTP GET request
    _response = await http.get(
      meUrl,
      headers: headers,
    );

    // If the request was successful, decode the JSON response and create a StrapiUser object
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      _user = StrapiUser.fromJson(jsonBody);
      return true;
    }

    // If the request was not successful, handle the error
    handleError(response);
    return false;
  }

  set setUser(StrapiUser user) {
    _user = user;
  }

  //getToken
  Future<StrapiToken?> getToken() {
    return AuthStorage.instance.getToken();
  }

  // strapi.setToken(token);/
  Future<bool> setToken(String token) async {
    try {
      await AuthStorage.instance.setToken(token);
      return true;
    } catch (e) {
      return false;
    }
  }

  //removeToken
  Future<bool> removeToken() async {
    try {
      await AuthStorage.instance.deleteToken();
      return true;
    } catch (e) {
      return false;
    }
  }
}
