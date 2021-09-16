import 'package:facebook/models/story_model.dart';
import 'package:facebook/models/user_model.dart';
import 'package:facebook/shared/styles/colors.dart';
import 'package:facebook/widgets/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ShowStories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  ShowStories({
    required this.currentUser,
    required this.stories,
  });


  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      height: 240.0,
      padding: const EdgeInsets.all(10.0),
      color: isDarkMode ? blackHeader : Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _createStoryContainer(user: currentUser);
          }
          return _storyContainer(story: stories[index - 1]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10.0,
          );
        },
      ),
    );
  }

  Widget _storyContainer({required Story story}) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? darkStoryContainerColor : lightStoryContainerColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: 100.0,
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                story.imageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            Positioned(
              top: 8.0,
              left: 8.0,
              child: UserAvatar(
                imgUrl: story.user.imageUrl,
                isStory: true,
                isViewed: story.isViewed,
              ),
            ),
            Positioned(
              bottom: 8.0,
              left: 8.0,
              child: Text(
                "${story.user.name}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createStoryContainer({required User user}) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Card(
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? darkStoryContainerColor : lightStoryContainerColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: 100.0,
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                user.imageUrl,
                fit: BoxFit.cover,
                height: 150,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            Positioned(
              top: 130.0,
              right: 30,
              child: Center(
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: facebookBlue,
                    border: Border.all(
                      width: 2.0,
                      color: isDarkMode ? darkStoryContainerColor : lightStoryContainerColor,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
             Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Text(
                "Create Story",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color:isDarkMode ? Colors.white:Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
