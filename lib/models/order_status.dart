// Classe qui représente le status d'une commande
class OrderStatus {
  // Constructeur de la classe OrderStatus
  OrderStatus(
    this.id,
    this.orderStatusDescription,
  );

  // Identifiant unique pour chaque status de commande
  int id;
  // Description du status d'une commande
  String orderStatusDescription;
}
