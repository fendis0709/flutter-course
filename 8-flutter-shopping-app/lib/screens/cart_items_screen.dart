import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/cart.dart';
import 'package:flutter_udemy_shop_app/widgets/cart_item.dart' as widget;
import 'package:provider/provider.dart';

class CartItemScreen extends StatelessWidget {
  const CartItemScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your cart'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(7),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Chip(
                      label: Text('USD ${cart.itemPriceTotal}'),
                      backgroundColor: Theme.of(context).primaryColorLight,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    child: Text('Order now!'),
                    onPressed: () {
                      return AlertDialog(
                        title: Text('This feature will be available soon.'),
                        actions: [
                          TextButton(
                            child: Text('Ok'),
                            onPressed: () => null,
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_context, _index) {
                  List<CartItem> _cart = cart.items.values.toList();
                  List<String> key = cart.items.keys.toList();
                  return widget.CartItem(
                    id: _cart[_index].id,
                    name: _cart[_index].name,
                    price: _cart[_index].price,
                    quantity: _cart[_index].quantity,
                    productId: key[_index],
                  );
                },
                itemCount: cart.itemCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
