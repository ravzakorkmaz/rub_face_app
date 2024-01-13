import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/pages/cart_page.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String myTitle;
  final List<Map<String, dynamic>> productList;

  const MyAppBar({required this.myTitle, required this.productList});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  List<Map<String, dynamic>> _currentProductList = [];

  void initState() {
    super.initState();
    _currentProductList = widget.productList;
  }

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 53, 96),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: AppBar(
        title: Text(widget.myTitle),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 53, 96),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<DarkModeProvider>(context, listen: false)
                  .toggleDarkMode();
            },
            icon: _isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CartPage(productList: _currentProductList),
                    ))),
          ),
        ],
      ),
    );
  }
}
