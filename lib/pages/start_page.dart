import 'package:flutter/material.dart';
import 'package:rub_face_app/components/button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 215, 165, 187),
      backgroundColor: Color.fromARGB(255, 23, 54, 92),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "MAKERSPACE",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  "lib/images/japanflag.png",
                  height: 30,
                ),
              ],
            ),
            SizedBox(height: 50),
            Center(
              child: Image.asset(
                "lib/images/owerk.png",
                height: 400,
                width: 400,
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Erleben Sie kreative Produkte!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "日本を体験してみよう",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Entdecke das Land der aufgehenden Sonne un tauche ein in eine Welt voller Tradition, Kultur und atemberaubender Natur.",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: MyButton(
                myText: "Shoppe los",
                event: () => Navigator.pushNamed(context, "/menupage"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
