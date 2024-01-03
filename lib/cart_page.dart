import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/bottom_bar.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> productList;

  const CartPage({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
        appBar: MyAppBar(myTitle: 'W A R E N K O R B'),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    for (var product in cartModel.cartItems.keys)
                      _buildCartItem(product, cartModel),
                  ],
                ),
              ),
              //SizedBox(height: 20),
              //_buildBottomBar(cartModel), // Call the new method to build the bottom bar
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(cartModel),
      ),
    );
  }

  Widget _buildCartItem(String productId, CartModel cartModel) {
    final product = getProductDetails(productId, productList);
    final quantity = cartModel.cartItems[productId] ?? 0;

    if (quantity > 0) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 146, 192, 29),
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
            ),
          ),
          SizedBox(height: 15), // Abstand zwischen den Produktzeilen
        ],
      );
    } else {
      return SizedBox.shrink(); // Return an empty widget if quantity is 0
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
