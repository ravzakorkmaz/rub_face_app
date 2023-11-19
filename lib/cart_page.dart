/*import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
        //backgroundColor: Color.fromARGB(255, 215, 165, 187),
        backgroundColor: Colors.white,
        /*appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Warenkorb"),
          centerTitle: true,
        ),*/
        appBar: MyAppBar(myTitle: 'W A R E N K O R B'),
        body: Padding(
          //padding: const EdgeInsets.symmetric(horizontal: 25.0),
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  if (cartModel.getProductQuantity(product) > 0)
                    Container(
                      decoration: BoxDecoration(
                        //color: Color.fromARGB(255, 61, 91, 212),
                        color: Color.fromARGB(255, 146, 192, 29),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          "Noodle Harmony",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "€ 18,00",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              cartModel.nudelsuppe.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              onPressed: cartModel.clearNudelsuppe,
                              icon: Icon(Icons.delete, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 15),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(String productId, CartModel cartModel) {
    final product = getProductDetails(productId); // Implement this function
    //final product = cartModel.get
    final quantity = cartModel.cartItems[productId] ?? 0;

    if (quantity > 0) {
      return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 146, 192, 29),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            product['productName'],
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "€ ${product['price']}",
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
      );
    } else {
      return SizedBox.shrink(); // Return an empty widget if quantity is 0
    }
  }

  Map<String, dynamic> getProductDetails(String productId) {
    // Implement this function to get product details based on productId
    // You may need to fetch the product details from your data source or use a predefined map
    // For now, I'll return a dummy map, replace this with your actual implementation

    return {
      'productName': 'Dummy Product',
      'price': '0.00',
    };
  }
}
