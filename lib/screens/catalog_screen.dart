import 'package:flutter/material.dart';
import 'package:image/providers/comics.dart';

import '../widgets/app_drawer.dart';
import '../widgets/comic_list.dart';
import '../widgets/app_search.dart';

class CatalogScreen extends StatelessWidget {
  static const routeName = '/catalog';

  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: const [AppSearch()],
      ),
      body: const ComicList(
        status: ListComics.catalog,
      ),
      drawer: const AppDrawer(),
    );
  }
}
