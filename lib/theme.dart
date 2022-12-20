import 'package:flutter/material.dart';

final autoBalooTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurple,
    foregroundColor: Colors.white,
  ),

  // Define the default font family.
  fontFamily: 'Georgia',

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14, fontFamily: 'Hind'),
  ),
);
