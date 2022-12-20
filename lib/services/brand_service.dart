import 'package:autobaloo/models/brand.dart';
import 'package:autobaloo/models/strapi_common/strapi_query.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/strapi_client.dart';

// Classe qui gère les services pour les marques
class BrandService {
  // Méthode asynchrone qui retourne une liste de marques
  Future<List<Brand>> getAllBrands() async {
    // Récupère l'instance de Strapi depuis le ServiceLocator
    final strapi = sl.get<Strapi>();
    // Utilise la méthode find de Strapi pour récupérer une liste de marques
    final result = await strapi.find<Brand>('brands',
        // Utilise StrapiQuery pour paramétrer la requête
        query: StrapiQuery.params(
          // Popule la relation (deep) jusqu'à 2 niveaux
          populates: ['deep,2'],
        ),
        // Utilise la méthode fromJson de la classe Brand pour convertir chaque élément de la liste en objet Brand
        converter: Brand.fromJson);
    // Retourne la liste de marques ou une liste vide si aucun résultat n'a été obtenu
    return result ?? <Brand>[];
  }
}
