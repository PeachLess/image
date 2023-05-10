import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chapter {
  final List<String> images;

  Chapter({required this.images});
}

class Comic with ChangeNotifier {
  final String id;
  final String rusName;
  final String engName;
  final String rusDescription;
  final String engDescription;
  final String imageUrl;
  final List<Chapter> rusChapters;
  final List<Chapter> engChapters;
  bool isFavorite;
  bool isReading;

  Comic(
      {required this.id,
      required this.rusName,
      required this.engName,
      required this.rusDescription,
      required this.engDescription,
      required this.imageUrl,
      required this.rusChapters,
      required this.engChapters,
      this.isFavorite = false,
      this.isReading = false});

  factory Comic.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    List<Chapter> rusChapters = [];
    List<Chapter> engChapters = [];
    data['chapters']['rus'].values.forEach((ch) {
      rusChapters.add(Chapter(images: List<String>.from(ch)));
    });
    data['chapters']['eng'].values.forEach((ch) {
      engChapters.add(Chapter(images: List<String>.from(ch)));
    });
    return Comic(
        id: snapshot.id,
        rusName: data['name']['rus'],
        engName: data['name']['eng'],
        rusDescription: data['description']['rus'],
        engDescription: data['description']['eng'],
        imageUrl: data['imageUrl'],
        rusChapters: rusChapters,
        engChapters: engChapters);
  }
}
