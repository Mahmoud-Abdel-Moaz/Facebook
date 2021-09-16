import 'package:facebook/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imgUrl;
  final bool isActive;
  final bool isStory;
  final bool isViewed;

  UserAvatar({required this.imgUrl, this.isActive = false,this.isStory = false,this.isViewed = false,});

  @override
  Widget build(BuildContext context) {
    double radius=isStory?15.0:20.0;
    return Stack(children: [
      Container(
        padding: isStory?const EdgeInsets.all(1.0):null,
        decoration: BoxDecoration(
            shape:BoxShape.circle,
            border: isStory?Border.all(
              width: 2.0,
              color: isViewed?viewedStoryColor:unViewedStoryColor,
            ):null,
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: blackHeader,
          backgroundImage: NetworkImage(imgUrl),
        ),
      ),
       if(isActive)
       Positioned(
        bottom: 0.0,
        right: 0.0,
        child: Container(
          height: 15.0,
          width: 15.0,
          decoration: BoxDecoration(
            color: online,
            shape:BoxShape.circle,
            border: Border.all(
              width: 2.0,
              color: Colors.white,
            )
          ),
        ),
      ),
    ]);
  }
}
