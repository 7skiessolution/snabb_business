import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              height: height * 0.6,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sales",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: darkblue,
                        fontSize: width * 0.06),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width,
                    color: darkblue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                        Icon(
                          Icons.filter_alt_outlined,
                          color: white,
                        ),
                        Text(
                          "Sale",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: white,
                    height: height * 0.25,
                    width: width,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.02,
                            left: width * 0.06,
                            right: width * 0.08,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${index + 1}-jun-2023",
                                style: TextStyle(color: textcolor),
                              ),
                              Text(
                                "40000",
                                style: TextStyle(color: textcolor),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width,
                    color: darkblue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grand Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                        Text(
                          "80,0000",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.17,
                    width: width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/chart.png"),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              height: height * 0.6,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Expenses",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: expensecolor,
                        fontSize: width * 0.06),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width,
                    color: expensecolor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                        Icon(
                          Icons.filter_alt_outlined,
                          color: white,
                        ),
                        Text(
                          "Expenses",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: white,
                    height: height * 0.25,
                    width: width,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.02,
                            left: width * 0.06,
                            right: width * 0.08,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${index + 1}-jun-2023",
                                style: TextStyle(color: textcolor),
                              ),
                              Text(
                                "50000",
                                style: TextStyle(color: textcolor),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width,
                    color: expensecolor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grand Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                        Text(
                          "6,0000",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.17,
                    width: width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/chart.png"),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              height: height * 0.6,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Puchase",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: lightgreen,
                        fontSize: width * 0.06),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width,
                    color: lightgreen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                        Icon(
                          Icons.filter_alt_outlined,
                          color: white,
                        ),
                        Text(
                          "Purchase",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: white,
                    height: height * 0.25,
                    width: width,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: height * 0.02,
                            left: width * 0.06,
                            right: width * 0.08,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${index + 1}-jun-2023",
                                style: TextStyle(color: textcolor),
                              ),
                              Text(
                                "90000",
                                style: TextStyle(color: textcolor),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width,
                    color: lightgreen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grand Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                        Text(
                          "80,0000",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.17,
                    width: width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/chart.png"),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
