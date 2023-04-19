import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/comic_carousel.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManLang'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
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
