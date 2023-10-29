import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String myTitle;

  const MyAppBar({
    required this.myTitle,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = false;

    return AppBar(
      title: Text(widget.myTitle),
      centerTitle: true,
      //backgroundColor: Colors.transparent,
      //backgroundColor: Color.fromARGB(255, 146, 192, 29),
      backgroundColor: Color.fromARGB(255, 23, 54, 92),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            _isDarkMode = !_isDarkMode;
          },
          icon: Icon(Icons.dark_mode),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.pushNamed(context, '/cartpage')),
        )
      ],
    );
  }
}
