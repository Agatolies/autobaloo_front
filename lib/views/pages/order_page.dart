import 'package:autobaloo/views/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderPage extends StatelessWidget{
  const OrderPage({super.key});

  //TODO si pas connecté, retour vers la page login

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => GoRouter.of(context).goNamed('order-confirmation'),
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
                      maximumSize: const Size(320, 150),
                      padding: const EdgeInsets.all(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("Commander et payer l'acompte"),
                      Icon(Icons.arrow_circle_right_outlined),
                    ],
                  )),
            ],
          )
        ],
      );
  }
}


// Si pas connecté --> renvoi vers Login
// Résumé de la voiture
// Image de la voiture
// Formulaire (récupération des données clients)
// Bloc récapitulatif avec montant acompte
// CheckBox je valide
// Bouton paiement Stripe
// Redirection --> Account (pour voir le statut de l'achat)