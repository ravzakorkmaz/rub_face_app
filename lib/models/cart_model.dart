import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  Map<String, int> _cartItems = {};

  Map<String, int> get cartItems => _cartItems;

  int getProductQuantity(Map<String, dynamic> product) {
    return cartItems[product['productName']] ?? 0;
  }

  void addToCart(Map<String, dynamic> product) {
    final productId = product['productName'];
    _cartItems.update(productId, (value) => value + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> product) {
    final productId = product['productName'];
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (value) => value - 1);
      if (_cartItems[productId] == 0) {
        _cartItems.remove(productId);
      }
      notifyListeners();
    }
  }

  int getTotalItems() {
    return _cartItems.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double getTotalPrice(List<Map<String, dynamic>> products) {
    double total = 0.0;
    for (var product in products) {
      final productId = product['productName'];
      final quantity = _cartItems[productId] ?? 0;
      total += quantity * double.parse(product['price']);
    }
    return total;
  }

  void clearProduct(String productId) {
    _cartItems[productId] = 0;
    notifyListeners();
  }
}
