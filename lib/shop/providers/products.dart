import 'package:flutter/material.dart';
import '../models/PRODUCT_DATA.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = productsListData;

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
