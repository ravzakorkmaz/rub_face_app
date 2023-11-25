import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:rub_face_app/components/event_tile.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:rub_face_app/pages/event_pages/product.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double horizontalSpacing = screenWidth * 0.05;
    double verticalSpacing = screenWidth * 0.02;

    //Product list
    List<Map<String, dynamic>> products = [
      {
        'productName': 'Cat',
        'rating': '5.0',
        'imagePath': 'lib/images/cat_front.png',
        'description':
            'Druck dir deine eigene Spielfigur und beeindrucke dein Umfeld.',
        'price': '€ 12,00',
      },
      {
        'productName': 'Head',
        'rating': '4.0',
        'imagePath': 'lib/images/head_front.png',
        'description': 'Kafa leyla',
        'price': '€ 15,00',
      },
    ];

    List EventList = [];

    for (int i = 0; i < products.length; i++) {
      EventList.add(EventTile(
        name: products[i]['productName'],
        price: products[i]['price'],
        imagePath: products[i]['imagePath'],
        rating: products[i]['rating'],
        details: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductPage(
                    product: products[i],
                    productList: products,
                  )),
        ),
      ));
    }

    return Scaffold(
      //backgroundColor: _isDarkMode ? Colors.black : Color.fromARGB(255, 215, 165, 187),
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      appBar: MyAppBar(myTitle: 'M A K E R S P A C E'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            //margin: EdgeInsets.all(25),
            margin: EdgeInsets.symmetric(
                horizontal: horizontalSpacing, vertical: verticalSpacing),
            decoration: BoxDecoration(
              //color: Color(0xffffb46c),
              color: Color.fromARGB(255, 23, 54, 92),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "10 % SALE",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    //SizedBox(height: 15),
                    SizedBox(height: verticalSpacing),
                    MyButton(
                      myText: "Buy Now",
                      event: () {},
                    )
                  ],
                ),
                Image.asset(
                  'lib/images/head_right.png',
                  height: 120,
                )
              ],
            ),
          ),
          //SizedBox(height: 15),
          SizedBox(height: screenWidth * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Product",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    //color: Colors.white,
                    color: Color.fromARGB(255, 23, 54, 92),
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //SizedBox(height: 13),
          SizedBox(height: screenWidth * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Products",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Colors.black,
                  color: Color.fromARGB(255, 23, 54, 92)),
            ),
          ),
          //SizedBox(height: 5),
          SizedBox(height: screenWidth * 0.02),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => EventList[index],
              itemCount: EventList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          //SizedBox(height: 5),
          SizedBox(height: screenWidth * 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Favorite of the month",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Colors.white,
                  color: Color.fromARGB(255, 23, 54, 92)),
            ),
          ),
          //SizedBox(height: 10),
          SizedBox(height: screenWidth * 0.02),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 23, 54, 92),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  products[0]['imagePath'],
                  height: 90,
                ),
                //SizedBox(width: 10),
                SizedBox(height: screenWidth * 0.1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[0]['productName'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    //SizedBox(height: 10),
                    SizedBox(height: screenWidth * 0.05),
                    Text(
                      products[0]['price'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //SizedBox(height: 10),
          SizedBox(height: screenWidth * 0.01),
        ],
      ),
    );
  }
}
