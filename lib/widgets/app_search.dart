import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

import 'package:provider/provider.dart';
import '../providers/comics.dart';

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
                builder: (com) => ListTile(
                  title: Text(com.name),
                  subtitle: Text(com.description),
                ),
                filter: (com) => [
                  com.name,
                  com.description,
                ],
                items: comics,
                searchLabel: 'Поиск',
                // searchStyle: const TextStyle(color: Colors.white)
              ));
        },
        icon: const Icon(Icons.search));
  }
}
