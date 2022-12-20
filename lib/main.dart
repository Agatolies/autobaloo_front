import 'package:autobaloo/routes.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:autobaloo/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  //  concrete binding for applications based on the Widgets framework
  WidgetsFlutterBinding.ensureInitialized();

  // Register Services
  await initializeServiceLocator();

  // Remove the /# in the url
  setPathUrlStrategy();

  // Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AutoBaloo',
      theme: autoBalooTheme,
      routerConfig: AutoBalooRouter().router,
    );
  }
}
