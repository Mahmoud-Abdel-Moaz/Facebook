

import 'package:bloc/bloc.dart';
import 'package:facebook/models/post_model.dart';
import 'package:facebook/modules/home_module/home_screen.dart';
import 'package:facebook/shared/cubit/states.dart';
import 'package:facebook/shared/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  final List<Widget> screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> screensIcons = [
    Icons.home_outlined,
    MdiIcons.accountGroupOutline,
    Icons.ondemand_video_rounded,
    Icons.flag_outlined,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  final List<IconData> screensSelectedIcons = [
    Icons.home,
    MdiIcons.accountGroup,
    Icons.ondemand_video_rounded,
    Icons.flag,
    MdiIcons.bell,
    Icons.menu,
  ];

  int selectedIndex = 0;

  void changeTabBarViewer(int index) {
    selectedIndex = index;
    emit(AppChangeTabBarState());
  }
  List<Post>facePosts=[];

  void fetchData(){
    facePosts=posts;
    emit(AppFetchDataState());
    //print('AppFetchDataState');
  }

  void updateData(){
    emit(AppUpdatingDataState());
  }

}