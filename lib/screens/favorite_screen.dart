import 'package:flutter/material.dart';

import '../providers/comics.dart';
import '../widgets/app_drawer.dart';
import '../widgets/comic_list.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: const ComicList(
        status: ListComics.favorite,
      ),
      drawer: const AppDrawer(),
    );
  }
}
