import 'package:flutter/material.dart';
import 'package:rub_face_app/cart_page.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart'; // Stellen Sie sicher, dass Sie den richtigen Pfad verwenden

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;
  final List<Map<String, dynamic>> productList;
  final CartModel cart = CartModel();

  ProductPage({required this.product, required this.productList});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return FractionallySizedBox(
      child: Consumer2<CartModel, DarkModeProvider>(
        builder: (context, cartModel, darkModeProvider, child) => Scaffold(
          appBar: MyAppBar(
            myTitle: 'M A K E R S P A C E',
            productList: productList,
          ),
          backgroundColor: darkModeProvider.isDarkMode
              ? Color.fromARGB(255, 14, 20, 31)
              : Color.fromARGB(255, 231, 231, 231),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  product['imagePath'],
                  height: 250,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    Text(
                      product['rating'],
                      style: TextStyle(
                        fontSize: 20,
                        color: darkModeProvider.isDarkMode
                            ? Colors.white
                            : Color.fromARGB(255, 0, 53, 96),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  product['productName'],
                  style: TextStyle(
                    fontSize: 28,
                    color: darkModeProvider.isDarkMode
                        ? Colors.white
                        : Color.fromARGB(255, 42, 53, 66),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Test Text wo taucht das auf?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: darkModeProvider.isDarkMode
                        ? Colors.white
                        : Color.fromARGB(255, 0, 53, 96),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  product['description'],
                  style: TextStyle(
                    fontSize: 16,
                    color: darkModeProvider.isDarkMode
                        ? Colors.white
                        : Color.fromARGB(255, 0, 53, 96),
                    height: 1,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.all(25),
                  /*color: darkModeProvider.isDarkMode
                      ? Colors.black
                      : Color.fromARGB(255,0,53,96),*/
                  color: Color.fromARGB(255, 0, 53, 96),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            product['price'],
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                    onPressed: () =>
                                        cartModel.removeFromCart(product),
                                    icon: Icon(Icons.remove)),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                cartModel
                                    .getProductQuantity(product)
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                    onPressed: () =>
                                        cartModel.addToCart(product),
                                    icon: Icon(Icons.add)),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      MyButton(
                        myText:
                            "Zum Einkaufswagen (${cartModel.getTotalItems()})",
                        event: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CartPage(productList: productList),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
