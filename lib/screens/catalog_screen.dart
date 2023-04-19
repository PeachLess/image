import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/comic_list.dart';

class CatalogScreen extends StatelessWidget {
  static const routeName = '/catalog';

  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const ComicList(
        isFav: false,
        isReading: false,
      ),
      drawer: const AppDrawer(),
    );
  }
}
