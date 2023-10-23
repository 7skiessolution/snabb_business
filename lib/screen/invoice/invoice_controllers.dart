import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/screen/invoice/company_model.dart';
import 'package:snabb_business/screen/invoice/items_model.dart';
import 'package:snabb_business/utils/color.dart';

class InvoiceController extends GetxController {
  static InvoiceController get to => Get.find();
  String startdate = "Select Date";
  String enddate = "Select Date";
  List<ItemsModel> itemList = [];
  TextEditingController amount = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController name = TextEditingController();
  String totalInvoceAmount = "0.0";

  TextEditingController message = TextEditingController();
  CompanyModel companyModel = CompanyModel();
  CompanyModel toCompanyModel = CompanyModel();

  saveCompanyInfo(
    CompanyModel model1,
    CompanyModel model2,
  ) {
    companyModel = model1;
    toCompanyModel = model2;
    update();
  }

  Future<void> selectDate(BuildContext context, bool start) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2400),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue!,
              colorScheme: ColorScheme.light(primary: darkblue!),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      if (start) {
        startdate = formatDate(pickedDate);
      } else {
        enddate = formatDate(pickedDate);
      }

      update();
    }
  }

  //////// DATE FORMATER
  String formatDate(DateTime date) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    return formattedDate;
  }

/////Total
  double total = 0.0;
  calculatetotal() {
    total = 0.0;
    for (var e in itemList) {
      double m = e.amount! * e.qty!;
      total = total + m;
      // total = total * e.qty!;
      update();
    }
    totalInvoceAmount = NumberFormat.decimalPattern().format(total);
  }
  /////// Dilogue

  Future<void> showItemDialog(
      BuildContext context, var height, var width) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, st) {
            return Theme(
              data: ThemeData(cardColor: Colors.white, shadowColor: darkblue!),
              child: AlertDialog(
                  elevation: 10,
                  shadowColor: Colors.white,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Item:',
                        style: GoogleFonts.poppins(
                            color: blue,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        splashColor: Colors.grey.withOpacity(0.15),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.clear,
                          size: width * 0.06,
                          color: darkblue!,
                        ),
                      ),
                    ],
                  ),
                  content: SizedBox(
                      height: height * 0.3,
                      width: width,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: itemList.length,
                              itemBuilder: (context, index) {
                                ItemsModel item = itemList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SizedBox(
                                    height: height * 0.22,
                                    child: Card(
                                      //color: bgcolor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 2,
                                      shadowColor: darkblue!,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Name :",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${item.name}",
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Qty :",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${item.qty}",
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Amount :",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${item.amount}",
                                                  style: const TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Tax :",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${item.tax}",
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    edititem(context, index,
                                                        true, width);
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: darkblue!,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    itemList.removeAt(index);

                                                    st(() {
                                                      if (itemList.isEmpty) {
                                                        calculatetotal();
                                                        Navigator.pop(context);
                                                      }
                                                    });
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Deleted Successfuly",
                                                        textColor: Colors.white,
                                                        gravity:
                                                            ToastGravity.TOP,
                                                        fontSize: 17,
                                                        timeInSecForIosWeb: 1,
                                                        toastLength:
                                                            Toast.LENGTH_SHORT);

                                                    update();
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ))),
            );
          });
        });
  }

  Future<void> edititem(
      BuildContext context, int index, bool edit, var width) async {
    if (edit) {
      amount.text = itemList[index].amount.toString();
      tax.text = itemList[index].tax.toString();
      name.text = itemList[index].name.toString();
      qty.text = itemList[index].qty.toString();
      update();
    } else {
      amount.clear();
      tax.clear();
      name.clear();
      qty.clear();
      update();
    }
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return StatefulBuilder(builder: (context, state) {
          return Theme(
            data: ThemeData.light(),
            child: AlertDialog(
              elevation: 10,
              shadowColor: Colors.white,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                edit ? 'Edit Item :' : 'Add Item :',
                style: GoogleFonts.poppins(
                    color: blue,
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.w600),
              ),
              content: SizedBox(
                height: size.height * 0.26,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: SizedBox(
                        width: size.width * 0.7,
                        child: Center(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: name,
                            autofocus: false,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 10.0, 20.0, 10.0),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.15),
                              labelText: 'Name',
                              labelStyle: GoogleFonts.poppins(
                                  //color:lightgray,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black45,
                                  width: 1.5,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: darkblue!,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'Name',
                              hintStyle: GoogleFonts.poppins(
                                  //color:lightgray,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600),
                              prefixIcon: Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.black,
                                size: size.width * 0.04,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.7,
                        child: Center(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: qty,
                            autofocus: false,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 10.0, 20.0, 10.0),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.15),
                              labelText: 'Quantity',
                              labelStyle: GoogleFonts.poppins(
                                  //color:lightgray,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black45,
                                  width: 1.5,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: darkblue!,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'Quantity',
                              hintStyle: GoogleFonts.poppins(
                                  //color:lightgray,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600),
                              prefixIcon: Icon(
                                Icons.format_list_numbered_outlined,
                                color: Colors.black,
                                size: size.width * 0.04,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.7,
                        child: Center(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: amount,
                            autofocus: false,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 10.0, 20.0, 10.0),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.15),
                              labelText: 'Amount',
                              labelStyle: GoogleFonts.poppins(
                                  //color:lightgray,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black45,
                                  width: 1.5,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: darkblue!,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'Amount',
                              hintStyle: GoogleFonts.poppins(
                                  //color:lightgray,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600),
                              prefixIcon: Icon(
                                Icons.align_vertical_bottom_rounded,
                                color: Colors.black,
                                size: size.width * 0.04,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * 0.7,
                        child: Center(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: tax,
                            autofocus: false,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 10.0, 20.0, 10.0),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey.withOpacity(0.15),
                              labelText: 'Tax',
                              labelStyle: GoogleFonts.poppins(
                                  //color:lightgray,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black45,
                                  width: 1.5,
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.red,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: darkblue!,
                                  width: 1.5,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'Tax',
                              hintStyle: GoogleFonts.poppins(
                                  //color:lightgray,
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.w600),
                              prefixIcon: Icon(
                                Icons.align_vertical_bottom_rounded,
                                color: Colors.black,
                                size: size.width * 0.04,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    if (edit) {
                      itemList[index].amount =
                          double.tryParse(amount.text) ?? 0.0;

                      itemList[index].tax = double.tryParse(tax.text) ?? 0.0;
                      itemList[index].name = name.text;
                      itemList[index].qty = int.tryParse(qty.text) ?? 1;
                      amount.clear();
                      tax.clear();
                      name.clear();
                      qty.clear();
                      update();
                      Navigator.pop(context);
                      Navigator.pop(context);
                      showItemDialog(context, size.height, size.width);
                      Fluttertoast.showToast(
                          msg: "Edited Successfuly",
                          textColor: Colors.white,
                          gravity: ToastGravity.TOP,
                          fontSize: 17,
                          timeInSecForIosWeb: 1,
                          toastLength: Toast.LENGTH_SHORT);
                    } else {
                      ItemsModel a = ItemsModel(
                          amount: double.tryParse(amount.text) ?? 0.0,
                          tax: double.tryParse(tax.text) ?? 0.0,
                          name: name.text,
                          qty: int.tryParse(qty.text) ?? 1);
                      itemList.add(a);
                      update();
                      amount.clear();
                      tax.clear();
                      name.clear();
                      qty.clear();
                      update();
                      Fluttertoast.showToast(
                          msg: "Added Successfuly",
                          textColor: Colors.white,
                          gravity: ToastGravity.TOP,
                          fontSize: 17,
                          timeInSecForIosWeb: 1,
                          toastLength: Toast.LENGTH_SHORT);
                      Navigator.pop(context);
                    }
                    calculatetotal();
                  },
                  child: Text(
                    "Save",
                    style: GoogleFonts.poppins(
                        color: blue,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.04,
                ),
                InkWell(
                  onTap: () {
                    amount.clear();
                    tax.clear();
                    name.clear();
                    qty.clear();
                    update();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(
                        color: red,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
