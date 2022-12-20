// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatedAccountPage extends StatelessWidget{
  const CreatedAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Création d'un compte")
      ),
       body : Column(
            children: [
              const Text('Bonjour, votre inscription a bien été prise en compte. Elle sera active une fois que vous aurez valider notre lien envoyé par mail.'),
              ElevatedButton(
                onPressed: () => GoRouter.of(context).goNamed('login'),
                child: const Text("Connexion"),
              )
            ],
          ),
       )
    ;
  }
}
