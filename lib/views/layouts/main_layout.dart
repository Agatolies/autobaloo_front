import 'package:autobaloo/views/components/app_info.dart';
import 'package:autobaloo/views/components/autobaloo_logo.dart';
import 'package:autobaloo/views/components/navbar.dart';
import 'package:autobaloo/views/sections/footer_section.dart';
import 'package:flutter/material.dart';

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
              actions: const <Widget>[AppInfo()],
            ),
            drawer: const NavBar(),
            body: ListView(
              shrinkWrap: true,
              children: [...children, const FooterSection()],
            ));
      },
    );
  }
}
