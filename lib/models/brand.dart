import 'package:autobaloo/models/strapi_common/strapi_document.dart';
import 'package:autobaloo/models/strapi_common/strapi_image.dart';

// Classe qui contient les attributs d'une marque
class BrandAttributes {
  // Constructeur de BrandAttributes qui prend en paramètre le nom de la marque et son logo
  BrandAttributes({required this.brandName, this.brandLogo});

  // Factory qui crée une instance de BrandAttributes à partir d'un objet JSON
  factory BrandAttributes.fromJson(Map<String, dynamic> json) {
    // Récupère les attributs dans l'objet JSON
    final attributes = json['attributes'];

    // Renvoie une instance de BrandAttributes avec les informations de l'objet JSON
    return BrandAttributes(
        brandName: attributes['brand_name'],
        brandLogo: attributes.containsKey('brand_logo')
            ? StrapiImage.fromJson(attributes['brand_logo']['data'])
            : null);
  }

  // Nom de la marque
  String brandName;
  // Logo de la marque (optionnel)
  StrapiImage? brandLogo;
}

// Classe qui représente une marque
class Brand extends StrapiDocument<BrandAttributes> {
  // Constructeur de Brand qui hérite de StrapiDocument et qui prend en
  // paramètre l'ID, les attributs, la date de création, la date de modification,
  // la date de publication, la langue et le modèle de la marque
  Brand({
    required super.id,
    required super.attributes,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    super.locale,
    super.model,
  }) : super();


  // Factory qui crée une instance de Brand à partir d'un objet JSON
  factory Brand.fromJson(Map<String, dynamic> json) {
    // Crée une instance de StrapiDocument<BrandAttributes> à partir de l'objet JSON
    final s = StrapiDocument<BrandAttributes>.fromJson(
        json, BrandAttributes.fromJson);

    // Renvoie une instance de Brand avec les informations de l'objet JSON
    return Brand(
        id: s.id,
        attributes: s.attributes,
        createdAt: s.createdAt,
        updatedAt: s.updatedAt,
        publishedAt: s.publishedAt,
        locale: s.locale,
        model: s.model);
  }
  // Accesseur qui retourne le nom de la marque (à partir du modèle de la marque)
  String? get brandName => model?.brandName;
  // Accesseur qui retourne le logo de la marque (à partir du modèle de la marque)
  StrapiImage? get brandLogo => model?.brandLogo;
}
