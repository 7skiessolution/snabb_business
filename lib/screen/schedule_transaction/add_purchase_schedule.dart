import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/utils/color.dart';

class AddPurchaseTransaction extends StatefulWidget {
  const AddPurchaseTransaction({super.key});

  @override
  State<AddPurchaseTransaction> createState() => _AddPurchaseTransactionState();
}

class _AddPurchaseTransactionState extends State<AddPurchaseTransaction> {
  String? dropdownValue = 'Payment Method';
  List<String> dropdownItems = <String>[
    'Purchase',
    'Payment Method',
  ];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _currentDateController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _person = TextEditingController();

  DateTime _currentDate = DateTime.now();
  DateTime _dueDate = DateTime.now();
  TimeOfDay? _currentTime;
  TextEditingController _currentTimeController = TextEditingController();

  @override
  void dispose() {
    _valueController.dispose();
    _typeController.dispose();
    _currentDateController.dispose();
    _dueDateController.dispose();
    _person.dispose();
    super.dispose();
  }

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

  Future<void> _selectTime(BuildContext context,
      TextEditingController controller, TimeOfDay? initialTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != initialTime) {
      setState(() {
        _currentTime = picked;
        controller.text = _currentTime!.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: height * 0.3,
                  color: darkblue,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: white,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Add Purchase Transaction",
                            style: TextStyle(
                                color: white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.4,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: TextFormField(
                                              controller: _typeController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                fillColor: white,
                                                errorStyle: TextStyle(
                                                    color: Colors.black),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 20),
                                                hintText: " value ",
                                                alignLabelWithHint: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: darkblue),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: darkblue),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        SizedBox(
                                          width: width * 0.4,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: TextFormField(
                                              controller: _valueController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                    color: Colors.black),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 20),
                                                hintText: " Type ",
                                                alignLabelWithHint: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: darkblue),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: darkblue),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.wallet)),
                                            const Text(
                                              "Wallet:",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SizedBox(
                                                          height: height * 0.5,
                                                          width: width * 0.8,
                                                          child: Center(
                                                            child: Container(
                                                              color:
                                                                  backgroundColor,
                                                              height:
                                                                  height * 0.5,
                                                              width:
                                                                  width * 0.8,
                                                              child: Stack(
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        height *
                                                                            0.15,
                                                                    width:
                                                                        width *
                                                                            0.8,
                                                                    color:
                                                                        darkblue,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              15.0,
                                                                          left:
                                                                              60,
                                                                          right:
                                                                              20),
                                                                      child:
                                                                          Text(
                                                                        "Select Payment Method",
                                                                        style: TextStyle(
                                                                            color:
                                                                                white,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top: height *
                                                                        0.08,
                                                                    left: width *
                                                                        0.05,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          height *
                                                                              0.35,
                                                                      width:
                                                                          width *
                                                                              0.7,
                                                                      color:
                                                                          white,
                                                                      child: Column(
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: width * 0.11,
                                                                                  height: height * 0.11,
                                                                                  child: Image(image: AssetImage("assets/bank.jpeg")),
                                                                                ),
                                                                                Text(
                                                                                  "BANK",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: width * 0.2,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: width * 0.11,
                                                                                  height: height * 0.11,
                                                                                  child: Image(image: AssetImage("assets/group1.jpg")),
                                                                                ),
                                                                                Text(
                                                                                  "CASH",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: width * 0.2,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: width * 0.11,
                                                                                  height: height * 0.11,
                                                                                  child: Image(image: AssetImage("assets/group2.jpg")),
                                                                                ),
                                                                                Text(
                                                                                  "OTHERS",
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: width * 0.18,
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text("Select Wallet"))
                                          ],
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () => _selectDate(context,
                                          _currentDateController, _currentDate),
                                      child: IgnorePointer(
                                        child: TextFormField(
                                          controller: _currentDateController,
                                          decoration: const InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            labelText: 'Date',
                                            prefixIcon:
                                                Icon(Icons.calendar_today),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter the current date';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.4,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width * 0.84,
                                              child: TextFormField(
                                                controller: _typeController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: TextStyle(
                                                      color: Colors.black),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  hintText: " Repeatees ",
                                                  alignLabelWithHint: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        SizedBox(
                                          width: width * 0.4,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Container(
                                                height: height * 0.07,
                                                width: width * 0.84,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: darkblue)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text("Day"),
                                                    Icon(Icons.arrow_drop_down)
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.4,
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: TextFormField(
                                              controller: _typeController,
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                    color: Colors.black),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 20),
                                                hintText: " Number of ",
                                                alignLabelWithHint: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: darkblue),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: darkblue),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.05,
                                        ),
                                        SizedBox(
                                            width: width * 0.4,
                                            child: Text("Zero Time Means")),
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.87,
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          controller: _typeController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            errorStyle:
                                                TextStyle(color: Colors.black),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 20),
                                            hintText: " From (Optional) ",
                                            alignLabelWithHint: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: darkblue),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: darkblue),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.87,
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextFormField(
                                          controller: _typeController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            errorStyle:
                                                TextStyle(color: Colors.black),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 20),
                                            hintText: " Notes (Optional)  ",
                                            alignLabelWithHint: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: darkblue),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: darkblue),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.38,
                                          child: InkWell(
                                            onTap: () => _selectDate(
                                                context,
                                                _currentDateController,
                                                _currentDate),
                                            child: IgnorePointer(
                                              child: TextFormField(
                                                controller:
                                                    _currentDateController,
                                                decoration:
                                                    const InputDecoration(
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  labelText: 'Date',
                                                  prefixIcon: Icon(
                                                      Icons.calendar_today),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter the current date';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.14,
                                        ),
                                        SizedBox(
                                          width: width * 0.38,
                                          child: InkWell(
                                            onTap: () => _selectTime(
                                                context,
                                                _currentTimeController,
                                                _currentTime),
                                            child: IgnorePointer(
                                              child: TextFormField(
                                                controller:
                                                    _currentTimeController,
                                                decoration:
                                                    const InputDecoration(
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  labelText: 'Time',
                                                  prefixIcon:
                                                      Icon(Icons.access_time),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please select the current time';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Card(
                                          child: Container(
                                            width: width * 0.4,
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
                                        ),
                                        Card(
                                          child: Container(
                                            width: width * 0.4,
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
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
