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
            leading: Icon(Icons.home),
            title: Text('Главная'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Каталог'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(CatalogScreen.routeName),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Избранное'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(FavoriteScreen.routeName),
          ),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text('Читаю'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ReadingScreen.routeName),
          )
        ],
      ),
    );
  }
}
