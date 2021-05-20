import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(context).find(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_outline,
            ),
            onPressed: () => null,
            color: Theme.of(context).accentColor,
          ),
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
            ),
            color: Theme.of(context).accentColor,
            onPressed: () => null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'USD ${product.price}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
