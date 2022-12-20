// Cette classe représente un événement de voiture.
class CarEvent {
  CarEvent(
    this.id,
    this.carEventStartDate,
    this.carEventEndDate,
    this.carEventType,
    this.carEventAvailabilityForRent,
    this.carEventAvailabilityForSale,
    this.carEventAddDate,
    this.carEventDescription,
  );

  // L'ID de l'événement de voiture.
  int id;
  // La date de début de l'événement.
  DateTime carEventStartDate;
  // La date de fin de l'événement.
  DateTime carEventEndDate;
  // Le type d'événement.
  String carEventType;
  // La disponibilité de la voiture pour la location pendant l'événement.
  bool carEventAvailabilityForRent;
  // La disponibilité de la voiture pour la vente pendant l'événement.
  bool carEventAvailabilityForSale;
  // La date à laquelle l'événement de voiture a été ajouté.
  DateTime carEventAddDate;
  // La description de l'événement de voiture.
  String carEventDescription;
}
