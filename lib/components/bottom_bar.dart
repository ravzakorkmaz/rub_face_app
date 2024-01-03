import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double total;

  BottomBar({required this.total});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.15,
      padding: EdgeInsets.all(10),
      //color: Color.fromARGB(255, 23, 54, 92),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  'GESAMTSUMME', // Format the total as needed
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 54, 92),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${total.toStringAsFixed(2)} €', // Format the total as needed
                  style: TextStyle(
                      color: Color.fromARGB(255, 23, 54, 92),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                /*ElevatedButton(
              onPressed: () {
                // Add your logic for the button press
              },
              child: Text('Checkout'),
            ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
