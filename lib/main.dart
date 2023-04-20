import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './providers/comics.dart';
import './screens/main_screen.dart';
import './screens/comic_screen.dart';
import './screens/reader_screen.dart';
import './screens/catalog_screen.dart';
import './screens/favorite_screen.dart';
import './screens/reading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Comics(),
        ),
      ],
      child: MaterialApp(
        title: 'ManLang',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
        routes: {
          ComicScreen.routeName: (ctx) => const ComicScreen(),
          ReaderScreen.routeName: (ctx) => const ReaderScreen(),
          CatalogScreen.routeName: (ctx) => const CatalogScreen(),
          FavoriteScreen.routeName: (ctx) => const FavoriteScreen(),
          ReadingScreen.routeName: (ctx) => const ReadingScreen(),
        },
      ),
    );
  }
}
