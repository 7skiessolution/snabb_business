import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:snabb_business/screen/invoice/invoice_controllers.dart';
import 'package:snabb_business/screen/invoice/incoce_company_info.dart';
import 'package:snabb_business/screen/invoice/invoice_model.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/screen/invoice/pdf/pdfpreview.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  var height, width;
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
        child: Scaffold(
            body: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: AppBarWidgt(text: "Invoice")),
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
                          "Invoice",
                          style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
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
                                      style: TextStyle(
                                          fontSize: width * 0.03,
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
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        errorStyle:
                                            const TextStyle(color: Colors.red),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                        fillColor:
                                            Colors.black.withOpacity(0.2),
                                        hintText: "invoice number",
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
                              Container(
                                color: Colors.white,
                                height: height * 0.08,
                                child: InkWell(
                                  onTap: () {},
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                InvoicCompanyINfo(),
                                          ));
                                    },
                                    child: ListTile(
                                        title: Text(
                                          "Invice Detail",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        subtitle: Text(
                                          "Number, Discount, Tax, Tax Rate, ....",
                                          style: TextStyle(
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w500),
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
                                          "Invice Date",
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: InkWell(
                                          splashColor: darkblue!,
                                          onTap: () {
                                            obj.selectDate(context, true);
                                          },
                                          child: Text(
                                            obj.startdate,
                                            style: TextStyle(
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
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
                                          style: TextStyle(
                                              fontSize: width * 0.035,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: InkWell(
                                          splashColor: darkblue!,
                                          onTap: () {
                                            obj.selectDate(context, false);
                                          },
                                          child: Text(
                                            obj.enddate,
                                            style: TextStyle(
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
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
                                      style: TextStyle(
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: height * 0.18,
                                child: Column(
                                  children: [
                                    ListTile(
                                        title: Text(
                                          "Add Items",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: darkblue!,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        leading: InkWell(
                                          onTap: () {
                                            obj.edititem(context, 0, false);
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
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      trailing: Text(
                                        obj.totalInvoceAmount,
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
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
                                        errorStyle:
                                            const TextStyle(color: Colors.red),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                        fillColor:
                                            Colors.black.withOpacity(0.2),
                                        hintText: "Note",
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
                                        errorStyle:
                                            const TextStyle(color: Colors.red),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                        fillColor:
                                            Colors.black.withOpacity(0.2),
                                        hintText: "Message",
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
                                  InvoiceModel model = InvoiceModel(
                                      dueDate: obj.enddate,
                                      invoidDate: obj.startdate,
                                      invoiceNumber:
                                          invoicenumberController.text,
                                      note: noteController.text,
                                      terms: msgController.text,
                                      productList: obj.itemList,
                                      companyModel:
                                          InvoiceController.to.companyModel,
                                      tocompanyModel:
                                          InvoiceController.to.toCompanyModel);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PDFPreview(model: model),
                                      ));
                                },
                                child: Container(
                                  height: height * 0.06,
                                  width: width * 0.4,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Print",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.04),
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
    );
  }
}
