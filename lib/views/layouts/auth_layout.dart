import 'package:autobaloo/views/components/app_info.dart';
import 'package:autobaloo/views/components/autobaloo_logo.dart';
import 'package:autobaloo/views/components/navbar.dart';
import 'package:autobaloo/views/sections/footer_section.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.teal.shade300,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const AutoBalooLogo(),
              backgroundColor: Colors.teal.shade300,
              actions: const <Widget>[AppInfo()],
            ),
            drawer: const NavBar(),
            body: Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset('images/ablogo.jpg', fit: BoxFit.fill)),
                Positioned(
                  right: 20,
                  left: constraints.maxWidth > 800 ? null : 20,
                  top: 20,
                  bottom: 20,
                  child: SingleChildScrollView(
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: children),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar:
                (constraints.maxWidth > 800) ? const FooterSection() : null,
          ),
        );
      },
    );
  }
}
