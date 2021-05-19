import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.green,
        fontFamily: 'Lato',
      ),
      home: ProductOverviewScreen(),
    );
  }
}
