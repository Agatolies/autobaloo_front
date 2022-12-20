import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer votre compte sur AutoBaloo')
      ),
    );
  }
}

//	Nom
// Prénom
// Numéro de permis
// Adresse e-mail
//	Mdp
//	Confirmation Mdp
//	Bouton "créer mon compte". Redirection -> Page Compte créé
