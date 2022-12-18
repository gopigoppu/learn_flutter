import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

import './providers/cart.dart';
import './providers/products.dart';
import './providers/orders.dart';
import './providers/auth.dart';

import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<ShopApp> createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Orders(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: shopTheme(),
        home: AuthScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProductsScreen.routeName: (context) => UserProductsScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
          // AuthScreen.routeName: (context) => AuthScreen(),
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
