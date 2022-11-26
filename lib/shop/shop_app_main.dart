import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import '../main.dart';
import './providers/products.dart';

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<ShopApp> createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      // create: (BuildContext context) => Products(),
      value: Products(),
      child: MaterialApp(
        theme: shopTheme(),
        home: ProductsOverveiwScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: Text('ShopApp'),
        //   ),
        //   body: Center(
        //     child: Text('Shop Text'),
        //   ),
        // ),
      ),
    );
  }
}
