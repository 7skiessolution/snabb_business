// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class AppBarWidgt extends StatelessWidget {
  AppBarWidgt({
    required this.text,
    super.key,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.09,
      // color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            width: width * 0.7,
            height: height * 0.02,
          ),
          Container(
              width: width * 0.7,
              height: height * 0.06,
              color: white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: darkblue,
                        size: 25,
                      ),
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(color: darkblue),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
