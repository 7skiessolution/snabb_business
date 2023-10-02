import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/models/daily_transaction_model.dart' as dTra;

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/pinch_zoom_image.dart';

class DailyTransactions extends StatefulWidget {
  const DailyTransactions({super.key});

  @override
  State<DailyTransactions> createState() => _DailyTransactionsState();
}

class _DailyTransactionsState extends State<DailyTransactions> {
  var height, width;
  int check = 0;
  num balance = 0.0;

  Future<void> showSaleImageDialog(
    BuildContext context,
    dTra.Transactions obj,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return AlertDialog(
          elevation: 10,
          shadowColor: greencolor,
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
                          "Sale Transaction Details",
                          style: TextStyle(
                              color: greencolor,
                              fontSize: width * 0.025,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      obj.details!.name == "null" ||
                              obj.details!.name == null ||
                              obj.details!.name!.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              height: height * 0.05,
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Name: ",
                                            style: TextStyle(
                                                fontSize: width * 0.025,
                                                color: greencolor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(obj.details!.name!,
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Number: ",
                                            style: TextStyle(
                                                color: greencolor,
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            obj.details!.telePhone.toString(),
                                            style: TextStyle(
                                              fontSize: width * 0.025,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      obj.details!.name == "null" ||
                              obj.details!.name == null ||
                              obj.details!.name!.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              height: height * 0.05,
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Email: ",
                                            style: TextStyle(
                                                fontSize: width * 0.025,
                                                color: greencolor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(obj.details!.email!,
                                              style: TextStyle(
                                                fontSize: width * 0.025,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      obj.details!.payBackDay == null ||
                              obj.details!.payBackDay == "null"
                          ? const SizedBox()
                          : SizedBox(
                              height: height * 0.05,
                              width: width * 0.9,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Text(
                                            "PayBack: ",
                                            style: TextStyle(
                                                color: greencolor,
                                                fontSize: width * 0.025,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            obj.details!.payBackDay
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                              fontSize: width * 0.025,
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
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.totalAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Date: ",
                                      style: TextStyle(
                                          color: greencolor,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.dateTime.toString().substring(0, 10),
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Partial: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.details!.partialAmount!.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Balance: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        obj.details!.remainingAmount!
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Bank: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.bankAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Cash: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: greencolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.cashAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Other: ",
                                      style: TextStyle(
                                          color: greencolor,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.otherAmount.toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                        height: height * 0.1,
                        width: width * 0.9,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Note: ",
                                style: TextStyle(
                                    fontSize: width * 0.025,
                                    color: greencolor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  obj.note ?? "No Note Available",
                                  style: TextStyle(
                                    fontSize: width * 0.025,
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
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            elevation: 10,
                                            shadowColor: Colors.blue[900],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.7,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                      height: height,
                                                      width: width,
                                                      child: PinchZoomImage(
                                                        image:
                                                            '${StaticValues.imageUrl}${obj.file!}',
                                                      )
                                                      // decoration: BoxDecoration(
                                                      //     image: DecorationImage(
                                                      //         image: NetworkImage(
                                                      //             "${StaticValues.imageUrl}${data.file!}"))),
                                                      ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            bottom: 8.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      Colors.blue[
                                                                          900],
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.clear,
                                                              size: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/images/bell.png',
                                      image:
                                          '${StaticValues.imageUrl}${obj.file}',
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) {
                                        return const CircularProgressIndicator();
                                      },
                                    ),
                                  )
                                : Text(
                                    "No File Available",
                                    style: TextStyle(
                                      fontSize: width * 0.025,
                                    ),
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
                        decoration: BoxDecoration(
                            color: greencolor, shape: BoxShape.circle),
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/sale.png")),
                              shape: BoxShape.circle)),
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

  Future<void> showPurchaseImageDialog(
      BuildContext context, dTra.Transactions obj) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shadowColor: darkblue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                            child: Text(
                          "Purchase Transaction Details",
                          style: TextStyle(
                              color: darkblue,
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: height * 0.05,
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
                                      "Name: ",
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.details!.name!}",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                                      "Number: ",
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.details!.telePhone!.toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Email: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: darkblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.details!.email!,
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      'payBackDate:'.capitalize!,
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " ${obj.details!.payBackDay == null ? "------" : obj.details!.payBackDay.toString().substring(0, 10)}",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: height,
                                width: width,
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .date
                                          .capitalize!,
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.dateTime.toString().substring(0, 10)}",
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                                      AppLocalizations.of(context)!
                                          .amount
                                          .capitalize!,
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.totalAmount.toString()}",
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
                                      'Reg#:'.capitalize!,
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      ": ${obj.details!.companyReg!}",
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
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Bank: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: darkblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.bankAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Cash: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: darkblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.cashAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Other: ",
                                      style: TextStyle(
                                          color: darkblue,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.otherAmount.toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                                "Note: ",
                                style: TextStyle(
                                    color: darkblue,
                                    fontSize: width * 0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  obj.note ?? "",
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
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            elevation: 10,
                                            shadowColor: Colors.blue[900],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.7,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                      height: height,
                                                      width: width,
                                                      child: PinchZoomImage(
                                                        image:
                                                            '${StaticValues.imageUrl}${obj.file!}',
                                                      )
                                                      // decoration: BoxDecoration(
                                                      //     image: DecorationImage(
                                                      //         image: NetworkImage(
                                                      //             "${StaticValues.imageUrl}${data.file!}"))),
                                                      ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            bottom: 8.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      Colors.blue[
                                                                          900],
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.clear,
                                                              size: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/images/bell.png',
                                      image:
                                          '${StaticValues.imageUrl}${obj.file}',
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) {
                                        return const CircularProgressIndicator();
                                      },
                                    ),
                                  )
                                : Text(
                                    "No File Available",
                                    style: TextStyle(
                                      fontSize: width * 0.025,
                                    ),
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
                        decoration: BoxDecoration(
                            color: darkblue, shape: BoxShape.circle),
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/sale.png")),
                              shape: BoxShape.circle)),
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

  Future<void> showExpenseImageDialog(
    BuildContext context,
    dTra.Transactions obj,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return AlertDialog(
          elevation: 10,
          shadowColor: expensecolor,
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
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                            child: Text(
                          "Expense Transaction Details",
                          style: TextStyle(
                              color: expensecolor,
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
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
                                      "Amount: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: expensecolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        "${(obj.totalAmount ?? 0.0)} ${obj.currency}",
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Category: ",
                                      style: TextStyle(
                                          color: expensecolor,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.details!.category.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Row(
                                children: [
                                  Text(
                                    "Date: ",
                                    style: TextStyle(
                                        fontSize: width * 0.025,
                                        color: expensecolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(obj.dateTime.toString().substring(0, 10),
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                        width: width * 0.9,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text(
                                      "Bank: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: expensecolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.bankAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Cash: ",
                                      style: TextStyle(
                                          fontSize: width * 0.025,
                                          color: expensecolor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(obj.cashAmount.toString(),
                                        style: TextStyle(
                                          fontSize: width * 0.025,
                                        )),
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
                                      "Other: ",
                                      style: TextStyle(
                                          color: expensecolor,
                                          fontSize: width * 0.025,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      obj.otherAmount.toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.025,
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
                                "Notes: ",
                                style: TextStyle(
                                    color: expensecolor,
                                    fontSize: width * 0.025,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Text(obj.note ?? "",
                                    style: TextStyle(
                                      fontSize: width * 0.025,
                                    )),
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
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            elevation: 10,
                                            shadowColor: Colors.blue[900],
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            content: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.7,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                      height: height,
                                                      width: width,
                                                      child: PinchZoomImage(
                                                        image:
                                                            '${StaticValues.imageUrl}${obj.file!}',
                                                      )
                                                      // decoration: BoxDecoration(
                                                      //     image: DecorationImage(
                                                      //         image: NetworkImage(
                                                      //             "${StaticValues.imageUrl}${data.file!}"))),
                                                      ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            bottom: 8.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.04,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      Colors.blue[
                                                                          900],
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.clear,
                                                              size: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/images/bell.png',
                                      image:
                                          '${StaticValues.imageUrl}${obj.file}',
                                      placeholderErrorBuilder:
                                          (context, error, stackTrace) {
                                        return const CircularProgressIndicator();
                                      },
                                    ),
                                  )
                                : Text(
                                    "No File Available",
                                    style: TextStyle(
                                      fontSize: width * 0.025,
                                    ),
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
                        decoration: BoxDecoration(
                            color: expensecolor, shape: BoxShape.circle),
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
                        decoration: obj.details!.imageUrl == "null" ||
                                obj.details!.imageUrl == null ||
                                obj.details!.imageUrl!.isEmpty
                            ? const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/bell.png")),
                                shape: BoxShape.circle)
                            : BoxDecoration(
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

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<TransactionController>(initState: (state) {
      TransactionController.to.getUserDailyTransactiondata();
    }, builder: (obj) {
      return obj.dailyTransactionList.isNotEmpty
          ? SizedBox(
              height: height,
              width: width,
              child: ListView.builder(
                itemCount: obj.dailyTransactionList.length,
                itemBuilder: (context, index) {
                  // var selectedDate = widget.dates[index];
                  List<dTra.Transactions> specificTrans = [];
                  specificTrans =
                      obj.dailyTransactionList[index].transactions!.toList();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      color: white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child:
                                    Text(obj.dailyTransactionList[index].day!),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: specificTrans.length * 80,
                              //specificTrans.length == 1?80: specificTrans.length == 2?160: specificTrans.length == 3?240: specificTrans.length == 3?320 : 400 ,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: specificTrans.length,
                                itemBuilder: (context, i) {
                                  dTra.Transactions transaction =
                                      specificTrans[i];
                                  // return TransactionCard(transaction: transaction);

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Dismissible(
                                      confirmDismiss: (direction) async {
                                        bool delete =
                                            await TransactionController.to
                                                .deleteTransactiondata(
                                                    context,
                                                    transaction.transactionId
                                                        .toString(),
                                                    transaction.type!.toInt(),
                                                    "daily");

                                        return delete;
                                      },
                                      key: UniqueKey(),
                                      child: InkWell(
                                        onTap: () {
                                          transaction.name == "Purchase"
                                              ? showPurchaseImageDialog(
                                                  context, transaction)
                                              : transaction.name == "Sale"
                                                  ? showSaleImageDialog(
                                                      context, transaction)
                                                  : showExpenseImageDialog(
                                                      context,
                                                      transaction,
                                                    );
                                        },
                                        child: Container(
                                            height: height * 0.1,
                                            width: width,
                                            color: backgroundColor,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Container(
                                                    height: height * 0.7,
                                                    width: width * 0.14,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue[900],
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: transaction
                                                                      .details!
                                                                      .imageUrl ==
                                                                  "null" ||
                                                              transaction
                                                                      .details!
                                                                      .imageUrl ==
                                                                  null ||
                                                              transaction
                                                                  .details!
                                                                  .imageUrl!
                                                                  .isEmpty
                                                          ? Image.asset(
                                                              "images/sale.png",
                                                            )
                                                          : Image.asset(
                                                              transaction
                                                                  .details!
                                                                  .imageUrl!,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                    )),
                                                SizedBox(
                                                  width: width * 0.05,
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: height * 0.7,
                                                    width: width * 0.01,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          transaction.name!,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize:
                                                                width * 0.035,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          transaction.type == 2
                                                              ? transaction
                                                                  .details!
                                                                  .category
                                                                  .toString()
                                                              : transaction
                                                                          .type ==
                                                                      0
                                                                  ? transaction
                                                                      .details!
                                                                      .name
                                                                      .toString()
                                                                  : (transaction
                                                                              .details!
                                                                              .saleMethod ==
                                                                          0
                                                                      ? "Daily Sale"
                                                                      : transaction
                                                                          .details!
                                                                          .name
                                                                          .toString()),
                                                          style: GoogleFonts
                                                              .poppins(
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
                                                    height: height * 0.7,
                                                    width: width * 0.01,
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
                                                                  width * 0.035,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: transaction
                                                                          .type ==
                                                                      1
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                            )),
                                                        Text(
                                                          transaction.dateTime!
                                                              .substring(0, 10),
                                                          style: GoogleFonts
                                                              .poppins(
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
                                                  height: height * 0.07,
                                                  width: width * 0.015,
                                                  color: transaction.type == 1
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
                            )
                          ]),
                    ),
                  );
                },
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(80.0),
              child: Center(
                  child: Text(
                AppLocalizations.of(context)!.notransaction,
              )),
            );
    });
  }
}
