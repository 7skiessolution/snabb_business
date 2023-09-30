// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/utils/color.dart';

class AppBarWidgt extends StatelessWidget {
  AppBarWidgt({required this.text, super.key, d});

  String text;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.10,
      // color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            width: width * 0.7,
            height: height * 0.02,
          ),
       
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
                               style: GoogleFonts.poppins(
                                              color: darkblue,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w600),
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
