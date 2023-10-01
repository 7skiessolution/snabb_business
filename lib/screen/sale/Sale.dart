import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/saleController.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/utils/color.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({
    super.key,
  });

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  @override
  void initState() {
    Get.put(TransactionController());
    Get.put(HomeController());
    Get.put(SaleController());
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String? selectedimage;

  String? maingetimage;
  bool isLoading = false;
  var height, width;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return KeyboardVisibilityBuilder(builder: (context, visible) {
      return GetBuilder<SaleController>(builder: (obj) {
        return Form(
          key: _formKey,
          child: WillPopScope(
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
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.grey[100],
              body: SafeArea(
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Card(
                          elevation: 10,
                          child: SizedBox(
                              height: height * 0.06,
                              width: width * 0.9,
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
                                        child:
                                            const Icon(Icons.arrow_back_ios)),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: height,
                                        width: width,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "New Sale",
                                          style: GoogleFonts.poppins(
                                              color: Colors.blue[900],
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.08),
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
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 20, right: 20),
                                child: Text(
                                  "New Entry",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.13),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.blue[900],
                          child: SizedBox(
                            height: height * 0.81,
                            width: width * 0.95,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      const CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(
                                            // widget
                                            //           .type ==
                                            //       1
                                            //   ?
                                            "images/sale.png"
                                            // : widget.type == 0
                                            //     ? "images/sale.png"
                                            //     : "images/expensive.png"
                                            ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Sale",
                                          style: GoogleFonts.poppins(
                                              // color:Colors.blue[900],
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  InkWell(
                                    onTap: () => obj.selectDate(context),
                                    child: SizedBox(
                                      height: height * 0.06,
                                      width: width * 0.9,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              color: Colors.grey.shade700,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              obj.formatTime,
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.035,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: width * 0.55,
                                            ),
                                          ]),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      obj.showPaidDilogue(
                                          context, height, width);
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.9,
                                      color: const Color(0xfff3f2f2),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              "images/paidas.png",
                                              width: width * 0.07,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              'Paid As',
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.035,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              width: width * 0.5,
                                            ),
                                            const Icon(
                                                Icons.arrow_drop_down_sharp)
                                          ]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      obj.showSaleMethodDilogue(
                                          context, height, width);
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.9,
                                      color: const Color(0xfff3f2f2),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              "images/paidas.png",
                                              width: width * 0.07,
                                            ),
                                            SizedBox(
                                              width: width * 0.05,
                                            ),
                                            Text(
                                              'Sale Method',
                                              style: GoogleFonts.poppins(
                                                  // color:Colors.blue[900],
                                                  fontSize: width * 0.035,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            obj.companyName == ""
                                                ? SizedBox(
                                                    width: width * 0.42,
                                                  )
                                                : SizedBox(
                                                    width: width * 0.42,
                                                    child: Center(
                                                      child: Text(
                                                        obj.companyName,
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: blue,
                                                                fontSize:
                                                                    width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ),
                                            const Icon(
                                                Icons.arrow_drop_down_sharp)
                                          ]),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.12),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.5,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                width: width,
                                                height: height,
                                                child: IgnorePointer(
                                                  child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    controller:
                                                        obj.balanceAmount,
                                                    decoration: InputDecoration(
                                                      labelText: 'Balance',
                                                      labelStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.032,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Please Enter Balance";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.attach_money_sharp,
                                              color: Colors.grey.shade700,
                                              size: width * 0.07,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.12),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.5,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                width: width,
                                                height: height,
                                                child: IgnorePointer(
                                                  child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    controller:
                                                        obj.invoiceAmount,
                                                    decoration: InputDecoration(
                                                      labelText: 'Value',
                                                      labelStyle:
                                                          GoogleFonts.poppins(
                                                              color: lightgray,
                                                              fontSize:
                                                                  width * 0.032,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "Please Enter Value";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.attach_money_sharp,
                                              color: Colors.grey.shade700,
                                              size: width * 0.07,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.025),
                                    child: SizedBox(
                                      height: height * 0.07,
                                      width: width * 0.95,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            color: Colors.grey.shade700,
                                            size: 28,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width: width,
                                              height: height,
                                              child: TextFormField(
                                                controller: obj.particular,
                                                decoration: InputDecoration(
                                                  labelText: 'Particular',
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                          color: lightgray,
                                                          fontSize:
                                                              width * 0.032,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ),
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
                                                .selectImages(context, height,
                                                    width, true);
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
                                                .selectImages(context, height,
                                                    width, false);
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Card(
                                        child: Container(
                                          width: width * 0.2,
                                          height: height * 0.05,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                              child: Text(
                                            "Cancle",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.w600),
                                          )),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            obj.postsale(context);
                                          }
                                        },
                                        child: Card(
                                          child: Container(
                                            width: width * 0.2,
                                            height: height * 0.05,
                                            decoration: BoxDecoration(
                                                color: blue,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Center(
                                                child: Text(
                                              "Save",
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: width * 0.035,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  visible
                                      ? SizedBox(
                                          height: height * 0.3,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
