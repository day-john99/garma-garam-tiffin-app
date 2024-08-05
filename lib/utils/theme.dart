import 'package:flutter/material.dart';
//TextStyle headingTextStyle = const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);
// const TextStyle buttonTextStyle = TextStyle(color: Colors.white);
//
// const TextStyle choiceTextStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w300);
// const TextStyle subheadingTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  textTheme: textTheme,
);


TextTheme textTheme = const TextTheme(
  displayLarge: TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  displayMedium: TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  ),

  ///this one is self defined, and not taken from
  /// material design specification like rest all.
  /// Used in the main heading at auth pages,
  /// for text like "create you account"
  headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -1.5
  ),

  headlineMedium: TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineSmall: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),

  ///text like "Feature Product" in HomePage
  titleLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),

  ///text like "or signup with"
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),


  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),

  ///define as necessary
  //labelMedium: TextStyle(),


  labelSmall: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);