// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:path/path.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:dio/dio.dart' as deo;

class ExpenseController extends GetxController {
  static ExpenseController get to => Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController bankamount = TextEditingController();
  TextEditingController cashamount = TextEditingController();
  TextEditingController otheramount = TextEditingController();
  TextEditingController expenseAmount = TextEditingController();
  TextEditingController particular = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool company = true;
  File? compressedFile;
  XFile? pickImage;
  String pathFile = "";
  final picker = ImagePicker();
  Future<File> _createFile(Uint8List data) async {
    // Create a temporary directory
    Directory tempDir = await getTemporaryDirectory();

    // Generate a unique file name
    String tempPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    // Write the data to a file
    File file = File(tempPath);
    await file.writeAsBytes(data);

    return file;
  }

  Future<File?> compressImage(XFile img) async {
    pathFile = img.path;
    update();

    final File imageFile = File(img.path);
    // Get the original image bytes
    List<int> imageBytes = await imageFile.readAsBytes();

    // Check if the image is already smaller than 300KB
    if (imageBytes.length <= 300 * 1024) {
      return imageFile;
    } else if (imageBytes.length >= 300 * 1024 &&
        imageBytes.length <= 600 * 1024) {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      // Compress the image to 75% quality
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 25,
      );

      // Convert the compressed bytes to a Uint8List
      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      // Create a file from the compressed data
      compressedFile = await _createFile(compressedData);

      return compressedFile;
    } else if (imageBytes.length >= 600 * 1024 &&
        imageBytes.length <= 999 * 1024) {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      // Compress the image to 75% quality
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 10,
      );

      // Convert the compressed bytes to a Uint8List
      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      // Create a file from the compressed data
      File compressedFile = await _createFile(compressedData);

      return compressedFile;
    } else {
      Uint8List uint8List = Uint8List.fromList(imageBytes);
      // Compress the image to 75% quality
      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 5,
      );

      // Convert the compressed bytes to a Uint8List
      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      // Create a file from the compressed data
      File compressedFile = await _createFile(compressedData);

      return compressedFile;
    }
  }

  Future<void> selectImages(
      BuildContext context, double height, double width) async {
    final PermissionStatus status = await Permission.camera.request();
    final PermissionStatus status1 = await Permission.storage.request();
    if (status.isGranted && status1.isGranted) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppLocalizations.of(context)!.selectcategory,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: darkblue!),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .doyouwanttoselectanimagefromgallery,
                    style: TextStyle(
                      fontSize: width * 0.035,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.9,
                    height: height * 0.07,
                    child: Row(
                      children: [
                        TextButton(
                          child: Text(AppLocalizations.of(context)!.gallery,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: darkblue!)),
                          onPressed: () async {
                            //Navigator.of(context).pop();
                            //getImage(ImgSource.Gallery);
                            pickImage = await picker.pickImage(
                                source: ImageSource.gallery);

                            // Handle the picked image
                            if (pickImage != null) {
                              compressedFile =
                                  await compressImage(pickImage as XFile);

                              // Do something with the picked image
                              // For example, you can display it in an Image widget
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(AppLocalizations.of(context)!.camera,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: darkblue!)),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            pickImage = await picker.pickImage(
                                source: ImageSource.camera);
                            print("my imge ${pickImage.toString()}");
                            // Handle the picked image
                            if (pickImage != null) {
                              pathFile = pickImage!.path;
                              update();
                              compressedFile = File(pickImage!.path);

                              // Do something with the picked image
                              // For example, you can display it in an Image widget
                            }
                          },
                        ),
                        TextButton(
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.red),
                          ),
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      // Handle the case where the user denied permission
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context)!.permissiondenied,
            ),
            content: Text(
              AppLocalizations.of(context)!.pleasegrantpermissionphoto,
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.ok,
                ),
                onPressed: () async {
                  await Permission.photos.request();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future addCatagory(context) async {
    print("image path ${pickImage!.path}");
    try {
      deo.FormData data = deo.FormData.fromMap({
        // "name": name.text,
        // "imageUrl": await deo.MultipartFile.fromFile(
        //   pickImage!.path,
        //   filename: basename(pickImage!.path),
        // ),
        "name": name.text,
        "imageUrl": pickImage != null && pickImage!.path != ""
            ? await deo.MultipartFile.fromFile(
                pickImage!.path,
                filename: basename(pickImage!.path),
              )
            : null,
      });
      log("fields ${data.fields}");
      var response =
          await httpFormDataClient().post(StaticValues.addCategory, data: data);
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        print("Response status Cose ${response.statusCode}");
        if (response.data != null) {
          print(".................${response.data}........");
        }
      }
      name.clear();
      pathFile = "";
      Navigator.pop(context);
      Navigator.pop(context);
      return response.data;
    } catch (e) {
      print("Exception = $e");
    }
  }

  Future<void> showPaidDilogue(
      BuildContext context, double height, double width) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            color: Colors.grey.shade300,
            height: height * 0.4,
            width: width * 0.8,
            child: Stack(
              children: [
                Container(
                  height: height * 0.15,
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/dollar.jpg"))),
                ),
                Container(
                  height: height * 0.15,
                  width: width,
                  color: Colors.blue[900]!.withOpacity(0.9),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.03, left: width * 0.02),
                    child: Text(
                      "Paid As ",
                      style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.07),
                  child: Center(
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.blue[900],
                      child: Container(
                        height: height * 0.35,
                        width: width * 0.7,
                        color: white,
                        child: Center(
                          child: SingleChildScrollView(
                            primary: true,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/bank.jpeg")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Bank",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: bankamount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/Group.jpeg")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Cash",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: cashamount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: height * 0.08,
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceEvenly,
                                  //     children: [
                                  //       SizedBox(
                                  //         width: width * 0.11,
                                  //         height: height * 0.11,
                                  //         child: const Image(
                                  //             image: AssetImage(
                                  //                 "images/Group 247.jpeg")),
                                  //       ),
                                  //       Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           const Text(
                                  //             "Other",
                                  //             style: TextStyle(
                                  //               fontWeight: FontWeight.bold,
                                  //             ),
                                  //           ),
                                  //           SizedBox(
                                  //               height: height * 0.055,
                                  //               width: width * 0.5,
                                  //               child: TextFormField(
                                  //                 controller: otheramount,
                                  //                 decoration: InputDecoration(
                                  //                     border: InputBorder.none,
                                  //                     hintText: "Amount",
                                  //                     hintStyle: TextStyle(
                                  //                         fontWeight:
                                  //                             FontWeight.w500,
                                  //                         color: Colors.grey
                                  //                             .withOpacity(
                                  //                                 0.5)),
                                  //                     disabledBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     ),
                                  //                     focusedBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     ),
                                  //                     focusedErrorBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     ),
                                  //                     enabledBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     ),
                                  //                     errorBorder:
                                  //                         OutlineInputBorder(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(10),
                                  //                       borderSide: BorderSide(
                                  //                           color: Colors.grey
                                  //                               .withOpacity(
                                  //                                   0.5)),
                                  //                     )),
                                  //                 keyboardType:
                                  //                     TextInputType.number,
                                  //               ))
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),

                                  SizedBox(
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: width * 0.11,
                                          height: height * 0.11,
                                          child: const Image(
                                              image: AssetImage(
                                                  "images/micon.png")),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Total Expense Amount",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height: height * 0.055,
                                                width: width * 0.5,
                                                child: TextFormField(
                                                  controller: expenseAmount,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Amount",
                                                      hintStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                      disabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      )),
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
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

  Future<void> showCategoryDilogue(
      BuildContext context, double height, double width) {
    company = true;
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, st) {
          return AlertDialog(
            content: Container(
              color: Colors.grey.shade300,
              height: height * 0.6,
              width: width * 0.8,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.15,
                    width: width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/dollar.jpg"))),
                  ),
                  Container(
                    height: height * 0.15,
                    width: width,
                    color: Colors.blue[900]!.withOpacity(0.9),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.03, left: width * 0.2),
                      child: Text(
                        "Catagory",
                        style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.07),
                    child: Center(
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                        child: Container(
                            height: height * 0.5,
                            width: width * 0.75,
                            color: white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        HomeController.to.catagorylist.length,
                                    itemBuilder: (context, index) {
                                      print(
                                          "catagory list ${HomeController.to.catagorylist.length}");
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: height * 0.04,
                                          width: 100,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0)),
                                              Text(
                                                HomeController.to
                                                    .catagorylist[index].name!,
                                                style: TextStyle(
                                                    fontSize: width * 0.035,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (dc) {
                                        return AlertDialog(
                                          content: Container(
                                            color: Colors.grey.shade300,
                                            height: height * 0.65,
                                            width: width * 0.8,
                                            child: Form(
                                              key: _formKey,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: height * 0.15,
                                                    width: width,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                "images/dollar.jpg"))),
                                                  ),
                                                  Container(
                                                    height: height * 0.15,
                                                    width: width,
                                                    color: Colors.blue[900]!
                                                        .withOpacity(0.9),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: height * 0.03,
                                                          left: width * 0.02),
                                                      child: Text(
                                                        "Add Catagory",
                                                        style: TextStyle(
                                                            color: white,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: height * 0.07),
                                                    child: Center(
                                                      child: Card(
                                                        elevation: 10,
                                                        shadowColor:
                                                            Colors.blue[900],
                                                        child: Container(
                                                            height:
                                                                height * 0.55,
                                                            width: width * 0.7,
                                                            color: white,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.04,
                                                                    ),
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.84,
                                                                      child:
                                                                          TextFormField(
                                                                        autovalidateMode:
                                                                            AutovalidateMode.onUserInteraction,
                                                                        controller:
                                                                            name,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          errorStyle:
                                                                              const TextStyle(color: Colors.black),
                                                                          contentPadding: const EdgeInsets.symmetric(
                                                                              vertical: 0,
                                                                              horizontal: 20),
                                                                          fillColor:
                                                                              Colors.grey,
                                                                          hintText:
                                                                              " Name",
                                                                          labelText:
                                                                              "Catagory Name",
                                                                          alignLabelWithHint:
                                                                              true,
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            borderSide: BorderSide(color: AppColors.blue
                                                                                //  provider.brightness ==
                                                                                //         AppBrightness.dark
                                                                                //     ? AppTheme.colorWhite
                                                                                //     : AppTheme.colorPrimary,
                                                                                ),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            borderSide: BorderSide(color: AppColors.blue
                                                                                // provider.brightness ==
                                                                                //         AppBrightness.dark
                                                                                //     ? AppTheme.colorWhite
                                                                                //   : AppTheme.colorPrimary,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.02,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              9),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.file_present_outlined,
                                                                            color:
                                                                                darkblue,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                width * 0.05,
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              selectImages(context, height, width);
                                                                            },
                                                                            child:
                                                                                Card(
                                                                              child: Container(
                                                                                width: width * 0.25,
                                                                                height: height * 0.05,
                                                                                decoration: BoxDecoration(color: darkblue, borderRadius: BorderRadius.circular(3)),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  "Add File",
                                                                                  style: TextStyle(color: white),
                                                                                )),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.05,
                                                                    ),
                                                                    Card(
                                                                      elevation:
                                                                          5,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(7)),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          if (_formKey
                                                                              .currentState!
                                                                              .validate()) {
                                                                            addCatagory(context);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              height * 0.06,
                                                                          width:
                                                                              width * 0.45,
                                                                          decoration: BoxDecoration(
                                                                              color: AppColors.blue,
                                                                              borderRadius: BorderRadius.circular(7)),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Add Catagory",
                                                                              style: TextStyle(fontSize: width * 0.03, color: Colors.white, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: width * 0.055,
                                        ),
                                        onPressed: () => {},
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 10.0)),
                                      Text(
                                        "ADD NEW",
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
