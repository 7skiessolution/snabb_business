// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';

class AddDebit extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AddDebit({super.key});
  @override
  State<AddDebit> createState() => _AddDebitState();
}

class _AddDebitState extends State<AddDebit> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _balanceController = TextEditingController();
  TextEditingController _person = TextEditingController();
  TextEditingController _currentDateController = TextEditingController();
  TextEditingController _dueDateController = TextEditingController();
  TextEditingController _notesController = TextEditingController();
  DateTime _currentDate = DateTime.now();
  DateTime _dueDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Future<void> _selectDate(BuildContext context,
        TextEditingController controller, DateTime initialDate) async {
      final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (selectedDate != null) {
        setState(() {
          controller.text = DateFormat.yMMMd().format(selectedDate);
          if (controller == _currentDateController) {
            _currentDate = selectedDate;
          } else if (controller == _dueDateController) {
            _dueDate = selectedDate;
          }
        });
      }
    }

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: height * 0.15,
                  color: darkblue,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: white,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Text(
                          'New Debit',
                          style: TextStyle(
                              color: white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.1,
                  left: width * 0.025,
                  child: Container(
                    height: height * 0.9,
                    width: width * 0.95,
                    color: white,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Container(
                          height: height,
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: height * 0.07,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _balanceController,
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          decoration: InputDecoration(
                                              labelText: "Balance Amount",
                                              labelStyle: TextStyle(
                                                  fontSize: 20,
                                                  color: lightgray
                                                      .withOpacity(0.4))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the balance amount';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Create the associated \ntransaction (Debit)",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.06,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.wallet)),
                                      Text(
                                        "Wellet:",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.09,
                                  child: InkWell(
                                    onTap: () => _selectDate(context,
                                        _currentDateController, _currentDate),
                                    child: IgnorePointer(
                                      child: TextFormField(
                                        controller: _currentDateController,
                                        decoration: InputDecoration(
                                          labelText: 'Date',
                                          prefixIcon:
                                              Icon(Icons.calendar_today),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter the current date';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.09,
                                  child: InkWell(
                                    onTap: () => _selectDate(
                                        context, _dueDateController, _dueDate),
                                    child: IgnorePointer(
                                      child: TextFormField(
                                        controller: _dueDateController,
                                        decoration: InputDecoration(
                                          labelText: 'Payback Date',
                                          prefixIcon:
                                              Icon(Icons.calendar_today),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter the due date';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.08,
                                  child: TextFormField(
                                    controller: _person,
                                    decoration: InputDecoration(
                                      labelText: 'From',
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.movie_edit,
                                      color: darkblue,
                                      size: 30,
                                    ),
                                    Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border:
                                                Border.all(color: darkblue)),
                                        height: height * 0.1,
                                        width: width * 0.7,
                                        child: TextFormField(
                                          controller: _notesController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 20),
                                            labelText: 'notes',
                                            fillColor: white,
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter a name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.file_present_outlined,
                                      color: darkblue,
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Card(
                                      child: Container(
                                        width: width * 0.25,
                                        height: height * 0.06,
                                        child: Center(
                                            child: Text(
                                          "Add File",
                                          style: TextStyle(color: white),
                                        )),
                                        decoration: BoxDecoration(
                                            color: darkblue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    )
                                  ],
                                ),
                                Card(
                                  child: Container(
                                    width: width * 0.55,
                                    height: height * 0.06,
                                    child: Center(
                                        child: Text(
                                      "Add",
                                      style: TextStyle(color: white),
                                    )),
                                    decoration: BoxDecoration(
                                        color: darkblue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
