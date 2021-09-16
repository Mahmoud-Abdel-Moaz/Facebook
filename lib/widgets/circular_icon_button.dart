import 'package:facebook/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CircularIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;
  final double iconSize;


   CircularIconButton({required this.icon, required this.onPressed, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: isDarkMode?blackIconContainer:whiteIconContainer,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: isDarkMode?whiteIcon:blackIcon,
        iconSize: iconSize,
        onPressed: ()=>onPressed,
      ),
    );
  }
}
