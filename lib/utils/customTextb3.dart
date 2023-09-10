
import 'package:flutter/material.dart';

class CustomTextb3 extends StatelessWidget {
  const CustomTextb3({
    super.key,
    required this.width, required this.text,
  });

  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: width * 0.03,
          fontWeight: FontWeight.bold
          ),
    );
  }
}



