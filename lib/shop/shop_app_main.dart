import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';
import '../main.dart';

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<ShopApp> createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: shopTheme(),
      home: ProductsOverveiwScreen(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('ShopApp'),
      //   ),
      //   body: Center(
      //     child: Text('Shop Text'),
      //   ),
      // ),
    );
  }
}
