import 'package:flutter/material.dart';
import 'package:snabb_business/utils/color.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  String selectedCategory = 'Sale';
  List<String> categories = ['Sale', 'Purchase'];

  String selectedMonth = 'One Month';
  List<String> months = ['One Month', 'Three Month', 'Six Month', 'Year'];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: width,
            height: height,
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.1,
                decoration: BoxDecoration(
                    color: darkblue,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(children: [
                    SizedBox(
                      width: width * 0.05,
                    ),
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: white,
                        )),
                    SizedBox(
                      width: width * 0.15,
                    ),
                    Text(
                      "Budget",
                      style: TextStyle(
                          color: white,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Select Category"),
                  DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
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
                    "Amount",
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                  Container(
                    width: width * 0.3,
                    child: TextFormField(
                    
                      
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        hintText: "0.000"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Duration",
                    style: TextStyle(
                      fontSize: width * 0.05,
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedMonth,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedMonth = newValue!;
                      });
                    },
                    items: months.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: darkblue,
                          borderRadius: BorderRadius.circular(6)),
                      width: width * 0.25,
                      height: height * 0.05,
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: darkblue,
                          borderRadius: BorderRadius.circular(6)),
                      width: width * 0.25,
                      height: height * 0.05,
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(color: white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
