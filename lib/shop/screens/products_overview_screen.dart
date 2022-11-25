import 'package:flutter/material.dart';
import '../models/PRODUCT_DATA.dart';
import '../models/product.dart';
import '../widgets/products_grid.dart';


class ProductsOverveiwScreen extends StatelessWidget {
  ProductsOverveiwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: ProductsGrid(),
    );
  }
}
