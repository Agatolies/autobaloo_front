// Classe qui représente un utilisateur
class User {
  // Constructeur de la classe User
  User(
      this.id,
      this.username,
      this.email,
      this.password,
      this.role,
      this.firstname,
      this.lastname,
      this.licenceId,
      this.birthdate,
      this.phoneNumber);

  // Identifiant unique pour chaque utilisateur
  int id;
  // Nom d'utilisateur choisi par l'utilisateur
  String username;
  // Adresse email de l'utilisateur
  String email;
  // Mot de passe de l'utilisateur (crypté ou hashé pour des raisons de sécurité)
  String password;
  // Rôle de l'utilisateur dans l'application (par exemple, "administrateur", "client", etc.)
  String role;
  // Prénom de l'utilisateur
  String firstname;
  // Nom de famille de l'utilisateur
  String lastname;
  // Numéro de permis de conduire de l'utilisateur
  String licenceId;
  // Date de naissance de l'utilisateur
  DateTime birthdate;
  // Numéro de téléphone de l'utilisateur
  int phoneNumber;
}
