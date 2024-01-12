/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class MakerspacePage extends StatelessWidget {
  final List<Map<String, dynamic>> productList;

  MakerspacePage({required this.productList});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> spaces = [
      {
        'spaceName': 'Designlabor',
        'images': [
          'lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'
        ],
      },
      {
        'spaceName': 'Textillabor',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
      {
        'spaceName': 'Digitallabor',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
      {
        'spaceName': 'Metallbauwerkstatt',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
      {
        'spaceName': 'Holzwerkstatt',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
      {
        'spaceName': 'Keramikwerkstatt',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
    ];

    return Scaffold(
      appBar: MyAppBar(
        myTitle: 'M A K E R S P A C E',
        productList: productList,
      ),
      backgroundColor: Provider.of<DarkModeProvider>(context).isDarkMode
          ? Color.fromARGB(255, 14, 20, 31)
          : Color.fromARGB(255, 231, 231, 231),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: screenHeight * 0.3,
              child: ImageSlideshow(
                width: screenWidth * 0.5,
                height: screenHeight * 0.5,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                onPageChanged: (value) {
                  // Handle page change
                },
                children: spaces
                    .map<dynamic>((space) {
                      return space['images'].map<dynamic>((image) {
                        return Image.asset(
                          image,
                          fit: BoxFit.cover,
                        );
                      }).toList(); // Convert the inner map result to List<Widget>
                    })
                    .expand((element) => element)
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/components/app_bar.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class MakerspacePage extends StatelessWidget {
  final List<Map<String, dynamic>> productList;

  MakerspacePage({required this.productList});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> spaces = [
      {
        'spaceName': 'Designlabor',
        'images': [
          'lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'
        ],
      },
      {
        'spaceName': 'Textillabor',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
      {
        'spaceName': 'Digitallabor',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
      {
        'spaceName': 'Metallbauwerkstatt',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
      {
        'spaceName': 'Holzwerkstatt',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
      {
        'spaceName': 'Keramikwerkstatt',
        'images': ['lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg'],
      },
    ];

    return Scaffold(
      appBar: MyAppBar(
        myTitle: 'M A K E R S P A C E',
        productList: productList,
      ),
      backgroundColor: Provider.of<DarkModeProvider>(context).isDarkMode
          ? Color.fromARGB(255, 14, 20, 31)
          : Color.fromARGB(255, 231, 231, 231),
      body: SingleChildScrollView(
        child: Column(
          children: spaces.map<Widget>((space) {
            return Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.5,
                  child: ImageSlideshow(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.5,
                    initialPage: 0,
                    indicatorColor: Colors.blue,
                    indicatorBackgroundColor: Colors.grey,
                    onPageChanged: (value) {
                      // Handle page change
                    },
                    children: space['images'].map<Widget>((image) {
                      return Image.asset(
                        image,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  space['spaceName'],
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
