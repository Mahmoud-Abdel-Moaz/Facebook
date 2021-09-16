import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:facebook/layouts/facebook_layout/facebook_layout.dart';
import 'package:facebook/modules/splash_screen/splash_screen.dart';
import 'package:facebook/shared/bloc_observer.dart';
import 'package:facebook/shared/styles/themes.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'modules/home_module/home_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook',
      theme: lightTheme,
      darkTheme: darkTheme,
      home:  ( Platform.isIOS||Platform.isAndroid)?SplashScreen():FacebookLayout(),
    );
  }
}
