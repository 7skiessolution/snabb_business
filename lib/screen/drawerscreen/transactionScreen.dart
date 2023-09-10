import 'package:flutter/material.dart';
import 'package:snabb_business/utils/transaction_tile.dart';

import '../../utils/colors.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var width;
  var height;
  var year = 2023;
  var total = "70,000";
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
          onPressed: () {},
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
                          // year--;
                          setState(() {});

                          print("cllick me ");
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                      Text(
                        "${year.toString()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05),
                      ),
                      IconButton(
                        onPressed: () {
                          year++;
                          setState(() {});
                          print("cllick me ");
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
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
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Total : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Text(
                              "${total.toString()}",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      TransactionTile()
                    ],
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
