import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';

class EventTile extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final String rating;
  final void Function()? details;

  const EventTile({
    Key? key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      decoration: BoxDecoration(
          color: darkModeProvider.isDarkMode
              ? Color.fromARGB(255, 8, 22, 35).withOpacity(0.8)
              : Color.fromARGB(255, 146, 192, 29).withOpacity(0.75),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: darkModeProvider.isDarkMode
                  ? Color.fromARGB(255, 0, 53, 96)
                  : Color.fromARGB(255, 0, 53, 96).withOpacity(0.15),
              width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Image.asset(
              imagePath,
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            onTap: details,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${price} €",
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
    );
  }
}
