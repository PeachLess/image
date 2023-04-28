import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image/providers/comic.dart';
import 'package:image/screens/comic_screen.dart';
import 'package:provider/provider.dart';
import '../providers/comics.dart';

class Arguments {
  final String id;
  final int chapter;

  Arguments(this.id, this.chapter);
}

class ReaderScreen extends StatefulWidget {
  static const routeName = '/reader';

  const ReaderScreen({super.key});

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  final _scrollController = ScrollController();
  bool isEng = false;

  void translate() {
    setState(() {
      isEng = !isEng;
    });
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Arguments;
    final currComic = Provider.of<Comics>(
      context,
      listen: false,
    ).findById(arg.id);

    ListView rusChapters = chapters(currComic.rusChapters[arg.chapter]);
    ListView engChapters = chapters(currComic.engChapters[arg.chapter]);

    List<Widget> stackChildren =
        isEng ? [engChapters, rusChapters] : [rusChapters, engChapters];

    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () => translate(),
        child: Stack(children: stackChildren),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          currComic.rusChapters.asMap().containsKey(arg.chapter + 1)
              ? Navigator.of(context).pushReplacementNamed(
                  ReaderScreen.routeName,
                  arguments: Arguments(arg.id, arg.chapter + 1))
              : Navigator.pop(context);
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  ListView chapters(Chapter chapter) {
    ListView chapters = ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, ind) {
        return CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageUrl: chapter.images[ind],
          fit: BoxFit.cover,
        );
      },
      itemCount: chapter.images.length,
    );
    return chapters;
  }
}
