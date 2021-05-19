import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 'c200',
      name: 'Cat 200',
      description: 'A cat with success response!',
      price: 29.99,
      imageUrl: 'https://http.cat/200.jpg',
    ),
    Product(
      id: 'c401',
      name: 'Cat 401',
      description: 'You shall not pass!',
      price: 59.99,
      imageUrl: 'https://http.cat/401.jpg',
    ),
    Product(
      id: 'cat429',
      name: 'Cat 429',
      description: 'Have you prepare for meals?!.',
      price: 19.99,
      imageUrl: 'https://http.cat/429.jpg',
    ),
    Product(
      id: 'c500',
      name: 'Cat 500',
      description: 'You screw up my server!',
      price: 49.99,
      imageUrl: 'https://http.cat/500.jpg',
    ),
  ];

  List<Product> get products {
    print('GETTER PRODUCTS');
    return [..._products];
  }

  Product find(id) {
    return _products.firstWhere((_product) => _product.id == id);
  }
}
