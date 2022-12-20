import 'package:autobaloo/models/car_model.dart';
import 'package:autobaloo/models/strapi_common/strapi_document.dart';

// Classe qui contient les attributs d'une voiture
class CarAttributes {
  // Constructeur de CarAttributes qui prend en paramètre le numéro de chassis
  // de la voiture, sa disponibilité, son numéro d'immatriculation, ses kilomètres,
  // sa couleur, sa date d'ajout, son prix de vente et son prix de réservation
  // quotidien, ainsi que son modèle (optionnel)
  CarAttributes({
    required this.carChassisSerialNumber,
    required this.carAvailability,
    required this.carPlateNumber,
    required this.carKilometers,
    required this.carColor,
    required this.carDateAdded,
    required this.carSalePrice,
    required this.carReservationDailyPrice,
    this.carModel});

  // Factory qui crée une instance de CarAttributes à partir d'un objet JSON
  factory CarAttributes.fromJson(Map<String, dynamic> json) {
    // Récupère les attributs dans l'objet JSON
    final attributes = json['attributes'];

    // Récupère le modèle de la voiture (si présent) à partir de l'objet JSON
    final carModel = attributes.containsKey('model')
        ? CarModel.fromJson(attributes['model']['data'])
        : null;

    // Renvoie une instance de CarAttributes avec les informations de l'objet JSON
    return CarAttributes(
        carChassisSerialNumber: attributes['car_chassis_serial_number'],
        carAvailability: attributes['car_availability'],
        carPlateNumber: attributes['car_plate_number'],
        carKilometers: attributes['car_kilometers'],
        carColor: attributes['car_color'],
        carDateAdded: DateTime.parse(attributes['car_date_added']),
        carSalePrice: attributes['car_sale_price'],
        carReservationDailyPrice: attributes['car_reservation_daily_price'],
        carModel: carModel);
  }

  // Numéro de chassis de la voiture
  String carChassisSerialNumber;
  // Disponibilité de la voiture
  bool carAvailability;
  // Numéro d'immatriculation de la voiture
  String carPlateNumber;
  // Kilométrage de la voiture
  int carKilometers;
  // Couleur de la voiture
  String carColor;
  // Date d'ajout de la voiture
  DateTime carDateAdded;
  // Prix de vente de la voiture
  int carSalePrice;
  // Prix de la location à la journée de la voiture
  int carReservationDailyPrice;
  // Modèle de la voiture (relation)(optionnel)
  CarModel? carModel;
}

// Classe qui représente une voiture
class Car extends StrapiDocument<CarAttributes> {
  // Constructeur de Car qui hérite de StrapiDocument et qui prend en paramètre
  // l'ID, les attributs, la date de création, la date de modification, la date
  // de publication, la langue et le modèle de la voiture
  Car({
    required super.id,
    required super.attributes,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    super.locale,
    required super.model,
  }) : super();

  // Factory qui crée une instance de Car à partir d'un objet JSON
  factory Car.fromJson(Map<String, dynamic> json) {
    // Crée une instance de StrapiDocument<CarAttributes> à partir de l'objet JSON
    final s = StrapiDocument<CarAttributes>
        .fromJson(json, CarAttributes.fromJson);

    // Renvoie une instance de Car avec les informations de l'objet JSON
    return Car(
        id: s.id,
        attributes: s.attributes,
        createdAt: s.createdAt,
        updatedAt: s.updatedAt,
        publishedAt: s.publishedAt,
        locale: s.locale,
        model: s.model);
  }

  // Accesseur qui retourne le numéro de chassis de la voiture (à partir du modèle de la voiture)
  String get carChassisSerialNumber => model!.carChassisSerialNumber;
  // Accesseur qui retourne la disponibilité de la voiture (à partir du modèle de la voiture)
  bool get carAvailability => model!.carAvailability;
  // Accesseur qui retourne le numéro d'immatriculation de la voiture (à partir du modèle de la voiture)
  String get carPlateNumber => model!.carPlateNumber;
  // Accesseur qui retourne le kilométrage de la voiture (à partir du modèle de la voiture)
  int get carKilometers => model!.carKilometers;
  // Accesseur qui retourne la couleur de la voiture (à partir du modèle de la voiture)
  String get carColor => model!.carColor;
  // Accesseur qui retourne la date d'ajout de la voiture en DB (à partir du modèle de la voiture)
  DateTime get carDateAdded => model!.carDateAdded;
  // Accesseur qui retourne le prix de vente de la voiture (à partir du modèle de la voiture)
  int get carSalePrice => model!.carSalePrice;
  // Accesseur qui retourne le prix de location journalier de la voiture (à partir du modèle de la voiture)
  int get carReservationDailyPrice => model!.carReservationDailyPrice;
  // Accesseur qui retourne le modèle de la voiture (à partir du modèle de la voiture)
  CarModel? get carModel => model!.carModel;
}
