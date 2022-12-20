// ignore_for_file: use_setters_to_change_properties

import 'package:autobaloo/models/strapi_common/strapi_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorage {

  AuthStorage._();
  static late String _jwtStoreKey;

  static void init(String jwtStoreKey) {
    _jwtStoreKey = jwtStoreKey;
  }

  static final AuthStorage _instance = AuthStorage._();
  static AuthStorage get instance => _instance;

  final storage = const FlutterSecureStorage();

  Future<StrapiToken?> getToken() async {
    try {
      final token = await storage.read(key: _jwtStoreKey);

      if (token == null) {
        return null;
      }

      return StrapiToken(token);
    }
    catch (e) {
      return null;
    }
  }

  Future<void> setToken(String token) async {
    return storage.write(key: _jwtStoreKey, value: token);
  }

  Future<void> deleteToken() async {
    return storage.delete(key: _jwtStoreKey);
  }
}
