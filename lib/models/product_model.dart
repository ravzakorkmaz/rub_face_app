import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  int count = 0;

  void addProduct() {
    count++;
    notifyListeners();
  }

  void removeProduct() {
    if (count > 0) {
      count--;
      notifyListeners();
    }
  }

  void clearProduct() {
    count = 0;
    notifyListeners();
  }

  int get totalItems => count;
}
