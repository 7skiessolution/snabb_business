import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/pdf/pdfs/pdfpreview.dart';
import 'package:snabb_business/screen/invoice/invoice_controllers.dart';
import 'package:snabb_business/screen/invoice/incoce_company_info.dart';
import 'package:snabb_business/screen/invoice/invoice_model.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:velocity_x/velocity_x.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  var height, width;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController noteController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  TextEditingController invoicenumberController = TextEditingController();
  @override
  void initState() {
    Get.put(InvoiceController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Theme(
      data: ThemeData.light(),
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Scaffold(
              body: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: AppBarWidgt(text: "Invoice")),
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
                              top: height * 0.03, left: width * 0.1, right: 20),
                          child: Text(
                            "Invoice",
                            style: GoogleFonts.poppins(
                                color: white,
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
                padding: EdgeInsets.only(top: height * 0.17),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    shadowColor: blue,
                    elevation: 10,
                    child: GetBuilder<InvoiceController>(builder: (obj) {
                      return Container(
                        color: Colors.grey.shade200,
                        height: height * 0.75,
                        width: width * 0.9,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: width * 0.925,
                                    height: height * 0.04,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Invoice Number",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            //color:lightgray,
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: SizedBox(
                                      child: TextFormField(
                                        controller: invoicenumberController,
                                        maxLines: 1,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.done,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                              color: Colors.red),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                          fillColor:
                                              Colors.black.withOpacity(0.2),
                                          hintText: "invoice number",
                                          hintStyle: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w500),
                                          alignLabelWithHint: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Invoice Number";
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: height * 0.095,
                                  child: InkWell(
                                    onTap: () {},
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const InvoicCompanyINfo(),
                                            ));
                                      },
                                      child: ListTile(
                                          title: Text(
                                            "Company Detail",
                                            style: GoogleFonts.poppins(
                                                //color:lightgray,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          subtitle: Text(
                                            "Number, Discount, Tax, Tax Rate, ....",
                                            style: GoogleFonts.poppins(
                                                //color:lightgray,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          trailing: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: width * 0.04,
                                          )),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: height * 0.25,
                                  child: Column(
                                    children: [
                                      Center(
                                        child: SizedBox(
                                          width: width * 0.9,
                                          child: const Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(
                                            "Invoice Date",
                                            style: GoogleFonts.poppins(
                                                //color:lightgray,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          trailing: InkWell(
                                            splashColor: darkblue!,
                                            onTap: () {
                                              obj.selectDate(context, true);
                                            },
                                            child: Text(
                                              obj.startdate,
                                              style: GoogleFonts.poppins(
                                                  color: lightgray,
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                      Center(
                                        child: SizedBox(
                                          width: width * 0.9,
                                          child: const Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(
                                            "Due Date",
                                            style: GoogleFonts.poppins(
                                                //color:lightgray,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          trailing: InkWell(
                                            splashColor: darkblue!,
                                            onTap: () {
                                              obj.selectDate(context, false);
                                            },
                                            child: Text(
                                              obj.enddate,
                                              style: GoogleFonts.poppins(
                                                  color: lightgray,
                                                  fontSize: width * 0.03,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    width: width * 0.925,
                                    height: height * 0.04,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Products",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            //color:lightgray,
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  height: height * 0.2,
                                  child: Column(
                                    children: [
                                      ListTile(
                                          title: Text(
                                            "Add Items",
                                            style: GoogleFonts.poppins(
                                                color: darkblue,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          leading: InkWell(
                                            onTap: () {
                                              obj.edititem(
                                                  context, 0, false, width);
                                            },
                                            child: Container(
                                              width: width * 0.06,
                                              height: height * 0.03,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: darkblue!)),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color: darkblue!,
                                                  size: width * 0.05,
                                                ),
                                              ),
                                            ),
                                          ),
                                          trailing: InkWell(
                                            onTap: () {
                                              if (obj.itemList.isNotEmpty) {
                                                obj.showItemDialog(
                                                    context, height, width);
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: "No Item Found !",
                                                    textColor: Colors.white,
                                                    gravity: ToastGravity.TOP,
                                                    fontSize: 17,
                                                    timeInSecForIosWeb: 1,
                                                    toastLength:
                                                        Toast.LENGTH_SHORT);
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: darkblue!,
                                              size: width * 0.05,
                                            ),
                                          )),
                                      Center(
                                        child: SizedBox(
                                          width: width * 0.9,
                                          child: const Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        title: Text(
                                          "Total Amount",
                                          style: GoogleFonts.poppins(
                                              //   co//lor:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        trailing: Text(
                                          obj.totalInvoceAmount,
                                          style: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Center(
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: SizedBox(
                                      child: TextFormField(
                                        controller: noteController,
                                        maxLines: 4,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                              color: Colors.red),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                          fillColor:
                                              Colors.black.withOpacity(0.2),
                                          hintText: "Note",
                                          hintStyle: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600),
                                          alignLabelWithHint: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Center(
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: SizedBox(
                                      child: TextFormField(
                                        controller: msgController,
                                        maxLines: 4,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                              color: Colors.red),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                          fillColor:
                                              Colors.black.withOpacity(0.2),
                                          hintText: "Message",
                                          hintStyle: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600),
                                          alignLabelWithHint: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      if (InvoiceController.to.toCompanyModel
                                          .address.isNotEmptyAndNotNull) {
                                        InvoiceModel model = InvoiceModel(
                                            dueDate: obj.enddate,
                                            invoidDate: obj.startdate,
                                            invoiceNumber:
                                                invoicenumberController.text,
                                            note: noteController.text,
                                            terms: msgController.text,
                                            productList: obj.itemList,
                                            companyModel: InvoiceController
                                                .to.companyModel,
                                            tocompanyModel: InvoiceController
                                                .to.toCompanyModel);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PDFPreview(model: model),
                                            ));
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Company Detail Is Required !",
                                            textColor: Colors.white,
                                            gravity: ToastGravity.BOTTOM,
                                            fontSize: 17,
                                            backgroundColor: Colors.red,
                                            timeInSecForIosWeb: 1,
                                            toastLength: Toast.LENGTH_SHORT);
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: height * 0.06,
                                    width: width * 0.4,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      "Print",
                                      style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
