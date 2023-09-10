import 'package:flutter/material.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:snabb_business/utils/customTextb3.dart';
import 'package:snabb_business/utils/shadule_tranListTile.dart';

import '../../utils/appbarwidget.dart';
import '../../utils/debitbutton.dart';
import '../../utils/transactionscheduleButton.dart';

class ShaduleTransactionScreen extends StatelessWidget {
  const ShaduleTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                AppBarWidgt(text: "Scheduled Transactions"),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            backgroundImage: AssetImage("images/expensive.png"),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextb3(
                                width: width,
                                text: 'Sale',
                              ),
                              CustomTextb3(
                                width: width,
                                text: '-20,000 Rs',
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Wallet"),
                              Text("0/9/2023",
                                  style: TextStyle(
                                      fontSize: width * 0.03,
                                      color: Colors.grey.withOpacity(0.5))),
                            ],
                          ),
                          trailing: const VerticalDivider(
                            color: Colors.blue,
                            thickness: 3,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "01/11/2023",
                            style: TextStyle(
                                fontSize: width * 0.02, color: Colors.grey),
                          ),
                          Text(
                            "01/12/2023",
                            style: TextStyle(
                                fontSize: width * 0.02, color: Colors.grey),
                          ),
                        ],
                      ),
                      const LinearProgressIndicator(
                        value: 0.3,
                        color: AppColors.redcolor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "0.00 PKR",
                            style: TextStyle(
                                fontSize: width * 0.02, color: Colors.grey),
                          ),
                          Text(
                            "9,000 PKR",
                            style: TextStyle(
                                fontSize: width * 0.02,
                                color: AppColors.redcolor),
                          ),
                          Text(
                            "20,000 PKR",
                            style: TextStyle(
                                fontSize: width * 0.02, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Residual amount: 0.00 PKR 11,000 PKR",
                            style: TextStyle(
                                fontSize: width * 0.03,
                                color: AppColors.blackcolor),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return ShaduleTransacrtionListtile(
                            width: width, height: height);
                      }),
                )
              ],
            ),
            Positioned(
              bottom: height * 0.0,
              right: 6,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Transform.scale(
                      scale: 0.8, child: const TransactionSechduleButton())),
            ),
          ],
        ),
      ),
    );
  }
}
