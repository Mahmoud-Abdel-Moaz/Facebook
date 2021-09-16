import 'package:facebook/shared/data/data.dart';
import 'package:facebook/shared/styles/colors.dart';
import 'package:facebook/widgets/circular_icon_button.dart';
import 'package:facebook/widgets/post_container.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:facebook/widgets/show_stories.dart';
import 'package:facebook/widgets/write_post_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'hom_screen_mobile.dart';
import 'home_screen_desktop.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeScreenMobile(),
          desktop: HomeScreenDesktop(),
        ),
      ),
    );
  }
}
