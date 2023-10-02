import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/models/get_deleted_teansaction.dart' as rTra;

import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';

class RecycleScreen extends StatefulWidget {
  const RecycleScreen({super.key});

  @override
  State<RecycleScreen> createState() => _RecycleScreenState();
}

class _RecycleScreenState extends State<RecycleScreen> {
  @override
  void initState() {
    TransactionController.to.getuserDeletedTransaction();
    super.initState();
  }

  Future<void> showImageDialog(
      BuildContext context, rTra.Data obj, var height, var width) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shadowColor: blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.transactiondetails,
                          style: TextStyle(
                              color: red,
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: height * 0.06,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.name,
                                      style: TextStyle(
                                          color: red,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.name!,
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.amount,
                                      style: TextStyle(
                                          color: red,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.totalAmount.toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.cname,
                                      style: TextStyle(
                                          color: red,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.details!.category!,
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.date,
                                      style: TextStyle(
                                          color: red,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.dateTime.toString().substring(0, 9),
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                AppLocalizations.of(context)!.notes,
                                style: TextStyle(
                                    color: red,
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  obj.note!,
                                  style: TextStyle(
                                    fontSize: width * 0.03,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: obj.file != null && obj.file != ""
                                ? Hero(
                                    tag: obj.file!,
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/images/bell.png',
                                      image: StaticValues.imageUrl,
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) {
                                        return const CircularProgressIndicator();
                                      },
                                    ),
                                  )
                                : Text(
                                    AppLocalizations.of(context)!
                                        .notransactions,
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.08,
                        decoration:
                            BoxDecoration(color: blue, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.clear,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.08,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(obj.details!.imageUrl!)),
                            shape: BoxShape.circle),
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
  }

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DashBoardScreen(),
            ),
            (route) => false);
        return Future(() => true);
      },
      child: Scaffold(
        body: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Card(
                  elevation: 10,
                  child: SizedBox(
                      height: height * 0.06,
                      width: width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DashBoardScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: const Icon(Icons.arrow_back_ios)),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Expanded(
                              child: Container(
                                  height: height,
                                  width: width,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Delete Transactions",
                                    style: GoogleFonts.poppins(
                                        color: darkblue,
                                        fontSize: width * 0.032,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ],
                        ),
                      )),
                ),
                GetBuilder<TransactionController>(builder: (obj) {
                  return Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: width,
                          height: height * 0.12,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/dollar.jpg"))),
                        ),
                        Container(
                          height: height * 0.12,
                          color: blue.withOpacity(0.9),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.05,
                                right: width * 0.05,
                                top: height * 0.03),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All Transaction",
                                  style: GoogleFonts.poppins(
                                      color: white,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  TransactionController
                                      .to.deleteTransaction.length
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      color: white,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Card(
                              elevation: 10,
                              shadowColor: blue,
                              child: Container(
                                color: white,
                                height: height * 0.7,
                                width: width * 0.9,
                                child: obj.deleteTransaction.isEmpty
                                    ? Center(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .nodatafound))
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              obj.deleteTransaction.length,
                                          itemBuilder: (context, index) {
                                            rTra.Data transaction =
                                                obj.deleteTransaction[index];
                                            // return TransactionCard(transaction: transaction);

                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Dismissible(
                                                confirmDismiss:
                                                    (direction) async {
                                                  bool delete = await obj
                                                      .recoverTransactiondata(
                                                    context,
                                                    transaction.transactionId
                                                        .toString(),
                                                    transaction.type!.toInt(),
                                                  );

                                                  return delete;
                                                },
                                                key: UniqueKey(),
                                                child: InkWell(
                                                  onTap: () {
                                                    // transaction.name == "Purchase"
                                                    //     ? showPurchaseImageDialog(
                                                    //         context, transaction)
                                                    //     : transaction.name == "Sale"
                                                    //         ? showSaleImageDialog(
                                                    //             context, transaction)
                                                    //         : showExpenseImageDialog(
                                                    //             context,
                                                    //             transaction,
                                                    //           );
                                                  },
                                                  child: Container(
                                                      height: height * 0.1,
                                                      width: width,
                                                      color: backgroundColor,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: width * 0.02,
                                                          ),
                                                          Container(
                                                              height:
                                                                  height * 0.7,
                                                              width:
                                                                  width * 0.14,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                          .blue[
                                                                      900],
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        4.0),
                                                                child: transaction.details!.imageUrl == "null" ||
                                                                        transaction.details!.imageUrl ==
                                                                            null ||
                                                                        transaction
                                                                            .details!
                                                                            .imageUrl!
                                                                            .isEmpty
                                                                    ? Image
                                                                        .asset(
                                                                        "images/sale.png",
                                                                      )
                                                                    : Image
                                                                        .asset(
                                                                        transaction
                                                                            .details!
                                                                            .imageUrl!,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              )),
                                                          SizedBox(
                                                            width: width * 0.05,
                                                          ),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height:
                                                                  height * 0.7,
                                                              width:
                                                                  width * 0.01,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    transaction
                                                                        .name!,
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      fontSize:
                                                                          width *
                                                                              0.035,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    transaction.type ==
                                                                            2
                                                                        ? transaction
                                                                            .details!
                                                                            .category
                                                                            .toString()
                                                                        : transaction.type ==
                                                                                0
                                                                            ? transaction.details!.name
                                                                                .toString()
                                                                            : (transaction.details!.saleMethod == 0
                                                                                ? "Daily Sale"
                                                                                : transaction.details!.name.toString()),
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            width *
                                                                                0.03,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color:
                                                                            lightgray),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: SizedBox(
                                                              height:
                                                                  height * 0.7,
                                                              width:
                                                                  width * 0.01,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                      transaction.type ==
                                                                              1
                                                                          ? "+ ${transaction.totalAmount}"
                                                                          : "-${transaction.totalAmount}",
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        fontSize:
                                                                            width *
                                                                                0.035,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: transaction.type ==
                                                                                1
                                                                            ? Colors.green
                                                                            : Colors.red,
                                                                      )),
                                                                  Text(
                                                                    transaction
                                                                        .dateTime!
                                                                        .substring(
                                                                            0,
                                                                            10),
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            width *
                                                                                0.03,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color:
                                                                            lightgray),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width * 0.05,
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.07,
                                                            width:
                                                                width * 0.015,
                                                            color: transaction
                                                                        .type ==
                                                                    1
                                                                ? Colors.green
                                                                : Colors.red,
                                                          )
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              )),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            )),
      ),
    );
  }
}
