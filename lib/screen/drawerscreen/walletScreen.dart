import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/currency_model.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';

import '../../utils/appbarwidget.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({super.key, required this.home});
  bool home;
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  List<bool> switchValues = [];

  @override
  void initState() {
    // Initialize the switchValues list with the initial values
    switchValues =
        List.generate(HomeController.to.walletList.length, (index) => false);
    super.initState();
  }

  void toggleSwitch(int index) {
    setState(() {
      switchValues[index] = !switchValues[index];
    });
  }

  TextEditingController mName = TextEditingController();
  TextEditingController mAmount = TextEditingController();
  TextEditingController mCurrency = TextEditingController();
  TextEditingController mNotes = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  var width;

  var height;

  // var total = "546,000";
  // var waltototal = "70,000";
  var isTure = true;

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: !widget.home
            ? FloatingActionButton(
                backgroundColor: red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: white,
                        title: const Text(
                          'Create New Wallet',
                        ),
                        content: GetBuilder<HomeController>(builder: (obj) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: mName,
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(),
                                      labelText: 'Full Name'),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextField(
                                        controller: mAmount,
                                        decoration: const InputDecoration(
                                          labelText: 'Amount',
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    Expanded(
                                      child: DropdownButton<CurrencyModell>(
                                        isExpanded: true,
                                        padding: const EdgeInsets.only(
                                            left: 0, right: 0),
                                        hint: const Text("Currency"),
                                        value: obj.selectedcurrency,
                                        items: CurrencyModell.currencyList
                                            .map((CurrencyModell value) {
                                          return DropdownMenuItem<
                                              CurrencyModell>(
                                            value: value,
                                            child: Text(value.value!),
                                          );
                                        }).toList(),
                                        onChanged: (v) {
                                          setState(() {
                                            obj.changeCurrency(v!);
                                          });
                                          print(
                                              "curency ${obj.selectedcurrency}");
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                TextField(
                                  controller: mNotes,
                                  decoration: const InputDecoration(
                                    labelText: 'Notes',
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                obj.isLoadData == false
                                    ? InkWell(
                                        onTap: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            Map<String, dynamic> map = {
                                              "name": mName.text,
                                              "amount":
                                                  double.parse(mAmount.text),
                                              "currency": HomeController
                                                  .to.selectedcurrency!.value!,
                                              "note": mNotes.text,
                                              "transferred": true
                                            };

                                            HomeController.to
                                                .adddWalletdata(map, context)
                                                .then((value) {
                                              mName.clear();
                                              mNotes.clear();
                                              mAmount.clear();
                                            });
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: darkblue),
                                          width: width,
                                          height: height * 0.05,
                                          child: Center(
                                            child: Text(
                                              "Add",
                                              style: TextStyle(color: white),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "cancel",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        actions: [],
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                  color: white,
                ),
              )
            : SizedBox(),
        backgroundColor: backgroundColor,
        body: GetBuilder<HomeController>(builder: (obj) {
          return Scaffold(
            body: SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    !widget.home ? AppBarWidgt(text: "Wallet") : SizedBox(),
                    SizedBox(
                        height: height * 0.85,
                        width: width,
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
                              color: AppColors.topcard.withOpacity(0.9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Total : ${obj.totalbalance.toString()} Rs",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.04),
                                      ),
                                    ]),
                              ),
                            ),
                            Positioned(
                                top: height * 0.12,
                                right: width * 0.1,
                                left: width * 0.1,
                                child: Card(
                                  elevation: 10,
                                  shadowColor: AppColors.blue,
                                  child: Container(
                                      height: height * 0.8,
                                      width: width * 0.7,
                                      color: Colors.white,
                                      // margin: const EdgeInsets.symmetric(horizontal: 20),
                                      // padding: const EdgeInsets.symmetric(vertical: 0),
                                      child: ListView.builder(
                                          itemCount: obj.walletList.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  // left: width * 0.02,
                                                  // right: width * 0.02,
                                                  bottom: height * 0.02),
                                              child: Card(
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                shadowColor: AppColors.blue,
                                                child: Container(
                                                  height: height * 0.12,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whitecolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: width * 0.02,
                                                      top: height * 0.02,
                                                      right: width * 0.02,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Wallet :",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          width *
                                                                              0.025),
                                                                ),
                                                                Text(
                                                                  " ${obj.walletList[index].name} ",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          width *
                                                                              0.025),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.03,
                                                            ),
                                                            Text(
                                                              "${obj.walletList[index].amount.toString()}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      width *
                                                                          0.03),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Normal",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          width *
                                                                              0.025),
                                                                ),
                                                                Transform.scale(
                                                                    scale: 0.65,
                                                                    child:
                                                                        Switch(
                                                                      onChanged:
                                                                          (val) {
                                                                        toggleSwitch(
                                                                            index);
                                                                        setState(
                                                                            () {
                                                                          switchValues
                                                                              .add(val);
                                                                        });
                                                                      },
                                                                      value:
                                                                          isTure,
                                                                      activeColor:
                                                                          Colors
                                                                              .grey,
                                                                      activeTrackColor: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.4),
                                                                      inactiveThumbColor:
                                                                          Colors
                                                                              .grey,
                                                                      inactiveTrackColor: Colors
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.4),
                                                                    )),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.22,
                                                            ),
                                                            Container(
                                                              height: 50,
                                                              width:
                                                                  width * 0.25,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  // InkWell(
                                                                  //   onTap: () {},
                                                                  //   child: Container(
                                                                  //     color: Colors.grey
                                                                  //         .withOpacity(
                                                                  //             0.4),
                                                                  //     width: 18,
                                                                  //     height: 18,
                                                                  //     child: const Icon(
                                                                  //       Icons.transform,
                                                                  //       size: 15,
                                                                  //     ),
                                                                  //   ),
                                                                  // ),

                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.15,
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return AlertDialog(
                                                                            shadowColor:
                                                                                //  brightness.brightness == AppBrightness.light
                                                                                //     ? AppTheme.colorPrimary
                                                                                //     :
                                                                                Color(0xFF000000),
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                            elevation:
                                                                                2,
                                                                            title:
                                                                                Center(
                                                                              child: Text(
                                                                                "Transaction Details",
                                                                                style: TextStyle(
                                                                                    color:
                                                                                        //  brightness.brightness == AppBrightness.light
                                                                                        //     ? AppTheme.colorPrimary
                                                                                        //:
                                                                                        AppColors.blue,
                                                                                    fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ),
                                                                            content:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      "Amount:",
                                                                                      style: TextStyle(
                                                                                          fontSize: MediaQuery.of(context).size.width * 0.035,
                                                                                          color:
                                                                                              // brightness.brightness == AppBrightness.light
                                                                                              //     ? AppTheme.colorPrimary
                                                                                              //     :
                                                                                              Colors.black),
                                                                                    ),
                                                                                    Text(
                                                                                      '${obj.walletList[index].amount}',
                                                                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      "Currency:",
                                                                                      style: TextStyle(
                                                                                          fontSize: MediaQuery.of(context).size.width * 0.035,
                                                                                          color:
                                                                                              //  brightness.brightness == AppBrightness.light
                                                                                              //     ? AppTheme.colorPrimary
                                                                                              //     :
                                                                                              Colors.black),
                                                                                    ),
                                                                                    Text(
                                                                                      obj.walletList[index].currency!,
                                                                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Note: ',
                                                                                      style: TextStyle(
                                                                                          color:
                                                                                              //  brightness.brightness == AppBrightness.light
                                                                                              //     ? AppTheme.colorPrimary
                                                                                              //     :
                                                                                              Colors.black,
                                                                                          fontSize: MediaQuery.of(context).size.width * 0.035),
                                                                                    ),
                                                                                    Text(
                                                                                      obj.walletList[index].note!,
                                                                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text(
                                                                                  "Close",
                                                                                  style: TextStyle(
                                                                                    fontSize: MediaQuery.of(context).size.width * 0.035,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    color: Colors.red,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      // color: Colors.grey
                                                                      //     .withOpacity(
                                                                      //         0.4),
                                                                      width: 18,
                                                                      height:
                                                                          18,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .remove_red_eye,
                                                                        size: width *
                                                                            0.04,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  // SizedBox(
                                                                  //   width: width * 0.02,
                                                                  // ),
                                                                  obj.walletList[index].name !=
                                                                          "SnabbWallet"
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  // return
                                                                                  // Consumer<BrightnessProvider>(builder: (context,
                                                                                  //     value,
                                                                                  //     v) {
                                                                                  return AlertDialog(
                                                                                    title: const Text(
                                                                                      'Confirm Delete',
                                                                                      style: TextStyle(
                                                                                        color:
                                                                                            // value.brightness == AppBrightness.dark ? Colors.white :
                                                                                            Colors.black,
                                                                                      ),
                                                                                    ),
                                                                                    content: const Text(
                                                                                      'Are you sure you want to Delete?',
                                                                                      style: TextStyle(
                                                                                        color:
                                                                                            // value.brightness == AppBrightness.dark ? Colors.white :
                                                                                            Colors.black,
                                                                                      ),
                                                                                    ),
                                                                                    actions: <Widget>[
                                                                                      TextButton(
                                                                                        onPressed: () {
                                                                                          // Close the dialog when Cancel is pressed
                                                                                          Navigator.of(context).pop();
                                                                                        },
                                                                                        child: Text(
                                                                                          'Cancel',
                                                                                          style: TextStyle(
                                                                                            color:
                                                                                                // value.brightness ==
                                                                                                //         AppBrightness.dark
                                                                                                //     ? Colors.white
                                                                                                //:
                                                                                                AppColors.blue,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      ElevatedButton(
                                                                                        style: ButtonStyle(
                                                                                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 17, 41, 73)), // Set the custom color here
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          HomeController.to.deleteWalletdata(obj.walletList[index].walletId.toString(), context).then((value) {
                                                                                            Navigator.of(context).pop();
                                                                                          });
                                                                                        },
                                                                                        child: const Text(
                                                                                          'Delete',
                                                                                          style: TextStyle(
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                });
                                                                          },
                                                                          child:
                                                                              const Icon(Icons.delete_forever))
                                                                      : const SizedBox()
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })),
                                )

                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       left: width * 0.02, right: width * 0.02),
                                //   child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.center,
                                //         children: [
                                //           Text(
                                //             "Wallet : ",
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold,
                                //                 fontSize: width * 0.04),
                                //           ),
                                //           SizedBox(
                                //             width: width * 0.03,
                                //           ),
                                //           Text(
                                //             "0",
                                //             style: TextStyle(
                                //                 color: Colors.green,
                                //                 fontSize: width * 0.04),
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         children: [
                                //           Row(
                                //             children: [
                                //               Text(
                                //                 "Normal",
                                //                 style: TextStyle(
                                //                     fontSize: width * 0.03),
                                //               ),
                                //               Transform.scale(
                                //                   scale: 0.5,
                                //                   child: Switch(
                                //                     onChanged: (val) {
                                //                       isTure = val;
                                //                       setState(() {});
                                //                     },
                                //                     value: isTure,
                                //                     activeColor: Colors.grey,
                                //                     activeTrackColor: Colors.grey
                                //                         .withOpacity(0.4),
                                //                     inactiveThumbColor: Colors.grey,
                                //                     inactiveTrackColor: Colors.grey
                                //                         .withOpacity(0.4),
                                //                   )),
                                //             ],
                                //           ),
                                //           SizedBox(
                                //             width: width * 0.22,
                                //           ),
                                //           Container(
                                //             height: 50,
                                //             width: width * 0.25,
                                //             child: Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.spaceAround,
                                //               children: [
                                //                 InkWell(
                                //                   onTap: () {},
                                //                   child: Container(
                                //                     color: Colors.grey
                                //                         .withOpacity(0.4),
                                //                     width: 18,
                                //                     height: 18,
                                //                     child: const Icon(
                                //                       Icons.transform,
                                //                       size: 15,
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: width * 0.02,
                                //                 ),
                                //                 InkWell(
                                //                   onTap: () {},
                                //                   child: Container(
                                //                     color: Colors.grey
                                //                         .withOpacity(0.4),
                                //                     width: 18,
                                //                     height: 18,
                                //                     child: const Icon(
                                //                       Icons.remove_red_eye,
                                //                       size: 15,
                                //                     ),
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: width * 0.02,
                                //                 ),
                                //                 InkWell(
                                //                   onTap: () {},
                                //                   child: Container(
                                //                     color: Colors.grey
                                //                         .withOpacity(0.4),
                                //                     width: 18,
                                //                     height: 18,
                                //                     child: const Icon(
                                //                       Icons.more_vert,
                                //                       size: 15,
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           )
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // )),

                                ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
    // }

    //  Card accountCard(wal.Data account, int index, bool a) {
    //   return Card(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //     elevation: 2,
    //     shadowColor:AppColors.blue,
    //     child: Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               account.name!,
    //               style:
    //                   const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //             ),
    //             Row(
    //               children: [
    //                 IconButton(
    //                     onPressed: () {
    //                       //showTransactionDetails(account, currency.toString());
    //                     },
    //                     icon: const Icon(Icons.visibility)),
    //                 account.name != "SnabbWallet"
    //                     ? IconButton(
    //                         onPressed: () {},
    //                         icon: InkWell(
    //                             onTap: () {
    //                               showDialog(
    //                                 context: context,
    //                                 builder: (BuildContext context) {
    //                                   // return Consumer<BrightnessProvider>(
    //                                   //     builder: (context, value, v) {
    //                                     return AlertDialog(
    //                                       title: Text(
    //                                         'Confirm Delete',
    //                                         style: TextStyle(
    //                                           color:
    //                                           // value.brightness ==
    //                                           //         AppBrightness.dark
    //                                           //     ? Colors.white
    //                                           //     :
    //                                                Colors.black,
    //                                         ),
    //                                       ),
    //                                       content: Text(
    //                                         'Are you sure you want to Delete?',
    //                                         style: TextStyle(
    //                                           color:
    //                                           // value.brightness ==
    //                                           //         AppBrightness.dark
    //                                           //     ? Colors.white
    //                                               //:
    //                                                Colors.black,
    //                                         ),
    //                                       ),
    //                                       actions: <Widget>[
    //                                         TextButton(
    //                                           onPressed: () {
    //                                             // Close the dialog when Cancel is pressed
    //                                             Navigator.of(context).pop();
    //                                           },
    //                                           child: Text(
    //                                             'Cancel',
    //                                             style: TextStyle(
    //                                               color:
    //                                               // value.brightness
    //                                               //     ? Colors.white
    //                                                   //:
    //                                                    AppColors.blue,
    //                                             ),
    //                                           ),
    //                                         ),
    //                                         ElevatedButton(
    //                                           style: ButtonStyle(
    //                                             backgroundColor:
    //                                                 MaterialStateProperty.all<
    //                                                     Color>(const Color
    //                                                         .fromARGB(255, 17, 41,
    //                                                     73)), // Set the custom color here
    //                                           ),
    //                                           onPressed: () async {
    //                                             WalletController.to
    //                                                 .deleteWalletdata(
    //                                                     account.walletId
    //                                                         .toString(),
    //                                                     context);
    //                                           },
    //                                           child: const Text(
    //                                             'Delete',
    //                                             style: TextStyle(
    //                                               color: Colors.white,
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     );
    //                                   });
    //                                 },

    //                             child: const Icon(Icons.delete_forever)))
    //                   //
    //             : const SizedBox(),  ]
    //             ),
    //           ],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               "balance:",
    //               style: const TextStyle(
    //                   fontSize: 14,
    //                   color: Colors.grey,
    //                   fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               " ${account.amount} ",
    //               style: const TextStyle(
    //                   color: Colors.green,
    //                   fontSize: 16,
    //                   fontWeight: FontWeight.bold),
    //             )
    //           ],
    //         ),
    //         if (account.transferred!)
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               const Icon(Icons.flag_circle),
    //               Text(
    //                "Transfer",
    //                 style: const TextStyle(
    //                     color: Colors.red,
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //             ],
    //           ),
    //       ],
    //     ),
    //   );
  }
  // //
  // void showTransactionDetails(
  //   wal.Data transaction,
  //   String currency,
  // ) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => TransactionDetailsDialog(
  //       transaction: transaction,
  //       currency: currency,
  //     ),
  //   );
  // }}
  // class TransactionDetailsDialog extends StatelessWidget {
  // final wal.Data transaction;
  // String currency;

  // TransactionDetailsDialog(
  //     {super.key, required this.transaction, required this.currency});

  // @override
  // Widget build(BuildContext context) {
  //   return
  // }
}
