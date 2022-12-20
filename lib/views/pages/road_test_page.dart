import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoadTestPage extends StatelessWidget{
  const RoadTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Réserver un essai routier')
      ),
      body : Column(
        children: [
          const Text('Bonjour, votre inscription a bien été prise en compte. Elle sera active une fois que vous aurez valider notre lien envoyé par mail.'),
          ElevatedButton(
            onPressed: () => GoRouter.of(context).goNamed('login'),
            child: const Text('Connexion'),
          )
        ],
      ),
    )
    ;
  }
}

// L'utilisateur doit être connecté
// Bloc sélection de date (calendrier) avec disponibilités
// Slots d'heures
// - Pickup
// - Retour
// Bloc addresse Showroom
// Bouton "louer voiture"
