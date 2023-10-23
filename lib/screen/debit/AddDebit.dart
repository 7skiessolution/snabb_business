import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/controller/debit-credit/add_debit_controller.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/add_debit_model.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/spinkit.dart';

class AddDebit extends StatefulWidget {
  DebitCreditData? deta;
  String? id;
  int? type;
  num? remaing;
  AddDebit({super.key, this.deta, this.remaing, this.id, this.type});

  @override
  State<AddDebit> createState() => _AddDebitState();
}

class _AddDebitState extends State<AddDebit> {
  TextEditingController valuecontrol = TextEditingController();
  TextEditingController notecontrol = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //final String userId = FirebaseAuth.instance.currentUser!.uid;
  double updatamount = 0;

  updateamount() async {
    try {
      double paidAmount = double.tryParse(widget.deta!.paidAmount.toString()) ??
          0.0; // Default to 0 if paidAmount is null
      double newValue = double.tryParse(valuecontrol.text) ??
          0.0; // Default to 0 if parsing fails

      updatamount = paidAmount + newValue;

      print('Updated Amount: $updatamount');
    } catch (e) {
      print('Error updating amount: $e');
    }
  }

  bool switchvalue = false;

  @override
  void initState() {
    Get.put(HomeController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetBuilder<AddDebitController>(builder: (obj) {
          return Form(
            key: _formKey,
            child: SizedBox(
              height: height,
              width: width,
              child: Column(
                children: [
                  AppBarWidgt(
                      text: widget.type == 0
                          ? AppLocalizations.of(context)!.paybackcredit
                          : AppLocalizations.of(context)!.paybackdebit),
                  Expanded(
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: Stack(
                        children: [
                          SizedBox(
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
                                          image:
                                              AssetImage("images/dollar.jpg"))),
                                ),
                                Container(
                                  height: height * 0.12,
                                  width: width,
                                  color: blue.withOpacity(0.9),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Card(
                              elevation: 10,
                              shadowColor: blue,
                              child: SizedBox(
                                height: height * 0.7,
                                width: width * 0.9,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: height * 0.07,
                                        width: width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                                width: width * 0.3,
                                                child: TextFormField(
                                                  style: GoogleFonts.poppins(
                                                      color: lightgray,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return AppLocalizations
                                                              .of(context)!
                                                          .enteramount;
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  controller: valuecontrol,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        GoogleFonts.poppins(
                                                            color: lightgray,
                                                            fontSize:
                                                                width * 0.03,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                    hintText:
                                                        "${widget.remaing}",
                                                  ),
                                                )),
                                            Text(
                                              HomeController.to.curency,
                                              style: GoogleFonts.poppins(
                                                  color: blue,
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!
                                                      .residualamount,
                                                  style: GoogleFonts.poppins(
                                                      color: lightgray,
                                                      fontSize: width * 0.032,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "${widget.remaing}",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: widget.type != 1
                                              ? const AssetImage(
                                                  "assets/images/paid.png")
                                              : const AssetImage(
                                                  "assets/images/notpaid.png"),
                                        ),
                                        title: widget.type == 0
                                            ? Text(
                                                AppLocalizations.of(context)!
                                                    .credit
                                                    .toUpperCase(),
                                                style: GoogleFonts.poppins(
                                                    //color:lightgray,
                                                    fontSize: width * 0.035,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            : Text(
                                                AppLocalizations.of(context)!
                                                    .debit
                                                    .toUpperCase(),
                                                style: GoogleFonts.poppins(
                                                    //color:lightgray,
                                                    fontSize: width * 0.035,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                      ),
                                      Text(
                                        "${AppLocalizations.of(context)!.total}"
                                        " ${valuecontrol.text}  ${HomeController.to.curency}",
                                        style: GoogleFonts.poppins(
                                            //color:lightgray,
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.home,
                                          size: 30,
                                        ),
                                        title: Text(
                                          AppLocalizations.of(context)!.wallet,
                                          style: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.calendar_month,
                                          size: 30,
                                        ),
                                        title: InkWell(
                                          onTap: () {
                                            // _selectDate(context, date as DateTime);
                                          },
                                          child: Text(
                                            //   widget.debt!.backDate!.substring(0, 10),
                                            widget.deta!.payBackDate!,
                                            style: GoogleFonts.poppins(
                                                //color:lightgray,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.person,
                                          size: 30,
                                        ),
                                        title: Text(
                                          widget.deta!.person.toString(),
                                          style: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      ListTile(
                                          leading: const Icon(
                                            Icons.edit,
                                            size: 30,
                                          ),
                                          title: TextFormField(
                                              controller: notecontrol,
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                if (value == null) {
                                                  return AppLocalizations.of(
                                                          context)!
                                                      .enteramount;
                                                } else {
                                                  return null;
                                                }
                                              },
                                              decoration: InputDecoration(
                                                hintText: AppLocalizations.of(
                                                        context)!
                                                    .noteoptional,
                                                hintStyle: GoogleFonts.poppins(
                                                    color: lightgray,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ))),
                                      ListTile(
                                        title: Text(
                                          AppLocalizations.of(context)!.checked,
                                          style: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Transform.scale(
                                          scale: 0.85,
                                          child: Switch(
                                            activeColor: darkblue,
                                            value: switchvalue,
                                            onChanged: (value) {
                                              setState(() {
                                                switchvalue = value;
                                              });
                                              print("value $switchvalue");
                                            },
                                          ),
                                        ),
                                      ),
                                      const Divider(),
                                      // const Row(
                                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      //   children: [
                                      //     Icon(Icons.camera_alt, color: Colors.grey, size: 30),
                                      //     Icon(
                                      //       Icons.file_copy,
                                      //       color: Colors.grey,
                                      //       size: 30,
                                      //     )
                                      //   ],
                                      // ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15,
                                                        horizontal: 40)),
                                            onPressed: () {
                                              valuecontrol.clear();
                                              notecontrol.clear();
                                              Navigator.pop(context);
                                            },
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .cancel,
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: darkblue!,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15,
                                                        horizontal: 50)),
                                            onPressed: () {
                                              if ((double.parse(
                                                      valuecontrol.text)) >
                                                  widget.remaing!) {
                                                //   print("update amount ${updatamount}");
                                                Fluttertoast.showToast(
                                                    msg: "Invalid Amount ",
                                                    backgroundColor: darkblue!,
                                                    textColor: Colors.grey);
                                              } else {
                                                updateamount();
                                                final data = {
                                                  "amount": updatamount,
                                                  "note": notecontrol.text,
                                                  "date":
                                                      widget.deta!.payBackDate,
                                                  "isCash": switchvalue,
                                                  "debitCreditId": widget.id,
                                                };
                                                obj.paydebitcredit(
                                                    data, context);
                                              }
                                            },
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .save,
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: width * 0.03,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          obj.isLoading == false
                              ? const SizedBox()
                              : Center(
                                  child: Container(
                                    height: height,
                                    width: width,
                                    color: darkblue!.withOpacity(0.2),
                                    child: Center(
                                      child: SpinKit.loadSpinkit,
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
