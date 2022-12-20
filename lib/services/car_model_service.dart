import 'package:autobaloo/models/car_model.dart';
import 'package:autobaloo/models/strapi_common/strapi_query.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/strapi_client.dart';

// Classe qui gère les services pour les modèles de voitures
class CarModelService {
  // Méthode asynchrone qui retourne une liste de modèles de voitures
  Future<List<CarModel>> getAllModels() async {
    // Récupère l'instance de Strapi depuis le ServiceLocator
    final strapi = sl.get<Strapi>();
    // Utilise la méthode find de Strapi pour récupérer une liste de modèles de voitures
    final result = await strapi.find<CarModel>('models',
        // Utilise StrapiQuery pour paramétrer la requête
        query: StrapiQuery.params(
          // Popule la relation (deep) jusqu'au niveau 2
          populates: ['deep,2'],
        ),
        // Utilise la méthode fromJson de la classe CarModel pour convertir chaque élément de la liste en objet CarModel
        converter: CarModel.fromJson);
    // Retourne la liste de modèles de voitures ou une liste vide si aucun résultat n'a été obtenu
    return result ?? <CarModel>[];
  }
}
