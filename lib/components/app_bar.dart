import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:rub_face_app/pages/cart_page.dart';
import 'package:rub_face_app/pages/menu_page.dart';
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
    int cartItemCount =
        Provider.of<CartModel>(context, listen: false).getTotalItems();

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
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuPage(productList: _currentProductList),
            ),
          ),
          icon: Icon(Icons.home),
        ),
        title: Text(widget.myTitle),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<DarkModeProvider>(context, listen: false)
                  .toggleDarkMode();
            },
            icon: _isDarkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CartPage(productList: _currentProductList),
                    ),
                  ),
                ),
              ),
              cartItemCount > 0
                  ? Positioned(
                      right: 7,
                      top: 28,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 8,
                        child: Text(
                          cartItemCount.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
        backgroundColor: Color.fromARGB(255, 0, 53, 96),
        centerTitle: true,
      ),
    );
  }
}
