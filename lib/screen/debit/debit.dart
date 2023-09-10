import 'package:flutter/material.dart';
import 'package:snabb_business/utils/colors.dart';

import '../../utils/appbarwidget.dart';
import '../../utils/color.dart';
import '../../utils/debitbutton.dart';
import '../../utils/demonshape.dart';

class DebitScreen extends StatelessWidget {
  const DebitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //add search bar
                  Container(
                    height: height * 0.1,
                    width: width,
                    color: darkblue,
                    child: AppBarWidgt(text: "Debits"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    width: width,
                    color: AppColors.whitecolor,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          color: AppColors.tilebackground,
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage("images/expensive.png"),
                            ),
                            title: Text(
                              'DebitScreen: Friend to You',
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "01/11/2023",
                              style: TextStyle(
                                  fontSize: width * 0.03, color: Colors.grey),
                            ),
                            Text(
                              "0%",
                              style: TextStyle(
                                  fontSize: width * 0.04, color: Colors.grey),
                            ),
                            Text(
                              "01/12/2023",
                              style: TextStyle(
                                  fontSize: width * 0.03, color: Colors.grey),
                            ),
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.3,
                          minHeight: 7,
                          color: AppColors.redcolor,
                        ),
                        SizedBox(
                          height: height * 0.009,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "0.00 PKR",
                              style: TextStyle(
                                  fontSize: width * 0.03, color: Colors.grey),
                            ),
                            Text(
                              "9,000 PKR",
                              style: TextStyle(
                                  fontSize: width * 0.03,
                                  color: AppColors.redcolor),
                            ),
                            Text(
                              "20,000 PKR",
                              style: TextStyle(
                                  fontSize: width * 0.03, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Residual amount: ",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: AppColors.blackcolor),
                            ),
                            Text(
                              " 11,000 PKR",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: AppColors.redcolor),
                            ),
                          ],
                        ),
                        // const Divider(
                        //   thickness: 1,
                        //   color: Colors.grey,
                        // )
                      ],
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
            Positioned(
              bottom: height * 0.0,
              right: 6,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Transform.scale(
                      scale: 0.8, child: const DebitfloatingButton())),
            ),
          ],
        ),
      ),
    );
  }
}