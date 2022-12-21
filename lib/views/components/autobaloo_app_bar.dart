import 'package:autobaloo/views/components/app_info.dart';
import 'package:autobaloo/views/components/autobaloo_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AutoBalooAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AutoBalooAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const AutoBalooLogo(),
      backgroundColor: Colors.teal.shade300,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            context.goNamed('profile');
          },
        ),
        const AppInfo()
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
