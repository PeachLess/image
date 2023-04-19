import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/comics.dart';
import '../screens/comic_screen.dart';

class ComicList extends StatelessWidget {
  final bool isFav;
  final bool isReading;
  const ComicList({super.key, required this.isFav, required this.isReading});

  @override
  Widget build(BuildContext context) {
    final comics = isFav
        ? Provider.of<Comics>(context).favoriteItems
        : isReading
            ? Provider.of<Comics>(context).readingItems
            : Provider.of<Comics>(context).items;
    return ListView.builder(
      itemBuilder: (context, ind) {
        return GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(ComicScreen.routeName, arguments: comics[ind].id),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 180,
                    width: 120,
                    child: Image.network(
                      comics[ind].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comics[ind].name,
                          style: const TextStyle(fontSize: 22),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          comics[ind].description,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: comics.length,
    );
  }
}
