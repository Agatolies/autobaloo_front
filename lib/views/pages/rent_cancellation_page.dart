import 'package:autobaloo/views/components/cancelled_image.dart';
import 'package:autobaloo/views/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RentCancellationPage extends StatelessWidget {
  const RentCancellationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(children: [
      const CancelledImage(),
      const Text('Votre réservation a bien été annulée.'),
      //TODO : ajouter un formulaire d'inscription
      Container(
        margin: const EdgeInsets.only(top: 30, right: 30, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: ElevatedButton(
                  onPressed: () => context.goNamed('home'),
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
                      Text('Accueil'),
                      Icon(Icons.arrow_circle_right_outlined),
                    ],
                  )),
            ),
          ],
        ),
      )
    ]);
  }
}
