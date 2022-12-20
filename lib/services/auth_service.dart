import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/strapi_client.dart';

// Classe qui gère les services d'authentification
class AuthService {
  // Méthode asynchrone qui effectue la connexion de l'utilisateur avec son identifiant et son mot de passe
  Future<bool> login(String identifier, String password) async {
    // Récupère l'instance de Strapi depuis le ServiceLocator
    final strapi = sl.get<Strapi>();
    // Utilise la méthode login de Strapi pour effectuer la connexion
    return strapi.login(identifier: identifier, password: password);
  }

  // Méthode asynchrone qui effectue la connexion de l'utilisateur avec un fournisseur d'authentification OAuth
  Future<bool> loginOAuth(String provider) async {
    // Récupère l'instance de Strapi depuis le ServiceLocator
    final strapi = sl.get<Strapi>();
    // Récupère l'URL de connexion auprès du fournisseur d'authentification OAuth
    final url = strapi.getProviderAuthenticationUrl(provider: provider);
    // Envoie une requête HTTP GET à l'URL de connexion
    final response = await strapi.request('GET', url);
    return true;
  }
}
