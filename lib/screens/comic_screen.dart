import 'package:flutter/material.dart';
import 'package:image/screens/reader_screen.dart';
import 'package:provider/provider.dart';
import '../providers/comics.dart';
import '../providers/comic.dart';

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
    final startReading = Provider.of<Comics>(context).startReading;
    return Scaffold(
      appBar: AppBar(
        title: Text(currComic.name),
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
            Positioned(
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currComic.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ListView.builder(
                                  itemBuilder: (context, ind) => TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            ReaderScreen.routeName,
                                            arguments:
                                                Arguments(currComic.id, ind));
                                        if (!currComic.isReading) {
                                          startReading(currComic.id);
                                        }
                                        ;
                                      },
                                      child: Text('Глава ${ind + 1}')),
                                  itemCount: currComic.rusChapters.length,
                                );
                              });
                        },
                        child: const Text('Главы')),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pushNamed(ReaderScreen.routeName,
                arguments: Arguments(currComic.id, 0));
            if (!currComic.isReading) startReading(currComic.id);
          },
          label: Text('Читать')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
