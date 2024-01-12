import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:rub_face_app/components/event_tile.dart';
import 'package:rub_face_app/pages/event_pages/product.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/pages/makerspace_page.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double horizontalSpacing = screenWidth * 0.05;
    double verticalSpacing = screenWidth * 0.02;

    //Product list
    List<Map<String, dynamic>> products = [
      {
        'productName': 'Infinity Handschuh',
        'rating': '5.0',
        'imagePath': 'lib/images/glove.png',
        'images': ['lib/images/glove.png'],
        'description': 'Glove Machine',
        'price': '27.99',
      },
      {
        'productName': 'Kirby',
        'rating': '4.3',
        'imagePath': 'lib/images/kirby_front.png',
        'images': [
          'lib/images/kirby_front.png',
          'lib/images/kirby_right.png',
          'lib/images/kirby_back.png'
        ],
        'description': 'Kirby Boy',
        'price': '4.99',
      },
      {
        'productName': 'Kitten',
        'rating': '5.0',
        'imagePath': 'lib/images/cat_front.png',
        'images': [
          'lib/images/cat_front.png',
          'lib/images/cat_right.png',
          'lib/images/cat_left.png'
        ],
        'description':
            'Druck dir deine eigene Spielfigur und beeindrucke dein Umfeld.sjdkbvehdfbevgflwevdgcjhgkljjvjcghfguhijökhljghfjgdtfztuziljkhjmhfgjzkuziljnbvfjzuziujgfdztuziujk,bnmvhfjztuzihkDruck dir deine eigene Spielfigur und beeindrucke dein Umfeld.sjdkbvehdfbevgflwevdgcjhgkljjvjcghfguhijökhljghfjgdtfztuziljkhjmhfgjzkuziljnbvfjzuziujgfdztuziujk,bnmvhfjztuzihkDruck dir deine eigene Spielfigur und beeindrucke dein Umfeld.sjdkbvehdfbevgflwevdgcjhgkljjvjcghfguhijökhljghfjgdtfztuziljkhjmhfgjzkuziljnbvfjzuziujgfdztuziujk,bnmvhfjztuzihk',
        'price': '7.99',
      },
      {
        'productName': 'The Mask',
        'rating': '4.0',
        'imagePath': 'lib/images/head_front.png',
        'images': ['lib/images/head_front.png', 'lib/images/head_right.png'],
        'description': 'Kafa leyla',
        'price': '14.99',
      },
      {
        'productName': 'FACEhausen',
        'rating': '5.0',
        'imagePath': 'lib/images/face_house_front.png',
        'images': [
          'lib/images/face_house_front.png',
          'lib/images/face_house_right.png',
          'lib/images/face_house_left.png'
        ],
        'description': 'Kirby Boy',
        'price': '24.99',
      },
      {
        'productName': 'Simba',
        'rating': '4.6',
        'imagePath': 'lib/images/cat_print_front.png',
        'images': [
          'lib/images/cat_print_front.png',
          'lib/images/cat_print_right.png'
        ],
        'description': 'Orange Cat Print',
        'price': '8.99',
      },
      {
        'productName': 'Print Pascal',
        'rating': '4.6',
        'imagePath': 'lib/images/tshirt_print.png',
        'images': [
          'lib/images/tshirt_print.png',
          'lib/images/tshirt_front.png'
        ],
        'description': 'Orange Cat Print',
        'price': '8.99',
      },
    ];

    List<EventTile> eventList = products.map((product) {
      return EventTile(
        name: product['productName'],
        price: product['price'],
        imagePath: product['imagePath'],
        rating: product['rating'],
        details: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              product: product,
              productList: products,
            ),
          ),
        ),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Provider.of<DarkModeProvider>(context).isDarkMode
          ? Color.fromARGB(255, 14, 20, 31)
          : Color.fromARGB(255, 231, 231, 231),
      appBar: MyAppBar(
        myTitle: 'M A K E R S P A C E',
        productList: products,
      ),
      body: Stack(
        children: [
          // Background image with rotation
          Transform.rotate(
            angle: 180 * 3.1415927 / 180,
            child: Image.asset(
              "lib/images/header2.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(
            color: Provider.of<DarkModeProvider>(context).isDarkMode
                ? Colors.black.withOpacity(0.1)
                : Colors.white.withOpacity(0.1),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.symmetric(
                    horizontal: horizontalSpacing, vertical: verticalSpacing),
                decoration: BoxDecoration(
                    color: Provider.of<DarkModeProvider>(context).isDarkMode
                        ? Color.fromARGB(255, 8, 22, 35).withOpacity(0.8)
                        : Color.fromARGB(255, 0, 53, 96).withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 53, 96), width: 2)),
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
                        SizedBox(height: verticalSpacing),
                        MyButton(
                          myText: "Kaufen",
                          event: () {},
                        )
                      ],
                    ),
                    Image.asset(
                      'lib/images/face_house_front.png',
                      height: screenHeight * 0.15,
                    )
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Suche",
                    hintStyle: TextStyle(
                        color: Provider.of<DarkModeProvider>(context).isDarkMode
                            ? const Color.fromARGB(255, 231, 231, 231)
                            : Color.fromARGB(255, 0, 53, 96)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 53, 96),
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
              SizedBox(height: screenWidth * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Produkte",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Provider.of<DarkModeProvider>(context).isDarkMode
                          ? Colors.white
                          : Color.fromARGB(255, 0, 53, 96)),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => eventList[index],
                  itemCount: eventList.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Der Makerspace",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Provider.of<DarkModeProvider>(context).isDarkMode
                          ? Colors.white
                          : Color.fromARGB(255, 0, 53, 96)),
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              Container(
                height: screenHeight * 0.12,
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Provider.of<DarkModeProvider>(context).isDarkMode
                        ? Color.fromARGB(255, 8, 22, 35).withOpacity(0.8)
                        : Color.fromARGB(255, 0, 53, 96).withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 53, 96), width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              "lib/images/Button_Raumanfrage.jpg",
                              height: screenHeight * 0.085,
                              width: screenWidth * 0.35,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MakerspacePage(
                                productList: products,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "https://makerspace.ruhr-uni-bochum.de",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 6.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenWidth * 0.035),
                        Text(
                          'Hier findest du Space \num deiner Kreativität \nfreien Lauf zu lassen...',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
            ],
          ),
        ],
      ),
    );
  }
}
