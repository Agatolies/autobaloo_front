import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget{
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Votre compte')
      ),
      body : Column(
        children: [
          ElevatedButton(
            onPressed: () => GoRouter.of(context).goNamed('home'),
            child: const Text('Connexion'),
          )
        ],
      ),
    )
    ;
  }
}

// Affichage des infos clients
// - Bouton modifier les données
// Statut de l'achat --> timeline
// - Préparation,
// - Nettoyage,
// - Document,
// - Entretient,
// - Prêt
// Partie "Essais routier"
// - Votre prochain essai routier : date/heure
// - Bouton ajout caliendrier
// - Bouton annuler l'essai --> annulation essai
// Partie "Location"
// - Vos prochaines locations
// -- Cartes récapitulatives (tickets d'embarquement like) (au click --> car_detail)
// --- Bouton annuler la location
// --- Bouton modifier la location
// --- Bouton "ajout au calendrier"
