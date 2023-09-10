import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import 'BudgetScreen.dart';

class MonthlyBudgets extends StatefulWidget {
  const MonthlyBudgets({super.key});

  @override
  State<MonthlyBudgets> createState() => _MonthlyBudgetsState();
}

class _MonthlyBudgetsState extends State<MonthlyBudgets> {
  var width;
  var height;
  var title = "Monthly Budgets";
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.red,
          onPressed: () {

             print("click");

            // Get.to(()=>const BudgetScreen());
            Navigator.push(context, MaterialPageRoute(builder: (cotex)=> BudgetScreen()));
            
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height * 0.15,
                color: AppColors.topcard,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                      Text(
                        "${title.toString()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                        color: Colors.white,
                      ),
                    ]),
              ),
              Positioned(
                top: height * 0.12,
                right: width * 0.015,
                left: width * 0.015,
                child: Container(
                  width: width,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: AppColors.tilebackground,
                    child: Column(
                      children: [
                        ListTileWidget(
                          title: "Electricity bills ",
                          to: "01/11/2023",
                          from: "01/12/2023",
                          persantage: "30%",
                          paid: "0",
                          total: "20000",
                        ),
                        ListTileWidget(
                          title: "Monthly Budget ",
                          to: "01/11/2023",
                          from: "01/12/2023",
                          persantage: "30%",
                          paid: "0",
                          total: "20000",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  ListTileWidget({
    super.key,
    required this.from,
    required this.paid,
    required this.persantage,
    required this.title,
    required this.to,
    required this.total,
    this.image = 'images/sale.png',
  });
  String image;
  String title;
  String to;
  String from;
  String persantage;
  String paid;
  String total;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: AppColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(image),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        to,
                        style: TextStyle(
                            fontSize: width * 0.03, color: Colors.grey),
                      ),
                      Text(
                        persantage,
                        style: TextStyle(
                            fontSize: width * 0.03, color: Colors.grey),
                      ),
                      Text(
                        from,
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
                      Row(
                        children: [
                          Text(
                            paid,
                            style: TextStyle(
                                fontSize: width * 0.03, color: Colors.grey),
                          ),
                          Text(
                            ".00 PKR",
                            style: TextStyle(
                                fontSize: width * 0.03, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ${int.parse(total) - int.parse(paid)}',
                            style: TextStyle(
                                fontSize: width * 0.03,
                                color: AppColors.redcolor),
                          ),
                          Text(
                            "PKR",
                            style: TextStyle(
                                fontSize: width * 0.03,
                                color: AppColors.redcolor),
                          )
                        ],
                      ),
                      Text(
                        total,
                        style: TextStyle(
                            fontSize: width * 0.03, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Residual amount: ",
                    style: TextStyle(
                        fontSize: width * 0.035, color: AppColors.blackcolor),
                  ),
                  Text(
                    " 11,000 PKR",
                    style: TextStyle(
                        fontSize: width * 0.035, color: AppColors.blackcolor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
