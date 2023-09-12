import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/invoice_controllers.dart';
import 'package:snabb_business/utils/color.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  var height, width;
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
      child: GetBuilder<InvoiceController>(builder: (obj) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: darkblue,
            title: Text(
              "New Invoce",
              style: TextStyle(
                  fontSize: width * 0.04, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            actions: [
              Center(
                  child: Text(
                "Next",
                style: TextStyle(
                    fontSize: width * 0.04, fontWeight: FontWeight.w500),
              )),
              SizedBox(
                width: width * 0.05,
              ),
              Icon(
                Icons.more_horiz,
                size: width * 0.06,
              ),
              SizedBox(
                width: width * 0.05,
              ),
            ],
          ),
          body: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: height * 0.08,
                    child: ListTile(
                        title: Text(
                          "Invoce Detail",
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
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    color: Colors.white,
                    height: height * 0.25,
                    child: Column(
                      children: [
                        ListTile(
                            title: Text(
                              "Select Customer",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: darkblue,
                                  fontWeight: FontWeight.w600),
                            ),
                            leading: Container(
                              width: width * 0.06,
                              height: height * 0.03,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: darkblue)),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: darkblue,
                                  size: width * 0.05,
                                ),
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: width * 0.04,
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
                              "Invoce Date",
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: InkWell(
                              splashColor: darkblue,
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
                              splashColor: darkblue,
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
                          "Rows",
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
                                  color: darkblue,
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
                                    border: Border.all(color: darkblue)),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: darkblue,
                                    size: width * 0.05,
                                  ),
                                ),
                              ),
                            ),
                            trailing: InkWell(
                              onTap: () {
                                if (obj.itemList.isNotEmpty) {
                                  obj.showItemDialog(context, height, width);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "No Item Found !",
                                      textColor: Colors.white,
                                      gravity: ToastGravity.TOP,
                                      fontSize: 17,
                                      timeInSecForIosWeb: 1,
                                      toastLength: Toast.LENGTH_SHORT);
                                }
                              },
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: darkblue,
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
                          maxLines: 4,
                          // controller: ,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            fillColor: Colors.black.withOpacity(0.2),
                            hintText: "Note",
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.white),
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
                          maxLines: 4,
                          // controller: ,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.black),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            fillColor: Colors.black.withOpacity(0.2),
                            hintText: "Message",
                            alignLabelWithHint: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
