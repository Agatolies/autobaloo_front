import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoadTestConfirmationPage extends StatelessWidget{
  const RoadTestConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Essai routier confirmé')
      ),
      body : Column(
        children: [
          const Text('Votre essai routier est confirmé'),
          ElevatedButton(
            onPressed: () => GoRouter.of(context).goNamed('account'),
            child: const Text('Votre compte'),
          )
        ],
      ),
    )
    ;
  }
}
