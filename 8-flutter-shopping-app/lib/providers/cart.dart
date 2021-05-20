import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.name,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get itemPriceTotal {
    double total = 0;
    _items.forEach((key, _item) {
      total = total + (_item.price * _item.quantity);
    });
    return total;
  }

  void addItem(
    String productId,
    String name,
    double price,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (_existingCartItem) => CartItem(
          id: _existingCartItem.id,
          name: _existingCartItem.name,
          price: _existingCartItem.price,
          quantity: _existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          name: name,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }
}
