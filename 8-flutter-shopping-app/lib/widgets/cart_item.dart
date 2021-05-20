import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String productId;

  CartItem({
    this.id,
    this.name,
    this.quantity,
    this.price,
    this.productId,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      key: Key(id),
      direction: DismissDirection.endToStart,
      dismissThresholds: {
        DismissDirection.endToStart: 0.35,
      },
      onDismissed: (_direction) {
        cart.removeItem(productId);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Container(
          child: Icon(
            Icons.delete_outlined,
            color: Colors.white,
            size: 35.0,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 0.0,
          ),
        ),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 0.0,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 5.0,
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListTile(
            title: Text(name),
            subtitle: Text('$quantity x USD $price'),
            trailing: Text('USD ${(price * quantity)}'),
          ),
        ),
      ),
    );
  }
}
