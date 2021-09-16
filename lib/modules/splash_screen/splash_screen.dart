import 'dart:async';

import 'package:facebook/layouts/facebook_layout/facebook_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Timer(
        Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FacebookLayout())));
    return Scaffold(
      body: Container(
        color: !isDarkMode?Colors.white:null,
        child: Center(
            child: Image.asset(isDarkMode?'assets/images/darkfacelogo.png':'assets/images/facelogo.png',),
        ),
      ),
    );
  }
}
