import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/comics.dart';
import '../widgets/comic_info.dart';

class ComicScreen extends StatelessWidget {
  static const routeName = '/comic';
  const ComicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final comicId = ModalRoute.of(context)!.settings.arguments as String;
    final currComic = Provider.of<Comics>(
      context,
      listen: false,
    ).findById(comicId);
    final toggleFav = Provider.of<Comics>(context).toggleFav;
    return Scaffold(
      appBar: AppBar(
        title: Text(currComic.engName),
        actions: [
          IconButton(
              onPressed: () => toggleFav(currComic.id),
              icon: Icon(
                currComic.isFavorite ? Icons.favorite : Icons.favorite_border,
              ))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(currComic.imageUrl,
                width: MediaQuery.of(context).size.width, fit: BoxFit.contain),
            ComicInfo(comId: comicId)
          ],
        ),
      ),
    );
  }
}
