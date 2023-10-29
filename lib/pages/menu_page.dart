import 'package:flutter/material.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:rub_face_app/components/event_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    List EventList = [
      EventTile(
        name: "Cat",
        price: "€ 12,00",
        imagePath: "lib/images/cat_front.png",
        rating: "5,0",
        details: () => Navigator.pushNamed(context, '/festivalpage'),
      ),
      EventTile(
        name: "Noodle Harmony Japan",
        price: "€ 18",
        imagePath: "lib/images/japan3.png",
        rating: "4",
        details: () => Navigator.pushNamed(context, '/noodleharmonypage'),
      ),
      EventTile(
        name: "Mount Fuji Tour",
        price: "€ 39",
        imagePath: "lib/images/japan6.png",
        rating: "4",
        details: () {},
      ),
    ];

    return Scaffold(
      //backgroundColor: _isDarkMode ? Colors.black : Color.fromARGB(255, 215, 165, 187),
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      appBar: MyAppBar(myTitle: 'M A K E R S P A C E'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.all(25),
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
                      "10 % Nachlass",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    MyButton(
                      myText: "Kaufen",
                      event: () {},
                    )
                  ],
                ),
                Image.asset(
                  "lib/images/japan1.png",
                  height: 120,
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Suche Event",
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
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Events",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Colors.black,
                  color: Color.fromARGB(255, 23, 54, 92)),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => EventList[index],
              itemCount: EventList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Derzeit beliebt",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //color: Colors.white,
                  color: Color.fromARGB(255, 23, 54, 92)),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              //color: Color.fromARGB(255, 94, 185, 160),
              color: Color.fromARGB(255, 23, 54, 92),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "lib/images/japan2.png",
                  height: 90,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kimono Kultur",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "€ 45",
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
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
