import 'package:flutter/material.dart';
import '../models/PRODUCT_DATA.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = productsListData;

  List<Product> get items {
    return [..._items];
  }

  Product findById(productId) {
    return _items.firstWhere((prod) => prod.id == productId);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
