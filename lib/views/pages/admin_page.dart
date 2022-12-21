import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatelessWidget{
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Page administrateur')
      ),
      body : Column(
        children: [
          ElevatedButton(
            onPressed: () => context.goNamed('login'),
            child: const Text('Connexion'),
          )
        ],
      ),
    )
    ;
  }
}
