import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/models/product.dart';
import 'package:flutter_udemy_shop_app/widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> products = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (_context, _index) => ProductItem(
          products[_index],
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
      ),
    );
  }
}
