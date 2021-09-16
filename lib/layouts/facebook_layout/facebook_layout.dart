
import 'package:facebook/shared/cubit/cubit.dart';
import 'package:facebook/shared/cubit/states.dart';
import 'package:facebook/shared/data/data.dart';
import 'package:facebook/widgets/circular_icon_button.dart';
import 'package:facebook/widgets/custom_app_bar.dart';
import 'package:facebook/widgets/custom_tab_bar.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FacebookLayout extends StatelessWidget {

  final _appBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          AppCubit cubit=AppCubit.get(context);
          return DefaultTabController(
            length: cubit.screens.length,
            child: Scaffold(
               appBar: Responsive.isDesktop(context)?PreferredSize(child: CustomAppBar(currentUser:currentUser,selectedIndex: cubit.selectedIndex,icons:cubit.screensIcons,selectedIcons: cubit.screensSelectedIcons,onTap: (index)=>cubit.changeTabBarViewer(index)), preferredSize: Size(screenSize.width,100)):null,

            body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    if(!Responsive.isDesktop(context)&& Platform.isAndroid)
                    SliverAppBar(
                      title: Text(
                        'facebook',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      centerTitle: false,
                      //  floating: true,
                      actions: [
                        CircularIconButton(icon: Icons.search, onPressed: (){},iconSize: 28.0,),
                        CircularIconButton(icon: MdiIcons.facebookMessenger, onPressed: (){},iconSize: 28.0,),
                      ],
                      pinned: true,
                      floating: true,
                      snap: true,
                      forceElevated: innerBoxIsScrolled,
                      bottom: PreferredSize(child: Material(elevation:1,child: CustomTabBar(selectedIndex: cubit.selectedIndex,icons:cubit.screensIcons,onTap: (index)=>cubit.changeTabBarViewer(index),selectedIcons: cubit.screensSelectedIcons,isBottomIndicator: true,)), preferredSize: Size(screenSize.width,56)),
                    ),
                  ];
                }, body: IndexedStack(index: cubit.selectedIndex,children:cubit.screens,),
              ),
                  bottomNavigationBar: (!Responsive.isDesktop(context)&& Platform.isIOS)?CustomTabBar(icons: cubit.screensIcons,selectedIndex: cubit.selectedIndex,selectedIcons: cubit.screensSelectedIcons,onTap: (index)=>cubit.changeTabBarViewer(index)):null,
// ),
               ),
          );
        },
      ),
    );
  }
}