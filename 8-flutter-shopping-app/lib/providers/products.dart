import 'package:flutter/widgets.dart';
import 'package:flutter_udemy_shop_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products;

  List<Product> get products {
    return [..._products];
  }

  void add() {
    print('NOTIFY PRODUCTS');
    notifyListeners();
  }
}
