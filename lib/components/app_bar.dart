import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/cart_page.dart';
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
  //bool _isDarkMode = false;

  //late List<Map<String, dynamic>> _currentProductList;
  List<Map<String, dynamic>> _currentProductList = [];

  void initState() {
    super.initState();
    _currentProductList = widget.productList;
  }

  @override
  Widget build(BuildContext context) {
    bool _isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    return AppBar(
      title: Text(widget.myTitle),
      centerTitle: true,
      //backgroundColor: Colors.transparent,
      //backgroundColor: Color.fromARGB(255, 146, 192, 29),
      backgroundColor: Color.fromARGB(255, 23, 54, 92),
      //backgroundColor: _isDarkMode ? Colors.black : Color.fromARGB(255, 23, 54, 92),

      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            //_isDarkMode = !_isDarkMode;
            Provider.of<DarkModeProvider>(context, listen: false)
                .toggleDarkMode();
          },
          icon: Icon(Icons.dark_mode),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
              icon: Icon(Icons.shopping_cart),
              /*onPressed: () => Navigator.pushNamed(context, '/cartpage',
                  arguments: _currentProductList)),*/
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CartPage(productList: _currentProductList),
                  ))),
        ),
      ],
    );
  }
}
