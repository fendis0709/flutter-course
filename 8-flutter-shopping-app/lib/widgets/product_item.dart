import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/product.dart';
import 'package:flutter_udemy_shop_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
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
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_outline,
                ),
                color: Theme.of(context).accentColor,
                onPressed: () => product.toggleIsFavorite(),
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
