import 'package:calculator/util/calculation.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  Color color;
  MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(text
        ,style: 
        TextStyle(fontSize: 24.0,
        fontWeight: FontWeight.bold,
        ),
        ),
        color: color,
        minWidth: 80.0,
        height: 75,
        textColor: Colors.white,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        ),
    );
  }
}
