// Classe qui représente un code postal
class Zipcode {
  // Constructeur de la classe Zipcode
  Zipcode(
    this.id,
    this.zipcodeName,
    this.zipCode,
  );

  // Identifiant unique pour chaque code postal
  int id;
  // Nom de la commune associée au code postal
  String zipcodeName;
  // Code postal
  int zipCode;
}
