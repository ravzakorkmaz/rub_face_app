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
          'lib/images/makerspace_3d.png',
          'lib/images/RUB-Makerspace_Designlabor_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Robotik.jpg',
          'lib/images/RUB-Makerspace_Papierbearbeitung.jpg'
        ],
      },
      {
        'spaceName': 'Textillabor',
        'images': [
          'lib/images/RUB-Makerspace_ovation_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Textilwerkstatt.jpg',
          'lib/images/RUB-Makerspace_transferpresse_1_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_summa_CC-BY-SA-40.jpg'
        ],
      },
      {
        'spaceName': 'Digitallabor',
        'images': [
          'lib/images/RUB-Makerspace_Digitallabor_CC-BY-SA-40.jpg',
          'lib/images/SCR.jpg',
          'lib/images/RUB-Makerspace_Loeten_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Digitallabor_Reflow_CC-BY-SA-40.jpg',
        ],
      },
      {
        'spaceName': 'Metallbauwerkstatt',
        'images': [
          'lib/images/RUB-Makerspace_Metallwerkstatt.jpg',
          'lib/images/RUB-Makerspace_Metallwerkstatt_Schweissen_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Metallwerkstatt_Fraesen_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Metallwerkstatt_Pressen_CC-BY-SA-40.jpg'
        ],
      },
      {
        'spaceName': 'Holzwerkstatt',
        'images': [
          'lib/images/RUB-Makerspace_HW_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_hw_machen_Schwettmann.jpg',
          'lib/images/RUB-Makerspace_fraese2_Schwettmann.jpg',
          'lib/images/RUB-Makerspace_Bohren_CC-BY-SA-40.jpg',
        ],
      },
      {
        'spaceName': 'Kunststoffwerkstatt',
        'images': [
          'lib/images/RUB-Makerspace_Kunststoffwerkstatt_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Kunststoff_SLA_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_SRM-20_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_SLS_CC-BY-SA-40.jpg'
        ],
      },
      {
        'spaceName': 'Keramikwerkstatt',
        'images': [
          'lib/images/RUB-Makerspace_Keramikwerkstatt_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Keramikwerkstatt_Clay-Drucker_CC-BY-SA-40.jpg',
          'lib/images/RUB-Makerspace_Kunststoff_Ofen_CC-BY-SA-40.jpg',
        ],
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
        child: Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.05),
          child: Column(
            children: spaces.map<Widget>((space) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      space['spaceName'].toUpperCase(),
                      style: TextStyle(
                          color:
                              Provider.of<DarkModeProvider>(context).isDarkMode
                                  ? Colors.white
                                  : Color.fromARGB(255, 0, 53, 96),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      child: ImageSlideshow(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.35,
                        initialPage: 0,
                        indicatorColor: Color.fromARGB(255, 193, 255, 37),
                        indicatorBackgroundColor: Colors.grey,
                        onPageChanged: (value) {
                          // Handle page change
                        },
                        children: space['images'].map<Widget>((image) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02),
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
