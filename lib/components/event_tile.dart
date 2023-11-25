import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final String rating;
  final void Function()? details;

  const EventTile({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.3,
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.all(8),
        //width: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 146, 192, 29),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Image.asset(imagePath),
              onTap: details,
            ),
            Text(name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
            //SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      rating,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Color.fromARGB(255, 224, 198, 6),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
