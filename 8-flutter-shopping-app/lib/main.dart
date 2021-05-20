import 'package:flutter/material.dart';
import 'package:flutter_udemy_shop_app/providers/cart.dart';
import 'package:flutter_udemy_shop_app/providers/products.dart';
import 'package:flutter_udemy_shop_app/screens/product_detail_screen.dart';
import 'package:flutter_udemy_shop_app/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext _context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext _context) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.orangeAccent,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (_context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
