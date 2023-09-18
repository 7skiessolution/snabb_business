import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/controller/budget/budget_controller.dart';
import 'package:snabb_business/controller/budget/transaction_budget.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/budget_model.dart';
import 'package:snabb_business/models/payment_type_model.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/spinkit.dart';

class BugetTransaction extends StatefulWidget {
  BudgetData data;

  BugetTransaction({super.key, required this.data});

  @override
  State<BugetTransaction> createState() => _BugetTransactionState();
}

class _BugetTransactionState extends State<BugetTransaction> {
  final TextEditingController selectPaymentMethod = TextEditingController();
  @override
  void initState() {
    Get.put(TransactionBudgetController());
    Get.put(HomeController());
    Get.put(BudgetController());
    TransactionBudgetController.to.pay =
        widget.data.amount! - widget.data.paidAmount!;
    TransactionBudgetController.to.value.text =
        TransactionBudgetController.to.pay.toString();
    super.initState();
  }

  String? selectedimage;
  String? selectedname;
  int? paymentMethod;
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GetBuilder<TransactionBudgetController>(builder: (obj) {
        return Scaffold(
          body: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: AppBarWidgt(text: "Budget")),
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: SizedBox(
                  width: width,
                  height: height * 0.15,
                  child: Stack(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.15,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/dollar.jpg"))),
                      ),
                      Container(
                        width: width,
                        height: height * 0.15,
                        color: Colors.blue[900]!.withOpacity(0.9),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.2),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.blue[900],
                    child: SizedBox(
                      width: width * 0.9,
                      height: height * 0.7,
                      child: Stack(children: [
                        SizedBox(
                          height: height,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                SizedBox(
                                  width: width * 0.9,
                                  height: height * 0.07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SizedBox(
                                          width: width * 0.4,
                                          child: TextFormField(
                                            controller: obj.value,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              errorStyle: const TextStyle(
                                                  color: Colors.black),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 20),
                                              fillColor: Colors.grey,
                                              hintText:
                                                  AppLocalizations.of(context)!
                                                      .payable,
                                              alignLabelWithHint: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: darkblue!),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: darkblue!),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(right: 30),
                                          child: Text(
                                            HomeController.to.curency,
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: Colors.black87
                                                    .withOpacity(0.7)),
                                          ))

                                      //...............................................
                                    ],
                                  ),
                                ),

                                SizedBox(
                                    height: height * 0.08,
                                    width: width * 0.95,
                                    // color: AppColors.backgroundColor,
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Container(
                                                color: Colors.grey.shade300,
                                                height: height * 0.35,
                                                width: width * 0.8,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: height * 0.15,
                                                      width: width,
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                  "images/dollar.jpg"))),
                                                    ),
                                                    Container(
                                                      height: height * 0.15,
                                                      width: width,
                                                      color: Colors.blue[900]!
                                                          .withOpacity(0.9),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: height *
                                                                    0.03,
                                                                left: width *
                                                                    0.02),
                                                        child: Text(
                                                          "Select Payment ",
                                                          style: TextStyle(
                                                              color: white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: height * 0.07),
                                                      child: Center(
                                                        child: Card(
                                                          elevation: 10,
                                                          shadowColor:
                                                              Colors.blue[900],
                                                          child: Container(
                                                            height:
                                                                height * 0.3,
                                                            width: width * 0.7,
                                                            color: white,
                                                            child: Center(
                                                              child: ListView
                                                                  .builder(
                                                                      itemCount: PaymentTypeModel
                                                                          .typemodellist
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              HomeController.to.paymenttypeindex = index;
                                                                              paymentMethod = index;
                                                                              selectedimage = PaymentTypeModel.typemodellist[HomeController.to.paymenttypeindex!].image;
                                                                              selectPaymentMethod.text = PaymentTypeModel.typemodellist[HomeController.to.paymenttypeindex!].name!;
                                                                            });
                                                                            print("name $selectedname");
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                height * 0.08,
                                                                            child:
                                                                                Row(
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
                                              fontWeight: FontWeight.w700),
                                          controller: selectPaymentMethod,
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            labelText: 'Select Payment',
                                            labelStyle: const TextStyle(
                                                fontWeight: FontWeight.w700),
                                            prefixIcon: Icon(
                                              Icons.attach_money_outlined,
                                              color: Colors.grey.shade700,
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
                                SizedBox(
                                    height: height * 0.08,
                                    width: width * 0.95,
                                    // color: AppColors.backgroundColor,
                                    child: InkWell(
                                      onTap: () {
                                        obj.selectDate(context);
                                      },
                                      child: IgnorePointer(
                                        child: TextFormField(
                                          controller: obj.datecontroller,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                          decoration: InputDecoration(
                                            enabledBorder: InputBorder.none,
                                            labelText: 'Select Date',
                                            labelStyle: const TextStyle(
                                                fontWeight: FontWeight.w700),
                                            prefixIcon: Icon(
                                              Icons.calendar_today,
                                              color: Colors.grey.shade700,
                                              size: 25,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Select payment';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    )),

                                // SizedBox(
                                //   height: height * 0.07,
                                //   width: width,
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //         child: Row(
                                //           children: [
                                //             Radio(
                                //               activeColor: darkblue!,
                                //               value: "Cash",
                                //               groupValue: obj.paymentMethod,
                                //               onChanged: (value) {
                                //                 print(value);
                                //                 obj.paymentMethod = value;
                                //                 obj.update();
                                //               },
                                //             ),
                                //             Text(
                                //               AppLocalizations.of(context)!
                                //                   .bycash,
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //       Expanded(
                                //         child: Row(
                                //           children: [
                                //             Radio(
                                //               activeColor: darkblue!,
                                //               value:
                                //                   AppLocalizations.of(context)!
                                //                       .balance,
                                //               groupValue: obj.paymentMethod,
                                //               onChanged: (value) {
                                //                 print(value);
                                //                 obj.paymentMethod = value;
                                //                 obj.update();
                                //               },
                                //             ),
                                //             Text(
                                //               AppLocalizations.of(context)!
                                //                   .bybank,
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),

                                SizedBox(
                                  height: height * 0.01,
                                ),
                                //.........................................................................................................................
                                obj.index == 1
                                    ? Container(
                                        child: Column(children: [
                                          Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width * 0.85,
                                              child: TextFormField(
                                                controller: obj.fromcontroller,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.black),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: AppLocalizations.of(
                                                          context)!
                                                      .fromoptional,
                                                  alignLabelWithHint: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.015,
                                          ),
                                          Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width * 0.85,
                                              child: TextFormField(
                                                controller: obj.notescontroller,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.black),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: AppLocalizations.of(
                                                          context)!
                                                      .noteoptional,
                                                  alignLabelWithHint: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      )
                                    : Container(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Card(
                                              elevation: 7,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: SizedBox(
                                                width: width * 0.85,
                                                child: TextFormField(
                                                  controller:
                                                      obj.fromcontroller,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    errorStyle: const TextStyle(
                                                        color: Colors.black),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 0,
                                                            horizontal: 20),
                                                    fillColor: Colors.grey,
                                                    hintText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .fromoptional,
                                                    alignLabelWithHint: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: darkblue!),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: darkblue!),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Card(
                                              elevation: 7,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: SizedBox(
                                                width: width * 0.85,
                                                child: TextFormField(
                                                  controller:
                                                      obj.notescontroller,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    errorStyle: const TextStyle(
                                                        color: Colors.black),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 0,
                                                            horizontal: 20),
                                                    fillColor: Colors.grey,
                                                    hintText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .noteoptional,
                                                    alignLabelWithHint: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: darkblue!),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: darkblue!),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                SizedBox(
                                  height: height * 0.07,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          width: width * 0.35,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .cancel,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.04,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          obj.isLoading = true;
                                          obj.update();
                                          obj.updatebudget(
                                              widget.data.budgetId.toString(),
                                              context);
                                        },
                                        child: Container(
                                          height: height * 0.05,
                                          width: width * 0.35,
                                          decoration: BoxDecoration(
                                            color: darkblue!,
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Center(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .save,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.04,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                ),
                              ],
                            ),
                          ),
                        ),
                        obj.isLoading == true
                            ? Container(
                                height: height,
                                width: width,
                                color: darkblue!.withOpacity(0.3),
                                child: Center(
                                  child: SpinKit.loadSpinkit,
                                ),
                              )
                            : const SizedBox()
                      ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
