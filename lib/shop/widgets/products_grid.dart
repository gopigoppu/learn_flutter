import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: ((ctx, i) => ChangeNotifierProvider(
            create: (BuildContext context) => products[i],
            child: const ProductItem(),
            // child: const ProductItem(
            //     products[i].id,
            //     products[i].title,
            //     products[i].imageUrl,
            //     ),
          )),
      itemCount: products.length,
    );
  }
}
