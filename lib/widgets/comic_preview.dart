import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

import '../screens/comic_screen.dart';

class ComicPreview extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;

  const ComicPreview(
      {super.key,
      required this.id,
      required this.imageUrl,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed(ComicScreen.routeName, arguments: id),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 180,
              width: 120,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: 120,
            padding: const EdgeInsets.all(5),
            child: Text(
              name,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
