// Classe qui représente une commande
class Order {
  // Constructeur de la classe Order
  Order(
    this.id,
    this.orderPurchaseDate,
  );

  // Identifiant unique pour chaque commande
  int id;
  // Date d'achat de la commande
  DateTime orderPurchaseDate;
}
