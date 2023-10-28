import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/cart_page.dart';
import 'package:rub_face_app/models/cart_model.dart';
import 'package:rub_face_app/pages/event_pages/festival.dart';
import 'package:rub_face_app/pages/event_pages/noodle_harmony.dart';
import 'package:rub_face_app/pages/menu_page.dart';
import 'package:rub_face_app/pages/start_page.dart';

// rub blau #17365C
// rub grün #92C01D

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => CartModel(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      routes: {
        '/startpage': (context) => StartPage(),
        '/menupage': (context) => MenuPage(),
        '/festivalpage': (context) => FestivalPage(),
        '/noodleharmonypage': (context) => NoodleHarmonyPage(),
        '/cartpage': (context) => CartPage(),
      },
    );
  }
}
