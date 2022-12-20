import 'package:autobaloo/models/car.dart';
import 'package:autobaloo/models/strapi_common/strapi_query.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/services/strapi_client.dart';


// Classe de service pour gérer les opérations concernant les voitures
class CarService {
  // Liste de chaînes de caractères pour récupérer 3 niveaux de réponse
  final deep3 = ['deep,3'];

  // Méthode asynchrone pour récupérer toutes les voitures
  Future<List<Car>> getAllCars() async {
    // Récupération de l'instance de Strapi à partir du service locator
    final strapi = sl.get<Strapi>();
    // Appel de la méthode find de Strapi pour récupérer les voitures
    final result = await strapi.find<Car>('cars',
        query: StrapiQuery.params(
          populates: ['deep,3'],
        ),
        converter: Car.fromJson);
    // Retourne la liste de voitures, ou une liste vide si aucun résultat n'a été trouvé
    return result ?? <Car>[];
  }
  // Méthode asynchrone pour récupérer toutes les voitures en promotion
  Future<List<Car>> getAllFeaturedCars() async {
    // Récupération de l'instance de Strapi à partir du service locator
    final strapi = sl.get<Strapi>();
    // Appel de la méthode find de Strapi pour récupérer les voitures en promotion
    final result = await strapi.find<Car>('cars',
        query: StrapiQuery.params(
          populates: deep3,
          filters: {'car_is_featured': true},
        ),
        converter: Car.fromJson);
    // Retourne la liste de voitures en promotion, ou une liste vide si aucun résultat n'a été trouvé
    return result ?? <Car>[];
  }
  // Méthode asynchrone pour récupérer les dernières voitures ajoutées en DB
  Future<List<Car>> getLatestCars() async {
    // Récupération de l'instance de Strapi à partir du service locator
    final strapi = sl.get<Strapi>();
    // Appel de la méthode find de Strapi pour récupérer les dernières voitures ajoutées
    final result = await strapi.find<Car>('cars',
        query: StrapiQuery.params(populates: deep3, filters: {
          'car_date_added': {
            r'$gte': '2022-12-18',
          }
        }),
        converter: Car.fromJson);
    // Retourne la liste des dernières voitures ajoutées, ou une liste vide si aucun résultat n'a été trouvé
    return result ?? <Car>[];
  }

  // Méthode asynchrone pour récupérer une voiture spécifique en utilisant son ID
  Future<Car> getCar(String id) async {
    // Récupération de l'instance de Strapi à partir du service locator
    final strapi = sl.get<Strapi>();
    // Appel de la méthode find de Strapi pour récupérer la voiture spécifique
    final result = await strapi.find<Car>('cars',
        query: StrapiQuery.params(
          populates: deep3,
          filters: {'id': id},
        ),
        converter: Car.fromJson);
    // Retourne la première voiture de la liste de résultats, ou null si aucun résultat n'a été trouvé
    return result![0];
  }
}
