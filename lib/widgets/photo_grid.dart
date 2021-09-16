import 'dart:math';
import 'package:flutter/material.dart';

class PhotoGrid extends StatelessWidget {
  final int maxImages;
  final List<String> imageUrls;
  final Function(int) onImageClicked;
  final Function onExpandClicked;

  PhotoGrid({
    required this.imageUrls,
    required this.onImageClicked,
    required this.onExpandClicked,
    this.maxImages = 4,
  });

  @override
  Widget build(BuildContext context) {
    var images = buildImages();
    double height = 400.0;
    return Container(
      height: height,
      width: double.infinity,
      child: Expanded(
        child: GridView(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            mainAxisExtent: (imageUrls.length > 2) ? (height / 2) : height,
          ),
          children: images,
        ),
      ),
    );
  }

  List<Widget> buildImages() {
    int numImages = imageUrls.length;
    return List<Widget>.generate(min(numImages, maxImages), (index) {
      String imageUrl = imageUrls[index];

      // If its the last image
      if (index == maxImages - 1) {
        // Check how many more images are left
        int remaining = numImages - maxImages;

        // If no more are remaining return a simple image widget
        if (remaining == 0) {
          return GestureDetector(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: () => onImageClicked(index),
          );
        } else {
          // Create the facebook like effect for the last image with number of remaining  images
          return GestureDetector(
            onTap: () => onExpandClicked(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(imageUrl, fit: BoxFit.cover),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Text(
                      '+' + remaining.toString(),
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return GestureDetector(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () => onImageClicked(index),
        );
      }
    });
  }
}
