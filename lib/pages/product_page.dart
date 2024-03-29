import 'package:flutter/material.dart';
import 'package:rub_face_app/pages/cart_page.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;
  final List<Map<String, dynamic>> productList;
  final CartModel cart = CartModel();

  ProductPage({required this.product, required this.productList});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
                child: SizedBox(
                  height: screenHeight * 0.3,
                  child: ImageSlideshow(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.5,
                    initialPage: 0,
                    indicatorColor:
                        Color.fromARGB(255, 146, 192, 29).withOpacity(0.75),
                    indicatorBackgroundColor: Colors.grey,
                    children: product['images'].map<Widget>((image) {
                      return Image.asset(
                        image,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
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
                  product['space'],
                  textAlign: TextAlign.center,
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
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: darkModeProvider.isDarkMode
                        ? Colors.white
                        : Color.fromARGB(255, 0, 53, 96),
                    height: 1,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 0, 53, 96),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${product['price']} €",
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
                      SizedBox(height: 20),
                      MyButton(
                        myText: "Zum Warenkorb",
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
