import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class FestivalPage extends StatelessWidget {
  const FestivalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
        //backgroundColor: Color.fromARGB(255, 215, 165, 187),
        appBar: MyAppBar(myTitle: 'M A K E R S P A C E'),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "lib/images/cat_front.png",
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
                    "5,0",
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
              child: const Text(
                "Cat",
                style: TextStyle(
                  fontSize: 28,
                  //color: Colors.white,
                  color: Color.fromARGB(255, 42, 53, 66),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "Druck dir deine eigene Spielfigur und beeindrucke dein Umfeld.",
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
              child: const Text(
                "Der 3D-Drucker im Makerspace ermöglicht es Dir dich kreativ auszutoben und jegliche Art deiner Traumprodukte in Realität umzusetzen!",
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
                        const Text(
                          "€ 12,00",
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
