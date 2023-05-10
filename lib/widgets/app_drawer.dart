import 'package:flutter/material.dart';

import '../screens/catalog_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/reading_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Main'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Catalog'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(CatalogScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(FavoriteScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('In progress'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ReadingScreen.routeName),
          )
        ],
      ),
    );
  }
}
