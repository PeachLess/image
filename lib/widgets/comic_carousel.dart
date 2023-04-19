import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/comics.dart';
import '../widgets/comic_preview.dart';

class ComicCarousel extends StatelessWidget {
  final String name;

  const ComicCarousel({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final comics = Provider.of<Comics>(context).items;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: comics.length,
          itemBuilder: (BuildContext context, int ind) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ComicPreview(
                id: comics[ind].id,
                imageUrl: comics[ind].imageUrl,
                name: comics[ind].name),
          ),
          scrollDirection: Axis.horizontal,
        ),
      )
    ]);
  }
}
