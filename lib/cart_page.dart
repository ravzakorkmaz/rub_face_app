import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/bottom_bar.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/pages/event_pages/product.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> productList;

  const CartPage({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartModel, DarkModeProvider>(
      builder: (context, cartModel, darkModeProvider, child) => Scaffold(
        appBar: MyAppBar(
          myTitle: 'W A R E N K O R B',
          productList: productList,
        ),
        backgroundColor: darkModeProvider.isDarkMode
            ? Color.fromARGB(255, 14, 20, 31)
            : Color.fromARGB(255, 231, 231, 231),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    for (var product in cartModel.cartItems.keys)
                      _buildCartItem(
                          product, cartModel, darkModeProvider, context),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(cartModel),
      ),
    );
  }

  Widget _buildCartItem(String productId, CartModel cartModel,
      DarkModeProvider darkModeProvider, BuildContext context) {
    final product = getProductDetails(productId, productList);
    final quantity = cartModel.cartItems[productId] ?? 0;

    if (quantity > 0) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: darkModeProvider.isDarkMode
                  ? Color.fromARGB(255, 34, 40, 53)
                  : Color.fromARGB(255, 146, 192, 29),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                product['productName'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${product['price']} €",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    quantity.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () => cartModel.removeFromCart(product),
                    icon: Icon(Icons.remove, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () => cartModel.addToCart(product),
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () => cartModel.clearProduct(productId),
                    icon: Icon(Icons.delete, color: Colors.white),
                  ),
                ],
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    product: product,
                    productList: productList,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _buildBottomBar(CartModel cartModel) {
    double total = cartModel.calculateTotal(productList);

    return BottomBar(total: total);
  }

  Map<String, dynamic> getProductDetails(
      String productId, List<Map<String, dynamic>> productList) {
    final product = productList.firstWhere(
      (item) => item['productName'] == productId,
      orElse: () => {'productName': 'Product not found', 'price': '0.00'},
    );

    return product;
  }
}
