import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class CText extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;

  CText({
    super.key,
    required this.text,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: textcolor),
    );
  }
}
