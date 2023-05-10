import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/comic.dart';
import '../providers/comics.dart';
import '../widgets/comic_preview.dart';

class ComicCarousel extends StatelessWidget {
  final String name;
  final List<Comic> comics;

  const ComicCarousel({super.key, required this.name, required this.comics});

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
          itemCount: (comics.length >= 5) ? 6 : comics.length,
          itemBuilder: (BuildContext context, int ind) {
            if (ind == 5 && comics.length >= 5) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Icon(Icons.arrow_forward_rounded),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ComicPreview(
                  id: comics[ind].id,
                  imageUrl: comics[ind].imageUrl,
                  name: comics[ind].engName),
            );
          },
          scrollDirection: Axis.horizontal,
        ),
      )
    ]);
  }
}
