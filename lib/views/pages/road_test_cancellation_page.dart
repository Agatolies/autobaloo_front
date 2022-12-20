import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoadTestCancellationPage extends StatelessWidget{
  const RoadTestCancellationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Essai routier annulé')
      ),
      body : Column(
        children: [
          const Text('Votre essai routier est annulé'),
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