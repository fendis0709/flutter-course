import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/models/product.dart';
import 'package:flutter_udemy_shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_context) {
                    return ProductDetailScreen(product);
                  },
                ),
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                icon: Icon(Icons.favorite_outline),
                color: Theme.of(context).accentColor,
                onPressed: () => null,
              ),
              title: Text(
                product.name,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                ),
                color: Theme.of(context).accentColor,
                onPressed: () => null,
              )),
        ),
      ),
    );
  }
}
