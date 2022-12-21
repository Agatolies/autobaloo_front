import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.info_outline_rounded),
      tooltip: 'Informations',
      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text("Développé par Laure D'Este et Jonathan Damico"))),
    );
  }
}
