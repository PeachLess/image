import 'package:flutter/material.dart';
import 'package:image/providers/comics.dart';

import '../widgets/app_drawer.dart';
import '../widgets/comic_list.dart';

class ReadingScreen extends StatelessWidget {
  static const routeName = '/reading';

  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Читаю'),
      ),
      body: const ComicList(
        status: ListComics.reading,
      ),
      drawer: const AppDrawer(),
    );
  }
}
