import 'package:autobaloo/views/components/app_info.dart';
import 'package:autobaloo/views/components/autobaloo_logo.dart';
import 'package:autobaloo/views/components/navbar.dart';
import 'package:autobaloo/views/sections/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
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
                    Navigator.push(
                      context,
                      MaterialPageRoute<ProfileScreen>(
                        builder: (context) => ProfileScreen(
                            appBar: AppBar(
                              title: const Text('User Profile'),
                              backgroundColor: Colors.teal.shade300,
                            ),
                            actions: [
                              SignedOutAction((context) {
                                Navigator.of(context).pop();
                              })
                            ],
                          children: [
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(2),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset('images/ab-ambiant1.png'),
                              ),
                            ),
                          ]),
                      ),
                    );
                    // GoRouter.of(context).push('/account');
                  },
                ),
                const AppInfo()
              ],
              automaticallyImplyLeading: false,
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
