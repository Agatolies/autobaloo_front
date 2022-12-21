import 'package:autobaloo/auth_gate.dart';
import 'package:autobaloo/firebase_options.dart';
import 'package:autobaloo/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:url_strategy/url_strategy.dart';

const clientId = 'YOUR_CLIENT_ID';

void main() async {
  //  concrete binding for applications based on the Widgets framework
  //  tells Flutter not to start running the application widget code until the Flutter framework is completely booted
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase integration
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configure Auth provides
  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
    const GoogleProviderConfiguration(clientId: clientId),
  ]);

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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthGate(),
    );
  }
}
