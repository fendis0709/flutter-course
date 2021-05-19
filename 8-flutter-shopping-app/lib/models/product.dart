import 'package:flutter/foundation.dart';

class Product {
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
}
