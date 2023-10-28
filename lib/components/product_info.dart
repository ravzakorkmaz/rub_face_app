import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class ProductInfo extends StatelessWidget {
  final String barTitle;
  final String imagePath;
  final String rating;
  final String productName;
  final String description;
  final String price;
  const ProductInfo({
    super.key,
    required this.barTitle,
    required this.imagePath,
    required this.rating,
    required this.productName,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
        //backgroundColor: Color.fromARGB(255, 215, 165, 187),
        appBar: MyAppBar(myTitle: barTitle),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                height: 200,
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
                    rating,
                    style: TextStyle(
                      fontSize: 20,
                      //color: Colors.white,
                      color: Color.fromARGB(255, 23, 54, 92),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                productName,
                style: TextStyle(
                  fontSize: 28,
                  //color: Colors.white,
                  color: Color.fromARGB(255, 23, 54, 92),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "Das erwartet Sie",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Colors.white,
                  color: Color.fromARGB(255, 23, 54, 92),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 23, 54, 92),
                  height: 1,
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                //color: Color.fromARGB(255, 61, 91, 212),
                color: Color.fromARGB(255, 23, 54, 92),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          price,
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
                                  onPressed: cartModel.removeFestival,
                                  icon: Icon(Icons.remove)),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              cartModel.festival.toString(),
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
                                  onPressed: cartModel.addFestival,
                                  icon: Icon(Icons.add)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      myText: "Zum Einkaufswagen",
                      event: () => Navigator.pushNamed(context, '/cartpage'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
