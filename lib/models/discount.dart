// Classe qui représente une réduction
class Discount {
  // Constructeur de la classe Discount
  Discount(
    this.id,
    this.discountName,
    this.discountStartDate,
    this.discountEndDate,
    this.discountPercent,
  );

  // Identifiant unique pour chaque objet de la classe Discount
  int id;
  // Nom de la réduction
  String discountName;
  // Date de début de la réduction
  DateTime discountStartDate;
  // Date de fin de la réduction
  DateTime discountEndDate;
  // Pourcentage de réduction
  double discountPercent;
}
