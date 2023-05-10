import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

import 'package:provider/provider.dart';
import '../providers/comics.dart';

import './comic_tile.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final comics = Provider.of<Comics>(context).items;
    return IconButton(
        onPressed: () {
          showSearch(
              context: context,
              delegate: SearchPage(
                builder: (com) => ComicTile(comic: com),
                filter: (com) => [com.engName, com.rusName],
                items: comics,
                searchLabel: 'Поиск',
              ));
        },
        icon: const Icon(Icons.search));
  }
}
