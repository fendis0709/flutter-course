import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/products.dart';
import 'package:flutter_udemy_shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Products>(context);
    final products = provider.products;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (BuildContext _context, int _index) =>
          ChangeNotifierProvider(
        create: (BuildContext _context) {
          return products[_index];
        },
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
    );
  }
}
