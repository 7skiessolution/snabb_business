import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/budget/budget_controller.dart';
import 'package:snabb_business/controller/budget/transaction_budget.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/budget_model.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/spinkit.dart';

class BugetTransaction extends StatefulWidget {
  BudgetData data;

  BugetTransaction({super.key, required this.data});

  @override
  State<BugetTransaction> createState() => _BugetTransactionState();
}

class _BugetTransactionState extends State<BugetTransaction> {
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
              Column(
                children: [
                  Container(
                    width: width * 0.9,
                    height: height * 0.13,
                    decoration: BoxDecoration(
                      color: darkblue,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: width * 0.065,
                            )),
                        Text(
                          AppLocalizations.of(context)!.budget,
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: width * 0.045,
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        SizedBox(
                          height: height / 80,
                        ),
                        SizedBox(
                          height: height * 0.07,
                          width: width,
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: darkblue,
                                      value: "Cash",
                                      groupValue: obj.paymentMethod,
                                      onChanged: (value) {
                                        print(value);
                                        obj.paymentMethod = value;
                                        obj.update();
                                      },
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.bycash,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: darkblue,
                                      value:
                                          AppLocalizations.of(context)!.balance,
                                      groupValue: obj.paymentMethod,
                                      onChanged: (value) {
                                        print(value);
                                        obj.paymentMethod = value;
                                        obj.update();
                                      },
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.bybank,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 80,
                        ),
                        Center(
                            child: SizedBox(
                          width: width * 0.9,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      elevation: 7,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
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
                                    Container(
                                        margin:
                                            const EdgeInsets.only(right: 30),
                                        child: Text(
                                          HomeController.to.curency,
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.black87
                                                  .withOpacity(0.7)),
                                        ))

                                    //...............................................
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: width * 0.02),
                                  child: SizedBox(
                                    width: width * 0.4,
                                    child: InkWell(
                                      onTap: () => obj.selectDate(context),
                                      child: IgnorePointer(
                                        child: TextFormField(
                                          controller: TextEditingController(
                                            text: ' 7/7/2000',
                                          ),
                                          decoration: InputDecoration(
                                            labelText:
                                                AppLocalizations.of(context)!
                                                    .date,
                                            labelStyle: TextStyle(
                                                fontSize: width * 0.045,
                                                color: darkblue,
                                                fontWeight: FontWeight.w500),
                                            prefix: Icon(
                                              Icons.calendar_today,
                                              color: darkblue,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: height * 0.03,
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
                                              color: darkblue,
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
                                            color: darkblue,
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
                                )
                              ]),
                        )),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              obj.isLoading == true
                  ? Container(
                      height: height,
                      width: width,
                      color: darkblue.withOpacity(0.3),
                      child: Center(
                        child: SpinKit.loadSpinkit,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      }),
    );
  }
}
