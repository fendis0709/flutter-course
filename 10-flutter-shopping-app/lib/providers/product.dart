import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_complete_guide/models/http_exception.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus() async {
    // Save temporary data for optimistic update data method
    bool oldStatus = isFavorite;

    isFavorite = !isFavorite;
    notifyListeners();

    final url = Uri.https(
      'flutter-0709-default-rtdb.asia-southeast1.firebasedatabase.app',
      'products/$id.json',
    );
    final payload = json.encode({
      'isFavorite': isFavorite,
    });

    http.Response response = await http.patch(url, body: payload);

    print(response.body.toString());

    if (response.statusCode != 200) {
      isFavorite = oldStatus;
      notifyListeners();
      throw HttpException('Unable to update. Please try again later.');
    }
  }
}
