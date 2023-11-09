import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snabb_business/screen/invoice/company_model.dart';
import 'package:snabb_business/screen/invoice/invoice_controllers.dart';
import 'package:snabb_business/utils/appbarwidget.dart';
import 'package:snabb_business/utils/color.dart';

class InvoicCompanyINfo extends StatefulWidget {
  const InvoicCompanyINfo({super.key});

  @override
  State<InvoicCompanyINfo> createState() => _InvoicCompanyINfoState();
}

class _InvoicCompanyINfoState extends State<InvoicCompanyINfo> {
  var height;
  var width;
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyCityController = TextEditingController();
  TextEditingController companyStateController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController companyCountryController = TextEditingController();
  TextEditingController companyPostalController = TextEditingController();
  ////////////////////////////to///////////////////
  TextEditingController toNameController = TextEditingController();
  TextEditingController toCityController = TextEditingController();
  TextEditingController toStateController = TextEditingController();
  TextEditingController toAddressController = TextEditingController();
  TextEditingController toCountryController = TextEditingController();
  TextEditingController toPostalController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SizedBox(
            height: height,
            width: width,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: AppBarWidgt(text: "Invoice Info")),
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
                          child: const Padding(
                            padding:
                                EdgeInsets.only(top: 15.0, left: 20, right: 20),
                            child: Text(
                              "Invoice",
                              style: TextStyle(
                                  color: Colors.white,
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
                  padding: EdgeInsets.only(top: height * 0.15),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                        elevation: 10,
                        shadowColor: blue,
                        child: SizedBox(
                          height: height * 0.8,
                          width: width * 0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    "Company Information",
                                    style: GoogleFonts.poppins(
                                        color: blue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Card(
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SizedBox(
                                      width: width * 0.8,
                                      child: TextFormField(
                                        controller: companyNameController,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                              color: Colors.red),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 20),
                                          fillColor: Colors.grey,
                                          hintText: "Company Name",
                                          hintStyle: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600),
                                          alignLabelWithHint: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: darkblue!),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: darkblue!),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width,
                                              child: TextFormField(
                                                controller:
                                                    companyCityController,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Required';
                                                  }
                                                  return null;
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.red),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "City",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          //color:lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  alignLabelWithHint: true,
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                          child: Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Required';
                                                  }
                                                  return null;
                                                },
                                                controller:
                                                    companyStateController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.red),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "State",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          //color:lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  alignLabelWithHint: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Card(
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SizedBox(
                                      width: width * 0.8,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Required';
                                          }
                                          return null;
                                        },
                                        controller: companyAddressController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                              color: Colors.red),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 20),
                                          fillColor: Colors.grey,
                                          hintText: "Company Address",
                                          hintStyle: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600),
                                          alignLabelWithHint: true,
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: darkblue!),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: darkblue!),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Required';
                                                  }
                                                  return null;
                                                },
                                                controller:
                                                    companyCountryController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.red),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "Country",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          //color:lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  alignLabelWithHint: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                          child: Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Required';
                                                  }
                                                  return null;
                                                },
                                                controller:
                                                    companyPostalController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.red),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "Postal",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          //color:lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  alignLabelWithHint: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Text(
                                    "Invoice To",
                                    style: GoogleFonts.poppins(
                                        color: blue,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Card(
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SizedBox(
                                      width: width * 0.8,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Required';
                                          }
                                          return null;
                                        },
                                        controller: toNameController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                              color: Colors.red),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 20),
                                          fillColor: Colors.grey,
                                          hintText: "Company Name",
                                          hintStyle: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600),
                                          alignLabelWithHint: true,
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: darkblue!),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: darkblue!),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Required';
                                                  }
                                                  return null;
                                                },
                                                controller: toCityController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.red),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "City",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          //color:lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  alignLabelWithHint: true,
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                          child: Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Required';
                                                  }
                                                  return null;
                                                },
                                                controller: toStateController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.red),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "State",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          //color:lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  alignLabelWithHint: true,
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Card(
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SizedBox(
                                      width: width * 0.8,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Required';
                                          }
                                          return null;
                                        },
                                        controller: toAddressController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          errorStyle: const TextStyle(
                                              color: Colors.red),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 20),
                                          fillColor: Colors.grey,
                                          hintText: "Company Address",
                                          hintStyle: GoogleFonts.poppins(
                                              //color:lightgray,
                                              fontSize: width * 0.03,
                                              fontWeight: FontWeight.w600),
                                          alignLabelWithHint: true,
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: darkblue!),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: darkblue!),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.02),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Required';
                                                  }
                                                  return null;
                                                },
                                                controller: toCountryController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.red),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "Country",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          //color:lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  alignLabelWithHint: true,
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Expanded(
                                          child: Card(
                                            elevation: 7,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              width: width,
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Required';
                                                  }
                                                  return null;
                                                },
                                                controller: toPostalController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      color: Colors.red),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  fillColor: Colors.grey,
                                                  hintText: "Postal",
                                                  hintStyle:
                                                      GoogleFonts.poppins(
                                                          //color:lightgray,
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                  alignLabelWithHint: true,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: darkblue!),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.04,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        CompanyModel companyModel =
                                            CompanyModel(
                                                address:
                                                    companyAddressController
                                                        .text,
                                                city:
                                                    companyCityController.text,
                                                companyName:
                                                    companyNameController.text,
                                                country:
                                                    companyCountryController
                                                        .text,
                                                postal: companyPostalController
                                                    .text,
                                                state: companyStateController
                                                    .text);

                                        CompanyModel tocompanyModel =
                                            CompanyModel(
                                                address:
                                                    toAddressController.text,
                                                city: toCityController.text,
                                                companyName:
                                                    toNameController.text,
                                                country:
                                                    toCountryController.text,
                                                postal: toPostalController.text,
                                                state: toStateController.text);
                                        InvoiceController.to.saveCompanyInfo(
                                            companyModel, tocompanyModel);
                                        Navigator.pop(context);
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
                                        "Save",
                                        style: GoogleFonts.poppins(
                                            color: whitecolor,
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
