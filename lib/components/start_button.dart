import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';

class StartButton extends StatelessWidget {
  final String myText;
  final void Function()? event;

  const StartButton({
    Key? key,
    required this.myText,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);
    Color textColor = darkModeProvider.isDarkMode ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: event,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          /*color: darkModeProvider.isDarkMode
              ? Color.fromARGB(255, 171, 172, 180)
              : Color.fromARGB(255, 146, 192, 29),*/
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myText,
              style: TextStyle(
                color: Color.fromARGB(255, 8, 22, 35),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 8, 22, 35),
            ),
          ],
        ),
      ),
    );
  }
}
