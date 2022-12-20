import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RentCancellationPage extends StatelessWidget{
  const RentCancellationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Location annulée')
      ),
      body : Column(
        children: [
          const Text('Votre location est annulée'),
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