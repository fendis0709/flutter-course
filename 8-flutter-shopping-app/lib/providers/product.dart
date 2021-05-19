import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite = false;

  Product({
    @required this.id,
    @required this.name,
    this.description,
    this.imageUrl,
    this.price,
  });

  void toggleIsFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
    print('TOGGLE FAVORITE - $name');
  }
}
