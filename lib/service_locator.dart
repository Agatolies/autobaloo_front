import 'package:autobaloo/core/constants.dart';
import 'package:autobaloo/services/auth_service.dart';
import 'package:autobaloo/services/brand_service.dart';
import 'package:autobaloo/services/car_model_service.dart';
import 'package:autobaloo/services/car_service.dart';
import 'package:autobaloo/services/strapi_client.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> initializeServiceLocator() async {
  // Initialize the Strapi Client
  await Strapi.init(endpoint: apiEndpoint);

  sl
    ..registerSingleton<Strapi>(Strapi.instance)
    ..registerSingleton<AuthService>(AuthService())
    ..registerSingleton<BrandService>(BrandService())
    ..registerSingleton<CarService>(CarService())
    ..registerSingleton<CarModelService>(CarModelService());
}
