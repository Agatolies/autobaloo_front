import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreenPage extends StatelessWidget {
  const ErrorScreenPage({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 60,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              "Oops, cette page n'existe pas.",
              style: TextStyle(fontSize: 24, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.goNamed('home');
              },
              child: const Text("Revenir à la page d'accueil"),
            ),
          ],
        ),
      ),
    );
  }
}
