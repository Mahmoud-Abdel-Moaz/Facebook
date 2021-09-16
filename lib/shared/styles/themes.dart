import 'package:facebook/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme=ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: lightScaffold,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
        ),
    ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: facebookBlue,
      letterSpacing: -1.2,
    ),
  ),
    iconTheme: const IconThemeData(
        color: Colors.black
    ),
);

ThemeData darkTheme=ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: darkScaffold,
  appBarTheme: const AppBarTheme(
    backgroundColor: blackHeader,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: blackHeader,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: -1.2,
    ),
  ),
  iconTheme: const IconThemeData(
      color: Colors.white
  ),
);