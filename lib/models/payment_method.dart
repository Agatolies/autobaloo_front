// Classe qui représente une méthode de paiement
class PaymentMethod {
  // Constructeur de la classe PaymentMethod
  PaymentMethod(
    this.id,
    this.paymentMethodName,
    this.paymentMethodIsActive,
  );

  // Identifiant unique pour chaque méthode de paiement
  int id;
  // Nom de la méthode de paiement
  String paymentMethodName;
  // Booléen qui spécifie si la méthode de paiement est active
  bool paymentMethodIsActive;
}
