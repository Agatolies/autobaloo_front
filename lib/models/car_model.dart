// ignore_for_file: unnecessary_lambdas

import 'package:autobaloo/models/brand.dart';
import 'package:autobaloo/models/strapi_common/strapi_document.dart';
import 'package:autobaloo/models/strapi_common/strapi_image.dart';

// Classe qui représente les attributs d'un modèle de voiture.
class CarModelAttributes {
  // Constructeur de la classe CarModelAttributes.
  CarModelAttributes(
      {required this.modelName,
      required this.modelDoor,
      required this.modelVariant,
      required this.modelDescription,
      required this.modelFuelType,
      required this.modelEngineBox,
      required this.modelConstructionYear,
      required this.modelEuropeanCode,
      this.brand,
      this.modelImages});

  factory CarModelAttributes.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];

    // Création d'une liste d'images du modèle de voiture à partir du json reçu.
    // Si aucune image n'est présente, on retourne null.
    final modelImages = attributes.containsKey('model_images')
        ? List<dynamic>.from(attributes['model_images']['data'])
            .map<StrapiImage>((image) => StrapiImage.fromJson(image))
            .toList()
        : null;

    // Récupération de la marque du modèle de voiture à partir du json reçu.
    // Si aucune marque n'est présente, on retourne null.
    final brand = attributes.containsKey('brand')
        ? Brand.fromJson(attributes['brand']['data'])
        : null;

    return CarModelAttributes(
        modelDoor: attributes['model_doors'],
        modelName: attributes['model_name'],
        modelVariant: attributes['model_variant'],
        modelDescription: attributes['model_description'],
        modelFuelType: attributes['model_fuel_type'],
        modelConstructionYear: attributes['model_construction_year'],
        modelEngineBox: attributes['model_engine_box'],
        modelEuropeanCode: attributes['model_european_code'],
        brand: brand,
        modelImages: modelImages);
  }
  // Nom du modèle de voiture.
  String modelName;
  // Nombre de portes du modèle de voiture.
  int modelDoor;
  // Variante du modèle de voiture.
  String modelVariant;
  // Description du modèle de voiture.
  String modelDescription;
  // Type de carburant du modèle de voiture.
  String modelFuelType;
  // Type de boîte de vitesse du modèle de voiture.
  String modelEngineBox;
  // Année de construction du modèle de voiture.
  int modelConstructionYear;
  // Code européen du modèle de voiture.
  String modelEuropeanCode;
  // Marque du modèle de voiture.
  Brand? brand;
  // Photos du modèle de voiture.
  List<StrapiImage>? modelImages;
}

// Classe qui représente un modèle de voiture
class CarModel extends StrapiDocument<CarModelAttributes> {
  // Constructeur de la classe CarModel.
  CarModel({
    required super.id,
    required super.attributes,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    super.locale,
    required super.model,
  }) : super();

  factory CarModel.fromJson(Map<String, dynamic> json) {
    final s = StrapiDocument<CarModelAttributes>.fromJson(
        json, CarModelAttributes.fromJson);

    return CarModel(
      // ID du modèle de voiture dans la base de données.
        id: s.id,
        // Attributs du modèle de voiture.
        attributes: s.attributes,
        // Date de création du document dans la base de données.
        createdAt: s.createdAt,
        // Date de mise à jour du document dans la base de données.
        updatedAt: s.updatedAt,
        // Date de publication du document dans la base de données.
        publishedAt: s.publishedAt,
        locale: s.locale,
        // Modèle de voiture.
        model: s.model);
  }

  String get modelName => model!.modelName;
  int get modelDoor => model!.modelDoor;
  String get modelVariant => model!.modelVariant;
  String get modelDescription => model!.modelDescription;
  String get modelFuelType => model!.modelFuelType;
  String get modelEngineBox => model!.modelEngineBox;
  int get modelConstructionYear => model!.modelConstructionYear;
  String get modelEuropeanCode => model!.modelEuropeanCode;
  Brand? get brand => model?.brand;
  List<StrapiImage>? get modelImages => model?.modelImages;
}
