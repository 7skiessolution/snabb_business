// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields, depend_on_referenced_packages, use_build_context_synchronously
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:snabb_business/controller/debit-credit/add_debit_controller.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/models/add_debit_model.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/screen/sale/IncomeDataMode.dart';
import 'package:snabb_business/screen/sale/income_catagery._model.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
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
        child: KeyboardVisibilityBuilder(builder: (context, keyboard) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: AppBarWidgt(
                        text: widget.data!.type == "Debit"
                            ? AppLocalizations.of(context)!.newdeptor
                            : AppLocalizations.of(context)!.newcreditor,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.1),
                    child: SizedBox(
                      height: height * 0.12,
                      width: width,
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.12,
                            width: width,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/dollar.jpg"))),
                          ),
                          Container(
                            height: height * 0.12,
                            width: width,
                            color: blue.withOpacity(0.9),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.1, top: height * 0.03),
                              child: Text(
                                "Edit Entry",
                                style: GoogleFonts.poppins(
                                    color: white,
                                    fontSize: width * 0.35,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.17),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        shadowColor: Colors.blue[900],
                        elevation: 10,
                        child: SizedBox(
                            height: height * 0.75,
                            width: width * 0.9,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.05, right: width * 0.05),
                                  child: GetBuilder<AddDebitController>(
                                      initState: (state) {
                                    // AddDebitController.to
                                    //     .getCatagoriesdata("income");
                                  }, builder: (obj) {
                                    return SizedBox(
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: balanceController,
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            decoration: InputDecoration(
                                                labelText:
                                                    "${AppLocalizations.of(context)!.balance} ${AppLocalizations.of(context)!.amount}"),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return AppLocalizations.of(
                                                        context)!
                                                    .accountname;
                                              }
                                              return null;
                                            },
                                          ),

                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .createtheassociatedntransaction,
                                              style: TextStyle(
                                                  fontSize: width * 0.03),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          // Column(children: [
                                          //   Row(
                                          //     children: [
                                          //       Radio(
                                          //         activeColor: darkblue!,
                                          //         value: "Cash",
                                          //         groupValue: paymentMethod,
                                          //         onChanged: (value) {
                                          //           setState(() {
                                          //             print(value);
                                          //             paymentMethod = value!;
                                          //           });
                                          //         },
                                          //       ),
                                          //       Text(
                                          //         AppLocalizations.of(context)!
                                          //             .bycash,
                                          //         style: TextStyle(
                                          //             fontSize: width * 0.03),
                                          //       ),
                                          //       Radio(
                                          //         activeColor: darkblue!,
                                          //         value: AppLocalizations.of(
                                          //                 context)!
                                          //             .bank,
                                          //         groupValue: paymentMethod,
                                          //         onChanged: (value) {
                                          //           setState(() {
                                          //             print(value);
                                          //             paymentMethod = value!;
                                          //           });
                                          //         },
                                          //       ),
                                          //       Text(
                                          //         AppLocalizations.of(context)!
                                          //             .bybank,
                                          //         style: TextStyle(
                                          //             fontSize: width * 0.03),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ]),
                                          InkWell(
                                            onTap: () {
                                              selectDate(
                                                context,
                                                currentDateController,
                                                currentdate!,
                                              );
                                            },
                                            child: IgnorePointer(
                                              child: TextFormField(
                                                controller:
                                                    currentDateController,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      AppLocalizations.of(
                                                              context)!
                                                          .date,
                                                  labelStyle: TextStyle(
                                                      fontSize: width * 0.03),
                                                  prefixIcon: Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return AppLocalizations.of(
                                                            context)!
                                                        .pleaseenterthecurrentdate;
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),

                                          InkWell(
                                            onTap: () {
                                              selectDatepayback(context,
                                                  dueDateController, duedate!);
                                            },
                                            child: IgnorePointer(
                                              child: TextFormField(
                                                controller: dueDateController,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      AppLocalizations.of(
                                                              context)!
                                                          .paybackdate,
                                                  labelStyle: TextStyle(
                                                      fontSize: width * 0.03),
                                                  prefixIcon: Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return AppLocalizations.of(
                                                            context)!
                                                        .pleaseentertheduedate;
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: nameController,
                                            decoration: InputDecoration(
                                              labelText:
                                                  widget.data!.type == "Debit"
                                                      ? AppLocalizations.of(
                                                              context)!
                                                          .from
                                                      : AppLocalizations.of(
                                                              context)!
                                                          .to,
                                              labelStyle: TextStyle(
                                                  fontSize: width * 0.03),
                                              prefixIcon: Icon(
                                                Icons.person,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return AppLocalizations.of(
                                                        context)!
                                                    .pleaseenteraname;
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: height / 30,
                                          ),
                                          TextFormField(
                                            controller: noteController,
                                            decoration: InputDecoration(
                                              labelText:
                                                  AppLocalizations.of(context)!
                                                      .notes,
                                              labelStyle: TextStyle(
                                                  fontSize: width * 0.03),
                                              prefixIcon: Icon(
                                                Icons.edit,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return AppLocalizations.of(
                                                        context)!
                                                    .pleaseenteraname;
                                              }
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: height * 0.04,
                                          ),
                                          SizedBox(
                                            height: height * 0.05,
                                            width: width,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    TransactionController.to
                                                        .selectImages(
                                                            context,
                                                            height,
                                                            width,
                                                            true);
                                                  },
                                                  child: SizedBox(
                                                    height: height * 0.05,
                                                    width: width * 0.1,
                                                    child: Icon(
                                                      Icons.camera_alt_rounded,
                                                      color: lightgray,
                                                      size: width * 0.09,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: width * 0.05),
                                                InkWell(
                                                  onTap: () {
                                                    TransactionController.to
                                                        .selectImages(
                                                            context,
                                                            height,
                                                            width,
                                                            false);
                                                  },
                                                  child: SizedBox(
                                                    height: height * 0.05,
                                                    width: width * 0.1,
                                                    child: Icon(
                                                      Icons.folder,
                                                      color: lightgray,
                                                      size: width * 0.09,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.04,
                                          ),
                                          Center(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      height: height * 0.05,
                                                      width: width * 0.25,
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3)),
                                                      child: Center(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .cancel,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.03,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      DateTime parsedDate =
                                                          DateFormat('MMM d, y').parse(
                                                              currentDateController
                                                                  .text
                                                                  .toString());

                                                      String formattedDate =
                                                          DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(
                                                                  parsedDate);

                                                      DateTime parsedDate1 =
                                                          DateFormat('MMM d, y')
                                                              .parse(dueDateController
                                                                  .text
                                                                  .toString());
                                                      String formattedDate1 =
                                                          DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(
                                                                  parsedDate1);
                                                      double amount =
                                                          double.parse(
                                                              balanceController
                                                                  .text);
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
                                                      width: width * 0.25,
                                                      decoration: BoxDecoration(
                                                          color: darkblue!,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3)),
                                                      child: Center(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .add,
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.03,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
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
                                AddDebitController.to.isLoading == false
                                    ? SizedBox()
                                    : Center(
                                        child: Container(
                                          height: height,
                                          width: width,
                                          color: darkblue!.withOpacity(0.1),
                                          child: Center(
                                            child: SpinKit.loadSpinkit,
                                          ),
                                        ),
                                      )
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
