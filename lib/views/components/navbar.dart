import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            //TODO : changer avec les paramètres du compte utilisateur
            accountName: const Text('accountName'),
            accountEmail: const Text('accountEmail'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/user.png',
                    width: 90, height: 90, fit: BoxFit.cover),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage(
                    'images/NavBar_image.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () => context.goNamed('home'),
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Mon compte'),
            onTap: () => context.goNamed('account'),
          ),
          ListTile(
            leading: const Icon(Icons.car_rental),
            title: const Text('Catalogue'),
            onTap: () => context.goNamed('catalog'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Connexion'),
            onTap: () => context.goNamed('login'),
          ),
          ListTile(
            leading: const Icon(Icons.signpost),
            title: const Text('Enregistrement'),
            onTap: () => context.goNamed('register'),
          ),
        ],
      ),
    );
  }
}
