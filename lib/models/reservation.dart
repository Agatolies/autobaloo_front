// Classe qui représente une réservation
class Reservation {
  // Constructeur de la classe Reservation
  Reservation(
    this.id,
    this.reservationDailyPrice,
    this.reservationDatePayment,
  );

  // Identifiant unique pour chaque objet de la classe Reservation
  int id;
  // Prix journalier de la réservation
  double reservationDailyPrice;
  // Date de paiement de la réservation
  DateTime reservationDatePayment;
}
