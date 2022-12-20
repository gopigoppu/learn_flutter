import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

import './providers/cart.dart';
import './providers/products.dart';
import './providers/orders.dart';
import './providers/auth.dart';

import './screens/products_overview_screen.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/auth_screen.dart';
import './screens/splash_screen.dart';

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
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products('', '', []),
          update: (context, auth, previousProducts) => Products(
              auth.token ?? '',
              auth.userId ?? '',
              (previousProducts == null ? [] : previousProducts.items)),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (context) => Orders('', '', []),
          update: (context, auth, previousOrders) => Orders(
              auth.token ?? '',
              auth.userId ?? '',
              (previousOrders == null ? [] : previousOrders.orders)),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: shopTheme(),
          home: auth.isAuth
              ? ProductsOverveiwScreen()
              : FutureBuilder(
                  builder: ((ctx, authResultSnapshot) =>
                      (authResultSnapshot.connectionState ==
                              ConnectionState.waiting)
                          ? SplashScreen()
                          : AuthScreen()),
                  future: auth.tryAutoLogin(),
                ),
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
      ),
    );
  }
}
