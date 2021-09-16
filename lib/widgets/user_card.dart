import 'package:facebook/models/user_model.dart';
import 'package:facebook/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {

  final User currentUser;

   UserCard({required this.currentUser}) ;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserAvatar(imgUrl: currentUser.imageUrl),
          const SizedBox(width: 6.0,),
          Text(
            currentUser.name.split(' ')[0],
            style: TextStyle(fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
