import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: ProductGrid(),
    );
  }
}
