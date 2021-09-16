import 'package:facebook/models/user_model.dart';
import 'package:facebook/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WritePostContainer extends StatelessWidget {
  final User currantUser;

  WritePostContainer({required this.currantUser});

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      decoration:  BoxDecoration(color: isDarkMode?blackHeader:Colors.white),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundColor: blackHeader,
                  backgroundImage:
                      NetworkImage(currantUser.imageUrl),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: writePostDividerColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      "what's on your mind?",
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: writePostDividerColor,
            thickness: 1,
          ),
          Container(
            height: 40,
              padding: EdgeInsets.only(bottom: 5),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTextButtonIcon(
                  onPressed: () {},
                  icon: Icons.videocam_rounded,
                  iconColor: Colors.red,
                  label: "Live"),
              const VerticalDivider(
                width: 8.0,
                color: writePostDividerColor,
              ),
              buildTextButtonIcon(
                  onPressed: () {},
                  icon: Icons.photo_library_outlined,
                  iconColor: Colors.lightGreen,
                  label: "Photo"),
              const VerticalDivider(
                width: 8.0,
                color: writePostDividerColor,
              ),
              buildTextButtonIcon(
                  onPressed: () {},
                  icon: Icons.video_call,
                  iconColor: Colors.deepPurpleAccent,
                  label: "Room"),
            ],
          ))
        ],
      ),
    );
  }

  Widget buildTextButtonIcon({
    required Function onPressed,
    required IconData icon,
    required Color iconColor,
    required String label,
  }) {
    return TextButton.icon(
      onPressed: () => onPressed,
      icon: Icon(
        icon,
        color: iconColor,
      ),
      label: Text(
        "$label",
        style: TextStyle(
          color: writePostIconTextColor,
        ),
      ),
    );
  }
}
