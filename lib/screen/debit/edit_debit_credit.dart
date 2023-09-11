// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields, depend_on_referenced_packages, use_build_context_synchronously
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snabb_business/controller/debit-credit/add_debit_controller.dart';
import 'package:snabb_business/models/add_debit_model.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/screen/sale/IncomeDataMode.dart';
import 'package:snabb_business/screen/sale/income_catagery._model.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/spinkit.dart';
import 'package:velocity_x/velocity_x.dart';

class EditDebitCreditScreen extends StatefulWidget {
  DebitCreditData? data;
  num? remaing;

  EditDebitCreditScreen({
    super.key,
    required this.data,
    required this.remaing,
  });

  @override
  State<EditDebitCreditScreen> createState() => _EditDebitCreditScreenState();
}

class _EditDebitCreditScreenState extends State<EditDebitCreditScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final TextEditingController subcatagorycontroller = TextEditingController();
  String formatTime = "";
  String? maingetimage;
  String? selectcatagorytital;
  String? selectcatagoryurl;
  String? selectedcat;
  bool isLoading = false;
  bool isselectcatagory = false;
  bool isbankclick = false;
  bool iscashclick = false;
  bool schedual = false;
  CatagoryModel? catagorymodel;
  int? clicktile;
  var height, width;
  List<SubCatagoriesModel> dummysubcatagorylist = [];
  List<SubCatagoriesModel> subcatagorylistview = [];
  String? getimage;
  TextEditingController currentDateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  DateTime? currentdate;
  DateTime? duedate;

  Future<void> selectDate(BuildContext context,
      TextEditingController controller, DateTime initialDate) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      controller.text = DateFormat.yMMMd().format(selectedDate);
      if (controller == currentDateController) {
        setState(() {
          currentdate = selectedDate;
        });
      }
    }
  }

  Future<void> selectDatepayback(BuildContext context,
      TextEditingController controller, DateTime initialDate) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      controller.text = DateFormat.yMMMd().format(selectedDate);
      if (controller == dueDateController) {
        setState(() {
          duedate = selectedDate;
        });
      }
    }
  }

  IncomeDataCategory? selectcatagorytile;
  List<IncomeData> incomeDatList = [];

  @override
  void initState() {
    Get.put(AddDebitController());
    balanceController.text = widget.data!.amount.toString();
    noteController.text = widget.data!.note!;
    nameController.text = widget.data!.person.toString();

    currentdate = DateFormat("dd-MM-yyyy").parse(widget.data!.date!);
    duedate = DateFormat("dd-MM-yyyy").parse(widget.data!.payBackDate!);

    final formattedDate = DateFormat.yMMMd().format(currentdate!);
    currentDateController.text = formattedDate;
    final duedatestring = DateFormat.yMMMd().format(duedate!);
    dueDateController.text = duedatestring;

// ....
    // DeptScreenController.to.update();
    super.initState();
  }

  bool opencatagoryclick = false;

  @override
  void dispose() {
    //_cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButton.extended(
        onPressed: () {},
        label: Text(AppLocalizations.of(context)!.add).pSymmetric(h: 60));
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    FloatingActionButton.extended(
        onPressed: () {},
        label: Text(AppLocalizations.of(context)!.add).pSymmetric(h: 60));
    return KeyboardVisibilityBuilder(builder: (context, keyboard) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: GetBuilder<AddDebitController>(builder: (obj) {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05, right: width * 0.05),
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
                                  widget.data!.type == "Debit"
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
                                  controller: balanceController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  decoration: InputDecoration(
                                      labelText:
                                          "${AppLocalizations.of(context)!.balance}${AppLocalizations.of(context)!.amount}"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .pleaseenterthebalanceamount;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              InkWell(
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
                            ],
                          ).pSymmetric(v: 10),

                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .createtheassociatedntransaction,
                                style: TextStyle(fontSize: width * 0.03),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.wallet)),
                                  Text(
                                    "${AppLocalizations.of(context)!.wallet}:",
                                    style: TextStyle(fontSize: width * 0.03),
                                  ),
                                ],
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () => selectDate(
                              context,
                              currentDateController,
                              currentdate!,
                            ),
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: currentDateController,
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!.date,
                                  prefixIcon: Icon(Icons.calendar_today,
                                      color: darkblue),
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
                                  onTap: () => selectDatepayback(
                                      context, dueDateController, duedate!),
                                  child: IgnorePointer(
                                    child: TextFormField(
                                      controller: dueDateController,
                                      decoration: InputDecoration(
                                        labelText: AppLocalizations.of(context)!
                                            .paybackdate,
                                        prefixIcon: Icon(Icons.calendar_today,
                                            color: darkblue),
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
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: widget.data!.type == 0
                                  ? AppLocalizations.of(context)!.from
                                  : AppLocalizations.of(context)!.to,
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
                              Icon(
                                Icons.note_alt_outlined,
                                size: 35,
                                color: darkblue,
                              ).pOnly(right: 10),
                              Expanded(
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SizedBox(
                                    child: TextFormField(
                                      maxLines: 4,
                                      controller: noteController,
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

                          SizedBox(
                            height: height * 0.025,
                          ),
                          Center(
                            child: SizedBox(
                              width: width / 2,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                child: InkWell(
                                  onTap: () {
                                    DateTime parsedDate = DateFormat('MMM d, y')
                                        .parse(currentDateController.text
                                            .toString());

                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(parsedDate);

                                    DateTime parsedDate1 =
                                        DateFormat('MMM d, y').parse(
                                            dueDateController.text.toString());
                                    String formattedDate1 =
                                        DateFormat('dd-MM-yyyy')
                                            .format(parsedDate1);
                                    double amount =
                                        double.parse(balanceController.text);
                                    obj.editDebitCredit(
                                        nameController.text,
                                        noteController.text,
                                        amount,
                                        formattedDate,
                                        formattedDate1,
                                        widget.data!.id!);
                                    obj.isLoading = false;
                                    obj.update();
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.4,
                                    decoration: BoxDecoration(
                                        color: darkblue,
                                        borderRadius: BorderRadius.circular(7)),
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
                          // : CircularProgressIndicator()
                        ],
                      ),
                    ),
                    obj.isLoading == false
                        ? SizedBox()
                        : Center(
                            child: Container(
                              height: height,
                              width: width,
                              color: darkblue.withOpacity(0.1),
                              child: Center(
                                child: SpinKit.loadSpinkit,
                              ),
                            ),
                          )
                  ],
                );
              }),
            ),
          ),
        ),
      );
    });
  }
}
