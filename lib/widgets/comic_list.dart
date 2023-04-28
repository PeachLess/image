import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/comics.dart';
import './comic_tile.dart';

class ComicList extends StatelessWidget {
  final ListComics status;
  const ComicList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    dynamic comics;
    final provider = Provider.of<Comics>(context);

    switch (status) {
      case ListComics.catalog:
        comics = provider.items;
        break;
      case ListComics.favorite:
        comics = provider.favoriteItems;
        break;
      case ListComics.reading:
        comics = provider.readingItems;
        break;
      default:
        comics = [];
        break;
    }

    return ListView.builder(
      itemBuilder: (context, ind) {
        return ComicTile(comic: comics[ind]);
      },
      itemCount: comics.length,
    );
  }
}
