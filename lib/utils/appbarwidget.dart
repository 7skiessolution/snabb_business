// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class AppBarWidgt extends StatelessWidget {
  AppBarWidgt({required this.text, super.key, d});

  String text;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.09,
      // color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            width: width * 0.7,
            height: height * 0.02,
          ),
          // Container(
          //     width: width * 0.7,
          //     height: height * 0.06,
          //     color: white,
          //     child: Row(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //           child: InkWell(
          //             onTap: () {
          //               Navigator.pop(context);
          //             },
          //             child: Icon(
          //               Icons.arrow_back_ios,
          //               color: darkblue,
          //               size: 25,
          //             ),
          //           ),
          //         ),
          //         Text(
          //           text,
          //           style: TextStyle(color: darkblue),
          //         )
          //       ],
          //     )),
          Card(
            elevation: 10,
            child: SizedBox(
                height: height * 0.06,
                width: width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Expanded(
                        child: Container(
                            height: height,
                            width: width,
                            alignment: Alignment.center,
                            child: Text(
                              text,
                              style: TextStyle(color: darkblue),
                            )),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
