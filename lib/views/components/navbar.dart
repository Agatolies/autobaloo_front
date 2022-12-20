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
            onTap: () => GoRouter.of(context).goNamed('home'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.car_rental),
            title: const Text('Catalogue'),
            onTap: () => GoRouter.of(context).goNamed('catalog'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Connexion'),
            onTap: () => GoRouter.of(context).goNamed('login'),
          ),
          ListTile(
            leading: const Icon(Icons.signpost),
            title: const Text('Enregistrement'),
            onTap: () => GoRouter.of(context).goNamed('register'),
          ),
        ],
      ),
    );
  }
}
