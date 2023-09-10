// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
//import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:snab_budget/apis/model/get_user_all_transaction.dart' as tran;
// // import 'package:snab_budget/apis/model/user_LineGraph_model.dart' as lineGraph;
// import 'package:snab_budget/apis/model/user_category_model.dart';
// import 'package:snab_budget/apis/model/user_daily_transaction_model.dart'
// //     as dTra;
// import 'package:snab_budget/apis/model/user_income_expense_Graph_model.dart'
//     as inexGrap;
// import 'package:snab_budget/apis/model/user_month_Transcation_model.dart'
//     as mTra;
// import 'package:snab_budget/apis/model/user_recycle_transaction_model.dart'
//     as rTra;
// import 'package:snab_budget/apis/model/user_wallet_model.dart';
// import 'package:snab_budget/apis/model/user_year_transaction_model.dart'
//     as yTra;
// import 'package:snab_budget/main.dart';
// import 'package:snab_budget/models/currency_controller.dart';
// import 'package:snab_budget/models/get_transaction_type_model.dart';
// import 'package:snab_budget/models/transaction.dart' as tr;
// import 'package:snab_budget/models/transaction.dart';
// import 'package:snab_budget/static_data.dart';
// import 'package:snab_budget/utils/apptheme.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/main.dart';
import 'package:snabb_business/models/add_debit_model.dart';
import 'package:snabb_business/models/currency_model.dart';
import 'package:snabb_business/models/user_wallet_model.dart';
import 'package:snabb_business/models/user_wallet_model.dart' as wal;
import 'package:snabb_business/screen/sale/get_categories_model.dart';
import 'package:snabb_business/screen/sale/user_category_model.dart';
import 'package:snabb_business/static_data.dart';

import '../models/user_wallet_model.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:dio/dio.dart' as deo;

import '../models/user_wallet_model.dart';

class TransactionController extends GetxController {
  static TransactionController get to => Get.find();

  GetCategoriesModel? model;

  List<int> mounthamount = [];
  List<int> mounthamountmap = [];
  List<int> mounthamountexpence = [];
  List<int> mounthamountexpencemap = [];

  int totalincome = 0;
  String name = "";
  String email = "";
  num snabbWallet = 0;

  num balance = 0;
  int credit = 0;
  int dept = 0;
  int myExpense = 0;
  int myIncome = 0;
  int cash = 0;
  int bankTransfer = 0;
  int creditCard = 0;
  // String currency = "";
  String? lang;
  bool isdailyLoad = false;
  var colorList;
  var dataMap;

  int income() {
    totalincome = 0;
    for (var i = 0; i < mounthamount.length; i++) {
      totalincome = totalincome + mounthamount[i];
    }
    print("totalincome:$totalincome");
    return totalincome;
  }

  final double width = 7;
  int maxvalue = 0;
  int incomemax = 0;
  int expencemax = 0;

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

  Future<void> selectImage(
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
                        color: darkblue),
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
                                  color: darkblue)),
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
                                  color: darkblue)),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            pickImage = await picker.pickImage(
                                source: ImageSource.camera);
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
                            style: TextStyle(
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
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text('Select Image'),
      //       content: Text(
      //           'Do you want to select an image from the gallery or take a picture?'),
      //       actions: <Widget>[
      //         TextButton(
      //           child: Text('Gallery',
      //               style: TextStyle(
      //                   fontWeight: FontWeight.w600,
      //                   color: darkblue)),
      //           onPressed: () async {
      //             //Navigator.of(context).pop();
      //             //getImage(ImgSource.Gallery);
      //             pickImage =
      //                 await picker.pickImage(source: ImageSource.gallery);

      //             // Handle the picked image
      //             if (pickImage != null) {
      //               File compressedFile =
      //                   await compressImage(pickImage as XFile);
      //               _uploadPicture(compressedFile);
      //               // Do something with the picked image
      //               // For example, you can display it in an Image widget
      //             }
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //         TextButton(
      //           child: Text('Camera',
      //               style: TextStyle(
      //                   fontWeight: FontWeight.w600,
      //                   color: darkblue)),
      //           onPressed: () async {
      //             Navigator.of(context).pop();
      //             pickImage =
      //                 await picker.pickImage(source: ImageSource.camera);
      //             // Handle the picked image
      //             if (pickImage != null) {
      //               pathPickImage = pickImage!.path;

      //               setState(() {
      //                 pathFile = pickImage!.path;
      //               });

      //               final File imageFile = File(pickImage!.path);

      //               _uploadPicture(imageFile);
      //               // Do something with the picked image
      //               // For example, you can display it in an Image widget
      //             }
      //           },
      //         ),
      //         TextButton(
      //           child: Text(
      //             'Cancel',
      //             style:
      //                 TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
      //           ),
      //           onPressed: () async {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
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

  Future adddCatagoriesdata(UserCategoryModel model) async {
    var res =
        await httpClient().post(StaticValues.addCategory, data: model.toMap());
    getCatagoriesdata(model.type!);
  }

  Future getCatagoriesdata(String type) async {
    var res = await httpClient().get("${StaticValues.getCategories}$type");
    model = GetCategoriesModel.fromJson(res.data);
    update();
  }

  Future deleteCatagoriesdata(String id, String type) async {
    var res = await httpClient().delete("${StaticValues.deleteCategories}$id");
    getCatagoriesdata(type);
    update();
  }

  Future<bool> deleteDailyTransactiondata(
      BuildContext context, String id) async {
    bool confirmed = false;
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            // AppLocalizations.of(context)!.confor,
            AppLocalizations.of(context)!.confirmdeletion,
            style: TextStyle(color: darkblue, fontWeight: FontWeight.bold),
          ),
          elevation: 10,
          shadowColor: darkblue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Text(AppLocalizations.of(context)!.areyousuredeletedata),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: const TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                //     AppLocalizations.of(context)!.co,
                AppLocalizations.of(context)!.confirm,
                style: TextStyle(color: darkblue),
              ),
              onPressed: () {
                confirmed = true;
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    if (confirmDelete) {
      var res =
          await httpClient().delete("${StaticValues.deleteTrasaction}$id");
      // getUserDailyTransactiondata();
    }

    return confirmed;
  }

  Future<bool> recoverTransactiondata(BuildContext context, String id) async {
    bool confirmed = false;
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            // AppLocalizations.of(context)!.confor,

            "Recover Transaction",
            style: TextStyle(color: darkblue, fontWeight: FontWeight.bold),
          ),
          elevation: 10,
          shadowColor: darkblue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: const Text("Are You Sure You Want To Recover Transaction"),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: const TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                //     AppLocalizations.of(context)!.co,
                AppLocalizations.of(context)!.confirm,
                style: TextStyle(color: darkblue),
              ),
              onPressed: () {
                confirmed = true;
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    if (confirmDelete) {
      var res = await httpClient().post("${StaticValues.recoverTrasaction}$id");
      //fetchRecycleTransaction();
      // getUserDailyTransactiondata();
    }

    return confirmed;
  }

  Future addTransaction(
      String name,
      String note,
      num amount,
      num partialamount,
      String datetime,
      int type,
      int iscash,
      String catId,
      String currency,
      String walletId) async {
    String result;

    print("...............url............. = ${StaticValues.addTransaction}");
    try {
      deo.FormData data = pathFile.isEmpty
          ? deo.FormData.fromMap({
              "Name": name,
              "Amount": amount,
              "PartialAmount": partialamount,
              "Note": note,
              "DateTime": datetime,
              "Type": type,
              "PaymentType": iscash,
              "CategoryId": catId,
              "Currency": currency,
              "WalletId": walletId
            })
          : deo.FormData.fromMap({
              "Name": name,
              "Amount": amount,
              "PartialAmount": partialamount,
              "Note": note,
              "DateTime": datetime,
              "Type": type,
              "PaymentType": iscash,
              "File": await deo.MultipartFile.fromFile(
                pickImage!.path,
                filename: basename(pickImage!.path),
              ),
              "CategoryId": catId,
              "Currency": currency,
              "WalletId": walletId
            });

      print("...............url............. = ${StaticValues.addTransaction}");
      var response = await httpFormDataClient()
          .post(StaticValues.addTransaction, data: data);

      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200) {
        print("Response status Cose ${response.statusCode}");
        if (response.data != null) {
          print(".................${response.data}........");
        }
      }
      return response.data;
    } catch (e) {
      print("Exception = $e");
    }
    pathFile = "";
    update();
  }

  void changeLocale(value, context, height, width) async {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        return Transform.rotate(
          angle: math.radians(a1.value * 360),
          child: AlertDialog(
            elevation: 10,
            shadowColor: darkblue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
              height: height * 0.3,
              width: width * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppLocalizations.of(context)!.changelanguage,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        color: darkblue,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context)!.changelanguage,
                    style: TextStyle(
                        fontSize: width * 0.03,
                        color: darkblue,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.2,
                    width: width * 0.2,
                    child: Lottie.asset('assets/lottie_files/success.json'),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: const TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(
                  AppLocalizations.of(context)!.confirm,
                  style: TextStyle(color: darkblue),
                ),
                onPressed: () {
                  MyApp.setLocale(context, Locale(value));
                  lang = Localizations.localeOf(context).toString();
                  update();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  int findMax(List<int> numbers) {
    if (numbers.isEmpty) {
      throw ArgumentError('The list is empty');
    }

    int max = numbers[0]; // Assume the first element as the maximum

    for (int number in numbers) {
      if (number > max) {
        max = number; // Update the maximum if a larger number is found
      }
    }

    return max;
  }

///////////\\]]]]]
  // checking(List<int> myList) {
  //   list = [const FlSpot(0, 0)];
  //   int desiredResult = 10;
  //   for (var v = 0; v < myList.length; v++) {
  //     int monthIndex = v + 1;
  //     int count = myList[v];
  //     int y4 = 0;
  //     int y3 = findMaxValueWithIndex(myList) ~/ desiredResult;

  //     if (y3 == 0) {
  //       y4 = 0;
  //     } else {
  //       y4 = count ~/ y3;
  //       update();
  //     }
  //     list.add(FlSpot(monthIndex.toDouble(), y4.toDouble()));
  //   }
  //   update();
  // }

///////////////////////////////////////////////

  List<DebitCreditData> debtCreditlst = [];
  fetchDebtsCredits() async {
    debtCreditlst.clear();
    DebitCreditModel? debitcreditmodel;

    var result = await httpClient().get(StaticValues.getdebitcredit);
    debitcreditmodel = DebitCreditModel.fromJson(result.data);
    print(
        "debitcreditmodeldebitcreditmodel  ${debitcreditmodel.data!.length} ");
    debtCreditlst = debitcreditmodel.data!;
    update();
  }

//////////////////////////////////////////////////////////////

  List<wal.Data> walletttt = [];

  Future<UserWalletModel> fetchAccounts() async {
    walletttt.clear();
    UserWalletModel? walletModel;

    var res = await httpClient().get(StaticValues.getWalletList);
    walletModel = UserWalletModel.fromMap(res.data);

    walletttt = await walletModel.data!;
    print("accont  ${walletttt.length} ");
    update();
    return walletModel;
  }

  ///////////////////////////////////////////////////

  int calculateSum(List<int> numbers) {
    int sum = 0;
    for (int number in numbers) {
      sum += number;
    }
    return sum;
  }

  int findMaxBetweenTwoValues(int a, int b) {
    return max(a, b);
  }

  int findMaxValueWithIndex(List<int> numbers) {
    if (numbers.isEmpty) {
      throw ArgumentError('The list is empty');
    }

    int max = numbers[0];
    int maxIndex = 0;

    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] > max) {
        max = numbers[i];
        maxIndex = i;
      }
    }
    return max;
  }

  void main() {
    int num1 = 10;
    int num2 = 20;

    int maxNumber = findMaxBetweenTwoValues(num1, num2);
    print('The maximum number between $num1 and $num2 is: $maxNumber');
  }

  String convertToKMBa(num value1) {
    if (value1 >= 1000000000000000) {
      return '${(value1 / 1000000000000000).toStringAsFixed(0)}Q';
    } else if (value1 >= 10000000000000) {
      return '${(value1 / 10000000000000).toStringAsFixed(0)}T';
    } else if (value1 >= 1000000000) {
      return '${(value1 / 1000000000).toStringAsFixed(0)}B';
    } else if (value1 >= 1000000) {
      return '${(value1 / 1000000).toStringAsFixed(0)}M';
    } else if (value1 >= 1000) {
      return '${(value1 / 1000).toStringAsFixed(0)}K';
    } else if (value1 >= 100) {
      return '${(value1 / 100).toStringAsFixed(0)}H';
    } else if (value1 > 0) {
      return value1.toString();
    } else if (value1 < 0) {
      return '-${convertToKMBa(-value1)}';
    } else {
      return '0';
    }
  }

  //-----------------Get Wallets------------
  //----------------------------------------

  UserWalletModel? walletModel;
  List<String> walletNames = [];
  List<wal.Data> walletList = [];
  bool isLoadData = false;
  String? selectedWalletId; // Store the selected wallet ID here
  String? dropdownValue; // Initialize dropdownValue as null

// ...

  Future<void> getWalletData() async {
    // Your existing code for fetching wallet data...
    var res = await httpClient().get(StaticValues.getWalletList);
    walletModel = UserWalletModel.fromMap(res.data);
    if (walletModel!.data != null) {
      walletList.clear();
      walletNames.clear();
      print("data-----");

      for (var wallet in walletModel!.data!) {
        walletList.add(wallet);
        walletNames.add(wallet.name!);
      }

      // Set the default dropdownValue to the first wallet's name
      if (walletNames.isNotEmpty) {
        dropdownValue = walletNames[0];
        selectedWalletId =
            walletModel!.data![0].walletId; // Set the selected wallet ID
      }

      isLoadData = false;
      update();
    } else {
      print("No data");
    }
  }
}
