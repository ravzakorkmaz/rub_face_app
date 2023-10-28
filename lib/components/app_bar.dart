import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String myTitle;
  const MyAppBar({
    super.key,
    required this.myTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(myTitle),
      centerTitle: true,
      //backgroundColor: Colors.transparent,
      //backgroundColor: Color.fromARGB(255, 146, 192, 29),
      backgroundColor: Color.fromARGB(255, 23, 54, 92),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.dark_mode),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}
