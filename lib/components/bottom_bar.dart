import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';

class BottomBar extends StatelessWidget {
  final double total;

  BottomBar({required this.total});

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.15,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: darkModeProvider.isDarkMode
            ? Color.fromARGB(255, 0, 53, 96)
            : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GESAMTSUMME',
                  style: TextStyle(
                      color: darkModeProvider.isDarkMode
                          ? Colors.white
                          : Color.fromARGB(255, 0, 53, 96),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${total.toStringAsFixed(2)} €',
                  style: TextStyle(
                      color: darkModeProvider.isDarkMode
                          ? Colors.white
                          : Color.fromARGB(255, 0, 53, 96),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
