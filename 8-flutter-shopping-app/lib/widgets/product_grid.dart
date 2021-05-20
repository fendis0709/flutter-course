import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/products.dart';
import 'package:flutter_udemy_shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorites;

  ProductGrid(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Products>(context);
    final products = showFavorites ? provider.favorites : provider.all;

    return products.length > 0
        ? GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            itemBuilder: (_context, _index) => ChangeNotifierProvider.value(
              value: products[_index],
              child: ProductItem(),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
          )
        : Center(
            child: Text('No data'),
          );
  }
}
