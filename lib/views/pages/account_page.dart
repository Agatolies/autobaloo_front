import 'package:autobaloo/views/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';

import '../sections/title_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(children: [
      Text(
        'Welcome!',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      const SignOutButton(),
      Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: const PageSection(
            titleEvent: 'Bienvenue sur votre compte',
            //TODO : insérer un formulaire reprenant les données utilisateurs
            widget: Text('David Scarafone'),
          ),
      ),
      Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: const PageSection(
          titleEvent: 'Vos achats',
          //TODO : insérer un récapitulatif des achats de l'utilisateur
          widget: Text("Vous n'avez aucun achat pour l'instant"),
        ),
      ),
      Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: const PageSection(
          titleEvent: 'Vos réservations',
          // TODO: insérer un récaptilatif des futures location de l'utilisateur
          widget: Text("Vous n'avez aucune réservation pour l'instant"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => GoRouter.of(context).goNamed('home'),
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.teal.shade300,
                    elevation: 4,
                    alignment: Alignment.centerLeft,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    maximumSize: const Size(200, 150),
                    padding: const EdgeInsets.all(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Accueil"),
                    Icon(Icons.arrow_circle_right_outlined),
                  ],
                )),
          ],
        ),
      )
    ]);
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
