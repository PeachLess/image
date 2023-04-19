import 'package:flutter/widgets.dart';

class Chapter {
  final List<String> images;

  Chapter({required this.images});
}

class Comic with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<Chapter> rusChapters;
  final List<Chapter> engChapters;
  bool isFavorite;
  bool isReading;

  Comic(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.rusChapters,
      required this.engChapters,
      this.isFavorite = false,
      this.isReading = false});
}
