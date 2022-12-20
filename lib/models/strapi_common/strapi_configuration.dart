import 'package:autobaloo/helper/auth_storage.dart';

class StrapiConfiguration {
  StrapiConfiguration({
    String jwtStoreKey = 'jwt',
    Map<String, String>? headers,
  }) {
    _jwtStoreKey = jwtStoreKey;
    if (headers != null) {
      _headers = {..._headers, ...headers};
    }
  }

  late String _jwtStoreKey;
  Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String get jwtStoreKey => _jwtStoreKey;

  Future<Map<String, String>> get headers async {
    try {
      final token = await AuthStorage.instance.getToken();

      if (token != null) {
        _headers['Authorization'] = 'Bearer ${token.jwt}';
      }
    }
    catch (e) {
      // suppress error
    }

    return _headers;
  }

  set setHeaders(Map<String, String> headers) {
    _headers = headers;
  }
}
