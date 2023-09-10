// ignore_for_file: must_be_immutable, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class Button extends StatelessWidget {
  Button({
    required this.Function,
    required this.title,
    super.key,
  });

  VoidCallback Function;
  String title;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Function();
      },
      child: Container(
        height: height * 0.06,
        width: width * 0.5,
        // ignore: sort_child_properties_last
        child: Center(
            child: Text(
          "Show Report",
          style: TextStyle(fontSize: 16, color: white),
        )),
        decoration: BoxDecoration(
            color: darkblue, borderRadius: BorderRadius.circular(2)),
      ),
    );
  }
}
