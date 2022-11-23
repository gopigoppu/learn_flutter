import 'package:flutter/material.dart';
import '../models/PRODUCT_DATA.dart';
import '../models/product.dart';
import '../widgets/ptoduct_item.dart';

class ProductsOverveiwScreen extends StatelessWidget {
  final List<Product> loadedProducts = productsListData;

  ProductsOverveiwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: ((ctx, i) => ProductItem(
              loadedProducts[i].id,
              loadedProducts[i].title,
              loadedProducts[i].imageUrl,
            )),
        itemCount: loadedProducts.length,
      ),
    );
  }
}
