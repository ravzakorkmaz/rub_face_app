import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/cart_page.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';
import 'package:rub_face_app/pages/event_pages/product.dart';
import 'package:rub_face_app/pages/menu_page.dart';
import 'package:rub_face_app/pages/start_page.dart';

// rub blau #17365C
// rub grün #92C01D

/*void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => CartModel(),
    ),
  );
}*/

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => DarkModeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      routes: {
        '/startpage': (context) => StartPage(),
        '/menupage': (context) => MenuPage(),
        '/cartpage': (context) => CartPage(
              productList: [],
            ),
      },
    );
  }
}
