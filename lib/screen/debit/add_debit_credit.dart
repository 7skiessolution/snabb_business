// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_final_fields, depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:snabb_business/controller/debit-credit/add_debit_controller.dart';
import 'package:snabb_business/controller/debit-credit/dept_controler.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/models/payment_type_model.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/spinkit.dart';

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
  final TextEditingController selectPaymentMethod = TextEditingController();
  String? selectedimage;
  String? selectedname;
  int? paymentMethod;
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
                Align(
                    alignment: Alignment.topCenter,
                    child: AppBarWidgt(
                      text: widget.balanceType == "Debit"
                          ? AppLocalizations.of(context)!.credit
                          : AppLocalizations.of(context)!.debit,
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
                          color: Colors.blue[900]!.withOpacity(0.9),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.1, top: height * 0.03),
                            child: Text(
                              "New Entry",
                               style: GoogleFonts.poppins(
                                              color: white,
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w500),
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
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: obj.balanceController,
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            decoration: InputDecoration(
                                              labelStyle:   GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w400),
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
                                              style:  GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          SizedBox(
                                              height: height * 0.06,
                                              width: width,
                                              // color: backgroundColor,
                                              child: InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          color: Colors
                                                              .grey.shade300,
                                                          height: height * 0.35,
                                                          width: width * 0.8,
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.15,
                                                                width: width,
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image: AssetImage(
                                                                            "images/dollar.jpg"))),
                                                              ),
                                                              Container(
                                                                height: height *
                                                                    0.15,
                                                                width: width,
                                                                color: Colors
                                                                    .blue[900]!
                                                                    .withOpacity(
                                                                        0.9),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: height *
                                                                          0.03,
                                                                      left: width *
                                                                          0.02),
                                                                  child: Text(
                                                                  selectedname==null?  "Select Payment ":selectedname!,
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
                                                              Padding(
                                                                padding: EdgeInsets.only(
                                                                    top: height *
                                                                        0.07),
                                                                child: Center(
                                                                  child: Card(
                                                                    elevation:
                                                                        10,
                                                                    shadowColor:
                                                                        Colors.blue[
                                                                            900],
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          height *
                                                                              0.3,
                                                                      width:
                                                                          width *
                                                                              0.7,
                                                                      color:
                                                                          white,
                                                                      child:
                                                                          Center(
                                                                        child: ListView.builder(
                                                                            itemCount: PaymentTypeModel.typemodellist.length,
                                                                            itemBuilder: (context, index) {
                                                                              bool isactive = HomeController.to.paymenttypeindex == index;
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    HomeController.to.paymenttypeindex = index;
                                                                                    paymentMethod = index;
                                                                                    selectedimage = PaymentTypeModel.typemodellist[HomeController.to.paymenttypeindex!].image;
                                                                                    selectPaymentMethod.text = PaymentTypeModel.typemodellist[HomeController.to.paymenttypeindex!].name!;
                                                                                  });
                                                                                  print("name $selectedname");
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: SizedBox(
                                                                                  height: height * 0.08,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: width * 0.11,
                                                                                        height: height * 0.11,
                                                                                        child: Image(image: AssetImage("${PaymentTypeModel.typemodellist[index].image}")),
                                                                                      ),
                                                                                      Text(
                                                                                        "${PaymentTypeModel.typemodellist[index].name}",
                                                                                        style: const TextStyle(
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: width * 0.2,
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: IgnorePointer(
                                                  child: TextFormField(
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    controller:
                                                        selectPaymentMethod,
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      labelText:
                                                         selectedname==null ?'Select Payment':"",
                                                      labelStyle:
                                                          const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                      prefixIcon: Icon(
                                                        Icons
                                                            .attach_money_outlined,
                                                        color: Colors
                                                            .grey.shade700,
                                                        size: 25,
                                                      ),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please Select Wallet';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              )),
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
                                                controller:
                                                    obj.currentDateController,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      AppLocalizations.of(
                                                              context)!
                                                          .date,
                                                    labelStyle: GoogleFonts.poppins(
                                              color:lightgray,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500),  
                                                    
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

                                          Row(
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    obj.selectDate(
                                                        context,
                                                        obj.dueDateController,
                                                        obj.duedate!);
                                                  },
                                                  child: IgnorePointer(
                                                    child: TextFormField(
                                                      controller:
                                                          obj.dueDateController,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .paybackdate,
                                                          labelStyle: GoogleFonts.poppins(
                                              color:lightgray,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500),  
                                                    
                                                        prefixIcon: Icon(
                                                          Icons.calendar_today,
                                                          color: Colors
                                                              .grey.shade700,
                                                        ),
                                                      ),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return AppLocalizations
                                                                  .of(context)!
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
                                              labelText:
                                                  widget.balanceType == "Debit"
                                                      ? AppLocalizations.of(
                                                              context)!
                                                          .from
                                                      : AppLocalizations.of(
                                                              context)!
                                                          .to,
   labelStyle: GoogleFonts.poppins(
                                              color:lightgray,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500),  
                                                    
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
                                          // SizedBox(
                                          //   height: height / 85,
                                          // ),
                                          TextFormField(
                                            controller: obj.noteController,
                                            decoration: InputDecoration(
                                              labelText:
                                                  AppLocalizations.of(context)!
                                                      .notes,
                                                labelStyle: GoogleFonts.poppins(
                                              color:lightgray,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500),  
                                                    
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: InkWell(
                                                  onTap: () {
                                                    obj.selectImage(context);
                                                  },
                                                  child: Container(
                                                    height: height * 0.05,
                                                    width: width * 0.2,
                                                    decoration: BoxDecoration(
                                                        color: darkblue!,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
                                                    child: Center(
                                                      child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .addfile,
                                                        // AppLocalizations.of(context)!.addFile,
                                                         style: GoogleFonts.poppins(
                                              color:Colors.white,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500), 
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
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            obj.clearfield();
                                                          },
                                                          child: Container(
                                                            height:
                                                                height * 0.05,
                                                            width: width * 0.25,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3)),
                                                            child: Center(
                                                              child: Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .cancel,
                                                                 style: GoogleFonts.poppins(
                                              color:Colors.white,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500), 
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () async {
                                                            if (_formKey
                                                                    .currentState!
                                                                    .validate() &&
                                                                paymentMethod !=
                                                                    null) {
                                                              DateTime
                                                                  parsedDate =
                                                                  DateFormat(
                                                                          'MMM d, y')
                                                                      .parse(obj
                                                                          .currentDateController
                                                                          .text
                                                                          .toString());

                                                              String
                                                                  curentdate =
                                                                  DateFormat(
                                                                          'dd-MM-yyyy')
                                                                      .format(
                                                                          parsedDate);

                                                              DateTime
                                                                  parsedDate1 =
                                                                  DateFormat(
                                                                          'MMM d, y')
                                                                      .parse(obj
                                                                          .dueDateController
                                                                          .text
                                                                          .toString());
                                                              String duedate =
                                                                  DateFormat(
                                                                          'dd-MM-yyyy')
                                                                      .format(
                                                                          parsedDate1);

                                                              num amoubt = double
                                                                  .parse(obj
                                                                      .balanceController
                                                                      .text);
                                                              bool cashs;
                                                              if (paymentMethod ==
                                                                  "Cash") {
                                                                cashs = true;
                                                              } else {
                                                                cashs = false;
                                                              }

                                                              formatTime =
                                                                  "${_selectedTime.hour}:${_selectedTime.minute} ${_selectedTime.period.name.toUpperCase()}";
                                                              String? note;
                                                              if (obj
                                                                  .noteController
                                                                  .text
                                                                  .isEmpty) {
                                                                setState(() {
                                                                  note =
                                                                      "empty";
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  note = obj
                                                                      .noteController
                                                                      .text;
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
                                                                "",
                                                              );
                                                              TransactionController
                                                                  .to
                                                                  .fetchDebtsCredits();
                                                              Navigator.pop(
                                                                  context);
                                                            } else {
                                                              Fluttertoast.showToast(
                                                                  msg:
                                                                      "give all fields",
                                                                  backgroundColor:
                                                                      darkblue!,
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                  gravity:
                                                                      ToastGravity
                                                                          .BOTTOM,
                                                                  fontSize: 17,
                                                                  timeInSecForIosWeb:
                                                                      1,
                                                                  toastLength: Toast
                                                                      .LENGTH_LONG);
                                                            }
                                                          },
                                                          child: Container(
                                                            height:
                                                                height * 0.05,
                                                            width: width * 0.25,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    darkblue!,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3)),
                                                            child: Center(
                                                              child: Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .add,
                                                                style: GoogleFonts.poppins(
                                              color:Colors.white,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500), 
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                )
                                              : Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                          obj.clearfield();
                                                        },
                                                        child: Container(
                                                          height: height * 0.05,
                                                          width: width * 0.25,
                                                          decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3)),
                                                          child: Center(
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .cancel,
                                                              style: GoogleFonts.poppins(
                                              color:Colors.white,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500), 
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          if (_formKey
                                                                  .currentState!
                                                                  .validate() &&
                                                              paymentMethod !=
                                                                  null) {
                                                            bool cash;
                                                            if (paymentMethod ==
                                                                "Cash") {
                                                              cash = true;
                                                            } else {
                                                              cash = false;
                                                            }

                                                            DateTime
                                                                parsedDate =
                                                                DateFormat(
                                                                        'MMM d, y')
                                                                    .parse(obj
                                                                        .currentDateController
                                                                        .text
                                                                        .toString());

                                                            String curentdate =
                                                                DateFormat(
                                                                        'dd-MM-yyyy')
                                                                    .format(
                                                                        parsedDate);

                                                            DateTime
                                                                parsedDate1 =
                                                                DateFormat(
                                                                        'MMM d, y')
                                                                    .parse(obj
                                                                        .dueDateController
                                                                        .text
                                                                        .toString());
                                                            String duedate = DateFormat(
                                                                    'dd-MM-yyyy')
                                                                .format(
                                                                    parsedDate1);

                                                            num amoubt =
                                                                double.parse(obj
                                                                    .balanceController
                                                                    .text);
                                                            bool cashs;
                                                            if (paymentMethod ==
                                                                "Cash") {
                                                              cashs = true;
                                                            } else {
                                                              cashs = false;
                                                            }

                                                            formatTime =
                                                                "${_selectedTime.hour}:${_selectedTime.minute} ${_selectedTime.period.name.toUpperCase()}";

                                                            String? note;
                                                            if (obj
                                                                .noteController
                                                                .text
                                                                .isEmpty) {
                                                              setState(() {
                                                                note = "empty";
                                                              });
                                                            } else {
                                                              setState(() {
                                                                note = obj
                                                                    .noteController
                                                                    .text;
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
                                                              "",
                                                            );
                                                            TransactionController
                                                                .to
                                                                .fetchDebtsCredits();

                                                            Navigator.pop(
                                                                context);
                                                          } else {
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    "give all fields",
                                                                backgroundColor:
                                                                    darkblue!,
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                gravity:
                                                                    ToastGravity
                                                                        .BOTTOM,
                                                                fontSize: 17,
                                                                timeInSecForIosWeb:
                                                                    1,
                                                                toastLength: Toast
                                                                    .LENGTH_LONG);
                                                          }
                                                        },
                                                        child: Container(
                                                          height: height * 0.05,
                                                          width: width * 0.25,
                                                          decoration: BoxDecoration(
                                                              color: blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          3)),
                                                          child: Center(
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .add,
                                                              style: GoogleFonts.poppins(
                                              color:Colors.white,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500), 
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          keyboard
                                              ? SizedBox(
                                                  height: height * 0.5,
                                                )
                                              : SizedBox()
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              AddDebitController.to.isLoading == true
                                  ? Center(
                                      child: Container(
                                        height: height,
                                        width: width,
                                        color: darkblue!.withOpacity(0.2),
                                        child: Center(
                                          child: SpinKit.loadSpinkit,
                                        ),
                                      ),
                                    )
                                  : SizedBox()
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
