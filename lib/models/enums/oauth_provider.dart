import 'dart:ui';

// Énumération des différents fournisseurs de connexion OAuth
enum OAuthProvider {
  google,
  facebook,
  microsoft,
}

// Classe qui contient les informations sur un fournisseur OAuth
class OAuthProviderInfo {
  // Constructeur de factory qui crée une instance de OAuthProviderInfo en fonction du fournisseur passé en paramètre
  factory OAuthProviderInfo.forProvider(OAuthProvider provider) {
    switch (provider) {
    // Si le fournisseur est Google, renvoie une instance de OAuthProviderInfo avec les informations de Google
      case OAuthProvider.google:
        return OAuthProviderInfo._(
            key: 'google',
            brandName: 'Google',
            brandColor: const Color(0xFFDB4437));
    // Si le fournisseur est Facebook, renvoie une instance de OAuthProviderInfo avec les informations de Facebook
      case OAuthProvider.facebook:
        return OAuthProviderInfo._(
            key: 'facebook',
            brandName: 'Facebook',
            brandColor: const Color(0xFF3B5998));
    // Si le fournisseur est Microsoft, renvoie une instance de OAuthProviderInfo avec les informations de Microsoft
      case OAuthProvider.microsoft:
        return OAuthProviderInfo._(
            key: 'microsoft',
            brandName: 'Microsoft',
            brandColor: const Color(0xFF0078D4));
    // Si aucun des cas ci-dessus n'est satisfait, lance une exception "UnimplementedError" avec le message "Unimplemented provider: $provider"
      default:
        throw UnimplementedError('Unimplemented provider: $provider');
    }
  }

  // Constructeur privé de OAuthProviderInfo qui prend en paramètre la clé, le nom de marque et la couleur de marque du fournisseur
  OAuthProviderInfo._(
      {required this.key, required this.brandName, required this.brandColor});

  final String key;
  final String brandName;
  final Color brandColor;
}
