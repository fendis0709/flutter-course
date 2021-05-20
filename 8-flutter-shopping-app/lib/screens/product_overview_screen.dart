import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/badge.dart';
import 'package:flutter_udemy_shop_app/providers/cart.dart';
import 'package:flutter_udemy_shop_app/screens/cart_items_screen.dart';
import 'package:flutter_udemy_shop_app/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterItem {
  All,
  Favorites,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterItem _value) {
              setState(() {
                if (_value == FilterItem.All) {
                  _showFavorites = false;
                } else {
                  _showFavorites = true;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterItem.All,
              ),
              PopupMenuItem(
                child: Text('Show favorites'),
                value: FilterItem.Favorites,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (BuildContext _context, Cart _cart, Widget _child) {
              return Badge(
                child: _child,
                value: _cart.itemCount.toString(),
              );
            },
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartItemScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ProductGrid(_showFavorites),
    );
  }
}
