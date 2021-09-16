import 'package:facebook/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final List<IconData> selectedIcons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  CustomTabBar(
      {required this.icons,
        required this.selectedIcons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          color: isDarkMode ? blackHeader : Colors.white,

      ),
      child: TabBar(
        onTap: onTap,
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          border: isBottomIndicator
              ? const Border(
                  bottom: BorderSide(color: facebookBlue),
                )
              : const Border(
                  top: BorderSide(color: facebookBlue),
                ),
        ),
        tabs: icons
            .asMap()
            .map(
              (i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    i == selectedIndex?selectedIcons[selectedIndex]:e,
                    color: i == selectedIndex
                        ? facebookBlue
                        : (isDarkMode ? darkIconColor : lightIconColor),
                    size: 30,
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}