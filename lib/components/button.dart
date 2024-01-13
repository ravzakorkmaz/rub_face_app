import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rub_face_app/providers/dark_mode_provider.dart';

class MyButton extends StatelessWidget {
  final String myText;
  final void Function()? event;

  const MyButton({
    Key? key,
    required this.myText,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = Provider.of<DarkModeProvider>(context);

    return GestureDetector(
      onTap: event,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkModeProvider.isDarkMode
              ? Color.fromARGB(255, 14, 20, 31)
              : Color.fromARGB(255, 146, 192, 29),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 146, 192, 29)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
