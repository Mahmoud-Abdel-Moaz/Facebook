import 'package:facebook/models/post_model.dart';
import 'package:facebook/shared/styles/colors.dart';
import 'package:facebook/widgets/photo_grid.dart';
import 'package:facebook/widgets/user_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({required this.post});

  @override
  Widget build(BuildContext context) {

    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: isDarkMode ? blackHeader : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _postHeader(post: post),
          if (post.caption != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${post.caption}',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          if (post.imageUrls != null)
            post.imageUrls!.length>1?PhotoGrid(
              imageUrls: post.imageUrls!,
              onImageClicked: (i) => print('Image $i was clicked!'),
              onExpandClicked: () => print('Expand Image was clicked'),
              maxImages: 4,
            ): Image.network(
               post.imageUrls![0],
               width: double.infinity,
              fit: BoxFit.cover,
            ),

          // Image.network(
          //   post.imageUrl ?? "none",
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          _postReacts(post: post),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: Colors.grey[600],
            ),
          ),
          _postActions(),
        ],
      ),
    );
  }

  Widget _postHeader({required Post post}) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          UserAvatar(imgUrl: post.user.imageUrl),
          const SizedBox(
            width: 5.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${post.user.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[
                          600] /*isDarkMode ? Colors.white : Colors.black*/,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _postReacts({required Post post}) {
    return Container(
      height: 35,
      margin: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          if (post.likes > 0)
            TextButton.icon(
              onPressed: () {},
              icon: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: facebookBlue, shape: BoxShape.circle),
                child: const Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 10.0,
                ),
              ),
              label: Text(
                "${post.likes}",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          const Spacer(),
          if (post.comments > 0)
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          if (post.comments > 0 && post.shares > 0)
            Text(
              ' • ',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          if (post.shares > 0)
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
        ],
      ),
    );
  }

  Widget _postActions() {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _actionButton(
            onPressed: () {},
            icon: MdiIcons.thumbUpOutline,
            label: "like",
          ),
          _actionButton(
            onPressed: () {},
            icon: MdiIcons.commentOutline,
            label: "Comment",
          ),
          _actionButton(
            onPressed: () {},
            icon: MdiIcons.shareOutline,
            label: "Share",
            size: 25,
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required Function onPressed,
    required IconData icon,
    required String label,
    double size = 20,
  }) {
    return TextButton.icon(
      onPressed: () => onPressed,
      icon: Icon(
        icon,
        size: size,
        color: Colors.grey[600],
      ),
      label: Text(
        "$label",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
