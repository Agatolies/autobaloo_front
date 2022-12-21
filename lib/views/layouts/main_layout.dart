import 'package:autobaloo/views/components/app_info.dart';
import 'package:autobaloo/views/components/autobaloo_logo.dart';
import 'package:autobaloo/views/components/navbar.dart';
import 'package:autobaloo/views/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: AppBar(
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
            ),
            drawer: const NavBar(),
            body: ListView(
              children: [...children, const FooterSection()],
            ));
      },
    );
  }
}
