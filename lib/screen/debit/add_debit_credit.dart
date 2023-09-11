// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields, depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:snabb_business/controller/debit-credit/add_debit_controller.dart';
import 'package:snabb_business/controller/debit-credit/dept_controler.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/utils/color.dart';

class AddCreditDebitScreen extends StatefulWidget {
  final String balanceType;

  const AddCreditDebitScreen({
    super.key,
    required this.balanceType,
  });

  @override
  State<AddCreditDebitScreen> createState() => _AddCreditDebitScreenState();
}

class _AddCreditDebitScreenState extends State<AddCreditDebitScreen> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay _selectedTime = TimeOfDay.now();
  //final userId = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController controller = TextEditingController();
  final TextEditingController subcatagorycontroller = TextEditingController();
  String formatTime = "";

  String? paymentMethod;
  bool schedual = false;
  int? clicktile;
  var height, width;
  String? getimage;

  @override
  void initState() {
    Get.put(AddDebitController());
    Get.put(DeptScreenController());
    Get.put(TransactionController());
    DeptScreenController.to.clearcontroller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButton.extended(
        onPressed: () {},
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Text(AppLocalizations.of(context)!.add),
        ));
    height = MediaQuery.of(context).size.height;

    width = MediaQuery.of(context).size.width;

    FloatingActionButton.extended(
        onPressed: () {},
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(AppLocalizations.of(context)!.add),
        ));
    return SafeArea(
      child: KeyboardVisibilityBuilder(builder: (context, keyboard) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: GetBuilder<AddDebitController>(initState: (state) {
                    AddDebitController.to.getCatagoriesdata("income");
                  }, builder: (obj) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.07,
                            width: width,
                            decoration: BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: width * 0.065,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                Text(
                                  widget.balanceType == "Debit"
                                      ? AppLocalizations.of(context)!.newdeptor
                                      : AppLocalizations.of(context)!
                                          .newcreditor,
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: width * 0.21,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.025,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: obj.balanceController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  decoration: InputDecoration(
                                      labelText:
                                          "${AppLocalizations.of(context)!.balance} ${AppLocalizations.of(context)!.amount}"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .accountname;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InkWell(
                                  onTap: () {
                                    // CalculatorController.to.clear();
                                    // BudgetCalculator
                                    //     .addSimpleCalculatorBottomSheet(
                                    //         context: context,
                                    //         height: height,
                                    //         width: width);
                                  },
                                  child: Image.asset(
                                    "assets/images/cal.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .createtheassociatedntransaction,
                                style: TextStyle(fontSize: width * 0.03),
                              ),
                            ],
                          ),
                          Column(children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: darkblue,
                                  value: "Cash",
                                  groupValue: paymentMethod,
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      paymentMethod = value!;
                                    });
                                  },
                                ),
                                Text(
                                  AppLocalizations.of(context)!.bycash,
                                  style: TextStyle(fontSize: width * 0.03),
                                ),
                                Radio(
                                  activeColor: darkblue,
                                  value: AppLocalizations.of(context)!.bank,
                                  groupValue: paymentMethod,
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      paymentMethod = value!;
                                    });
                                  },
                                ),
                                Text(
                                  AppLocalizations.of(context)!.bybank,
                                  style: TextStyle(fontSize: width * 0.03),
                                )
                              ],
                            ),
                          ]),
                          InkWell(
                            onTap: () {
                              obj.selectDate(
                                context,
                                obj.currentDateController,
                                obj.currentdate!,
                              );
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: obj.currentDateController,
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!.date,
                                  labelStyle: TextStyle(fontSize: width * 0.03),
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    color: darkblue,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .pleaseenterthecurrentdate;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    obj.selectDate(context,
                                        obj.dueDateController, obj.duedate!);
                                  },
                                  child: IgnorePointer(
                                    child: TextFormField(
                                      controller: obj.dueDateController,
                                      decoration: InputDecoration(
                                        labelText: AppLocalizations.of(context)!
                                            .paybackdate,
                                        labelStyle:
                                            TextStyle(fontSize: width * 0.03),
                                        prefixIcon: Icon(
                                          Icons.calendar_today,
                                          color: darkblue,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return AppLocalizations.of(context)!
                                              .pleaseentertheduedate;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: obj.person,
                            decoration: InputDecoration(
                              labelText: widget.balanceType == "Debit"
                                  ? AppLocalizations.of(context)!.from
                                  : AppLocalizations.of(context)!.to,
                              labelStyle: TextStyle(fontSize: width * 0.03),
                              prefixIcon: Icon(
                                Icons.person,
                                color: darkblue,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .pleaseenteraname;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.note_alt_outlined,
                                  size: 35,
                                  color: darkblue,
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SizedBox(
                                    child: TextFormField(
                                      maxLines: 4,
                                      controller: obj.noteController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle:
                                            TextStyle(color: Colors.black),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        fillColor:
                                            Colors.black.withOpacity(0.2),
                                        hintText:
                                            AppLocalizations.of(context)!.notes,
                                        alignLabelWithHint: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: darkblue,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: darkblue,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.file_present_outlined,
                                size: width * 0.065,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: InkWell(
                                  onTap: () {
                                    obj.selectImage(context);
                                  },
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                        color: darkblue,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context)!.addfile,
                                        // AppLocalizations.of(context)!.addFile,
                                        style: TextStyle(
                                            fontSize: width * 0.03,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // !isLoading
                          //     ?
                          SizedBox(
                            height: height * 0.025,
                          ),
                          widget.balanceType == "Debit"
                              ? Center(
                                  child: SizedBox(
                                    width: width / 2,
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: InkWell(
                                        onTap: () async {
                                          if (_formKey.currentState!
                                                  .validate() &&
                                              paymentMethod != null) {
                                            DateTime parsedDate =
                                                DateFormat('MMM d, y').parse(obj
                                                    .currentDateController.text
                                                    .toString());

                                            String curentdate =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(parsedDate);

                                            DateTime parsedDate1 =
                                                DateFormat('MMM d, y').parse(obj
                                                    .dueDateController.text
                                                    .toString());
                                            String duedate =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(parsedDate1);

                                            num amoubt = double.parse(
                                                obj.balanceController.text);
                                            bool cashs;
                                            if (paymentMethod == "Cash") {
                                              cashs = true;
                                            } else {
                                              cashs = false;
                                            }

                                            formatTime =
                                                "${_selectedTime.hour}:${_selectedTime.minute} ${_selectedTime.period.name.toUpperCase()}";
                                            String? note;
                                            if (obj
                                                .noteController.text.isEmpty) {
                                              setState(() {
                                                note = "empty";
                                              });
                                            } else {
                                              setState(() {
                                                note = obj.noteController.text;
                                              });
                                            }
                                            obj.addDebit(
                                              obj.person.text,
                                              note!,
                                              amoubt,
                                              "$curentdate $formatTime",
                                              duedate,
                                              0,
                                              cashs,
                                              obj.catid!,
                                            );
                                            TransactionController.to
                                                .fetchDebtsCredits();
                                            Navigator.pop(context);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "give all fields",
                                                backgroundColor: darkblue,
                                                textColor: Colors.white,
                                                gravity: ToastGravity.BOTTOM,
                                                fontSize: 17,
                                                timeInSecForIosWeb: 1,
                                                toastLength: Toast.LENGTH_LONG);
                                          }
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          width: width * 0.4,
                                          decoration: BoxDecoration(
                                              color: darkblue,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!.add,
                                              style: TextStyle(
                                                  fontSize: width * 0.03,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: SizedBox(
                                    width: width / 2,
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: InkWell(
                                        onTap: () async {
                                          if (_formKey.currentState!
                                                  .validate() &&
                                              paymentMethod != null) {
                                            bool cash;
                                            if (paymentMethod == "Cash") {
                                              cash = true;
                                            } else {
                                              cash = false;
                                            }

                                            DateTime parsedDate =
                                                DateFormat('MMM d, y').parse(obj
                                                    .currentDateController.text
                                                    .toString());

                                            String curentdate =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(parsedDate);

                                            DateTime parsedDate1 =
                                                DateFormat('MMM d, y').parse(obj
                                                    .dueDateController.text
                                                    .toString());
                                            String duedate =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(parsedDate1);

                                            num amoubt = double.parse(
                                                obj.balanceController.text);
                                            bool cashs;
                                            if (paymentMethod == "Cash") {
                                              cashs = true;
                                            } else {
                                              cashs = false;
                                            }

                                            formatTime =
                                                "${_selectedTime.hour}:${_selectedTime.minute} ${_selectedTime.period.name.toUpperCase()}";

                                            String? note;
                                            if (obj
                                                .noteController.text.isEmpty) {
                                              setState(() {
                                                note = "empty";
                                              });
                                            } else {
                                              setState(() {
                                                note = obj.noteController.text;
                                              });
                                            }
                                            obj.addDebit(
                                              obj.person.text,
                                              note!,
                                              amoubt,
                                              "$curentdate $formatTime",
                                              duedate,
                                              1,
                                              cashs,
                                              obj.catid!,
                                            );
                                            TransactionController.to
                                                .fetchDebtsCredits();

                                            Navigator.pop(context);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "give all fields",
                                                backgroundColor: darkblue,
                                                textColor: Colors.white,
                                                gravity: ToastGravity.BOTTOM,
                                                fontSize: 17,
                                                timeInSecForIosWeb: 1,
                                                toastLength: Toast.LENGTH_LONG);
                                          }
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          width: width * 0.4,
                                          decoration: BoxDecoration(
                                              color: darkblue,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!.add,
                                              style: TextStyle(
                                                  fontSize: width * 0.03,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          keyboard
                              ? SizedBox(
                                  height: height * 0.5,
                                )
                              : SizedBox()
                        ],
                      ),
                    );
                  }),
                ),
                // AddDebitController.to.isLoading == true
                //     ? Center(
                //         child: Container(
                //           height: height,
                //           width: width,
                //           color: darkblue.withOpacity(0.2),
                //           child: Center(
                //             child: SpinKit.loadSpinkit,
                //           ),
                //         ),
                //       )
                //     : SizedBox()
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.anotherpage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ),
    );
  }
}
