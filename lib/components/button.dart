import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String myText;
  final void Function()? event;
  const MyButton({
    super.key,
    required this.myText,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            //color: Color.fromARGB(255, 51, 179, 156),
            color: Color.fromARGB(255, 146, 192, 29),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              myText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
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
