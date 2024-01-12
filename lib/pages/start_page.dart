import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rub_face_app/components/button.dart';
import 'package:rub_face_app/components/start_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 53, 96),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              //"lib/images/makerspace_3d.png",
              "lib/images/tabs2.png",
              fit: BoxFit.cover,
            ),
            Transform.rotate(
              angle: -15 *
                  3.1415927 /
                  180, // Hier können Sie den Rotationswinkel in Grad festlegen
              child: Image.asset(
                "lib/images/header2.png",
                fit: BoxFit.cover,
              ),
            ),
            /*Image.asset(
              //"lib/images/makerspace_3d.png",
              "lib/images/header2.png",
              fit: BoxFit.cover,
            ),*/
            /*Image.asset(
              //"lib/images/makerspace_3d.png",
              "lib/images/header2_reverse.png",
              //fit: BoxFit.cover,
            ),*/
            Container(
              color: Colors.black.withOpacity(0.6),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.05),
                  child: Image.asset(
                    "lib/images/makerspace-weiss.png",
                    //fit: BoxFit.fitWidth,
                    //height: screenHeight * 0.15,
                    width: screenWidth * 0.95,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20.0), // Wiederholen Sie die gleiche Zahl wie oben
                    child: Image.asset(
                      "lib/images/SOM.jpg",
                      height: screenHeight * 0.3,
                      width: screenWidth * 0.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*Text(
                      "MAKERSPACE",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),*/

                    //SizedBox(width: 10),
                  ],
                ),
                //SizedBox(height: 50),
                /*Image.asset(
                    //"lib/images/makerspace_3d.png",
                    "lib/images/makerspace/header2.png",
                    fit: BoxFit.cover),*/
                //SizedBox(height: 500),
                //SizedBox(height: 25),
                /* Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.2),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "クリエイティブな製品を体験してください",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Entdecke die Welt der Entfaltung und tauche ein in das Meer voller Ideen.",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),*/
                SizedBox(height: screenHeight * 0.7),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "E n t d e c k e   d i e   W e l t   d e r   k r e a t i v e n   \nP r o d u k t e !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: StartButton(
                    myText: "Shoppe los",
                    event: () => Navigator.pushNamed(context, "/menupage"),
                    /*MyButton(
                    myText: "Shoppe los",
                    event: () => Navigator.pushNamed(context, "/menupage"),*/
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
