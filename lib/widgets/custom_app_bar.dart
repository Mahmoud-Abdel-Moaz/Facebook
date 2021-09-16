import 'package:facebook/models/user_model.dart';
import 'package:facebook/shared/styles/colors.dart';
import 'package:facebook/widgets/custom_tab_bar.dart';
import 'package:facebook/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circular_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final List<IconData> selectedIcons;
  final int selectedIndex;
  final Function(int) onTap;

  CustomAppBar(
      {required this.currentUser,
      required this.icons,
      required this.selectedIcons,
      required this.selectedIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: isDarkMode ? blackHeader : Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded
          (child:Text(
            'facebook',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 32.0
            ),
          ),),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(icons: icons,selectedIcons: selectedIcons, selectedIndex: selectedIndex, onTap: onTap,isBottomIndicator:true),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(currentUser:currentUser),
                const SizedBox(width: 12.0,),
                CircularIconButton(icon: MdiIcons.facebookMessenger, onPressed: (){},iconSize: 28.0,),
                CircularIconButton(icon: MdiIcons.bellOutline, onPressed: (){},iconSize: 28.0,),
                CircularIconButton(icon: Icons.arrow_drop_down, onPressed: (){},iconSize: 28.0,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
