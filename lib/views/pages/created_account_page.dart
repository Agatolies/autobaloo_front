// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../components/success_image.dart';
import '../layouts/main_layout.dart';

class CreatedAccountPage extends StatelessWidget{
  const CreatedAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      children: [
        const SuccessImage(),
        const Text(
          "Votre compte est désormais créé !",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, right: 30, bottom: 30),
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
      ],
    );
  }
}
