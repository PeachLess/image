import 'package:flutter/material.dart';
import 'package:image/providers/comics.dart';
import 'package:provider/provider.dart';

import '../widgets/app_search.dart';
import '../widgets/app_drawer.dart';
import '../widgets/comic_carousel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Comics>(context, listen: false).getComics();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManLang'),
        actions: const [AppSearch()],
      ),
      body: SingleChildScrollView(
        child: Column(children: const [
          SizedBox(
            height: 20,
          ),
          ComicCarousel(name: 'Last viewed'),
          ComicCarousel(name: 'New'),
          ComicCarousel(name: 'Most viewed'),
        ]),
      ),
      drawer: const AppDrawer(),
    );
  }
}
