import 'package:flutter/material.dart';

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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const ComicList(
        isFav: false,
        isReading: true,
      ),
      drawer: const AppDrawer(),
    );
  }
}
