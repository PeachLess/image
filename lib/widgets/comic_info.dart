import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:provider/provider.dart';
import '../providers/comics.dart';
import 'package:image/screens/reader_screen.dart';

class ComicInfo extends StatefulWidget {
  final String comId;
  const ComicInfo({super.key, required this.comId});

  @override
  State<ComicInfo> createState() => _ComicInfoState();
}

class _ComicInfoState extends State<ComicInfo> {
  bool isEng = true;

  void translate() {
    setState(() {
      isEng = !isEng;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currComic = Provider.of<Comics>(
      context,
      listen: false,
    ).findById(widget.comId);
    final startReading = Provider.of<Comics>(context).startReading;
    return DraggableScrollableSheet(
        initialChildSize: .6,
        minChildSize: .4,
        maxChildSize: .9,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          isEng ? currComic.engName : currComic.rusName,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => translate(),
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.blue.withOpacity(0.1),
                            foregroundColor: Colors.white),
                        child: const Icon(Icons.translate),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ExpandableText(
                    style: const TextStyle(fontSize: 16),
                    isEng ? currComic.engDescription : currComic.rusDescription,
                    expandText: isEng ? '   show more' : '   подробнее',
                    collapseText: isEng ? '   show less' : '  свернуть',
                    maxLines: 3,
                    linkColor: Colors.blue,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    isEng ? 'Chapters' : 'Главы',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      controller: scrollController,
                      itemBuilder: (context, ind) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    ReaderScreen.routeName,
                                    arguments: Arguments(currComic.id, ind));
                                if (!currComic.isReading) {
                                  startReading(currComic.id);
                                }
                              },
                              child: Text(isEng
                                  ? 'Chapter ${ind + 1}'
                                  : 'Глава ${ind + 1}')),
                        ],
                      ),
                      itemCount: currComic.rusChapters.length,
                    ),
                  ),
                ],
              ));
        });
  }
}
