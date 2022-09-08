import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagerNetworkWidget extends StatelessWidget {
  const ImagerNetworkWidget({Key? key, required this.imagePath})
      : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: BoxFit.contain,
        imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image(
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
              ),
            ),
        placeholder: (context, url) => CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image(
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/wiximo.png"),
                ),
              ),
            ),
        imageUrl: imagePath);
  }
}
