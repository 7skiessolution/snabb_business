import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/main.dart';
import 'package:snabb_business/models/add_debit_model.dart';
import 'package:snabb_business/models/calnder_model.dart' as cTra;
import 'package:snabb_business/models/daily_transaction_model.dart' as dTra;
import 'package:snabb_business/models/get_all_user_transaction_model.dart'
    as tran;
import 'package:snabb_business/models/get_deleted_teansaction.dart' as delTra;
import 'package:snabb_business/models/monthly_transaction_model.dart' as mTra;
import 'package:snabb_business/models/user_wallet_model.dart';
import 'package:snabb_business/models/user_wallet_model.dart' as wal;
import 'package:snabb_business/models/yearly_transaction_model.dart' as yTra;
import 'package:snabb_business/screen/sale/get_categories_model.dart';
import 'package:snabb_business/static_data.dart';

import '../models/user_wallet_model.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:cell_calendar/cell_calendar.dart';

class TransactionController extends GetxController {
  static TransactionController get to => Get.find();

  dTra.UserDailyTransaction? dailyTransaction;
  List<dTra.Data> dailyTransactionList = [];
  mTra.UserMonthTransaction? monthTransaction;
  List<mTra.Data> monthTransactionList = [];
  yTra.UserYearTransaction? yearTransaction;
  List<yTra.Data> yearTransactionList = [];
  GetCategoriesModel? model;
  List<CalendarEvent> calanderEventList = [];
  List<delTra.Data> deleteTransaction = [];
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
  cTra.GetCalanderData? calanderTransaction;

  final picker = ImagePicker();
  Future<File> _createFile(Uint8List data) async {
    Directory tempDir = await getTemporaryDirectory();

    String tempPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    File file = File(tempPath);
    await file.writeAsBytes(data);

    return file;
  }

  Future<File?> compressImage(XFile img) async {
    pathFile = img.path;
    update();

    final File imageFile = File(img.path);

    List<int> imageBytes = await imageFile.readAsBytes();

    if (imageBytes.length <= 300 * 1024) {
      return imageFile;
    } else if (imageBytes.length >= 300 * 1024 &&
        imageBytes.length <= 600 * 1024) {
      Uint8List uint8List = Uint8List.fromList(imageBytes);

      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 10,
      );

      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      compressedFile = await _createFile(compressedData);

      return compressedFile;
    } else if (imageBytes.length >= 600 * 1024 &&
        imageBytes.length <= 999 * 1024) {
      Uint8List uint8List = Uint8List.fromList(imageBytes);

      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 5,
      );

      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      File compressedFile = await _createFile(compressedData);

      return compressedFile;
    } else {
      Uint8List uint8List = Uint8List.fromList(imageBytes);

      List<int> compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        quality: 2,
      );

      Uint8List compressedData = Uint8List.fromList(compressedBytes);

      File compressedFile = await _createFile(compressedData);

      return compressedFile;
    }
  }

  Future<void> selectImages(BuildContext context, double height, double width,
      bool sourcetype) async {
    if (sourcetype == true) {
      final PermissionStatus status = await Permission.camera.request();
      if (status.isGranted) {
        pickImage = await picker.pickImage(source: ImageSource.camera);
        print("my imge ${pickImage.toString()}");

        if (pickImage != null) {
          pathFile = pickImage!.path;
          update();
          compressedFile = File(pickImage!.path);
        }
      } else {
        // ignore: use_build_context_synchronously
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
    } else {
      final PermissionStatus status1 = await Permission.storage.request();
      if (status1.isGranted) {
        pickImage = await picker.pickImage(source: ImageSource.gallery);

        if (pickImage != null) {
          compressedFile = await compressImage(pickImage as XFile);
        }
      } else {
        // ignore: use_build_context_synchronously
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
            shadowColor: darkblue!,
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
                        color: darkblue!,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context)!.changelanguage,
                    style: TextStyle(
                        fontSize: width * 0.03,
                        color: darkblue!,
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
                  style: TextStyle(color: darkblue!),
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

    int max = numbers[0];

    for (int number in numbers) {
      if (number > max) {
        max = number;
      }
    }

    return max;
  }

  Future getUserCalanderTransactiondata() async {
    calanderEventList.clear();
    var res = await httpClient().get(StaticValues.getCalanderTransaction);
    if (res.statusCode == 200) {
      print(res.data);
      calanderTransaction = cTra.GetCalanderData.fromMap(res.data);

      try {
        for (var data in calanderTransaction!.data!) {
          DateTime date = DateFormat("dd-MM-yyyy").parse(data.dateTime!);

          CalendarEvent event = CalendarEvent(
              eventName: data.totalAmount.toString(),
              eventDate: date,
              eventBackgroundColor: data.type == 0
                  ? Colors.cyan
                  : data.type == 1
                      ? Colors.red
                      : darkblue!,
              eventTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 10));

          calanderEventList.add(event);
        }
      } catch (e) {
        print("no data");
      }
    }

    update();
  }

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

  List<wal.Data> walletttt = [];

  Future<UserWalletModel> fetchAccounts() async {
    walletttt.clear();
    UserWalletModel? walletModel;

    var res = await httpClient().get(StaticValues.getWalletList);
    walletModel = UserWalletModel.fromMap(res.data);

    walletttt = walletModel.data!;
    print("accont  ${walletttt.length} ");
    update();
    return walletModel;
  }

  int calculateSum(List<int> numbers) {
    int sum = 0;
    for (int number in numbers) {
      sum += number;
    }
    return sum;
  }

  UserWalletModel? walletModel;
  List<String> walletNames = [];
  List<wal.Data> walletList = [];
  bool isLoadData = false;
  String? selectedWalletId;
  String? dropdownValue;

  Future<void> getWalletData() async {
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

      if (walletNames.isNotEmpty) {
        dropdownValue = walletNames[0];
        selectedWalletId = walletModel!.data![0].walletId;
      }

      isLoadData = false;
      update();
    } else {
      print("No data");
    }
  }

  List<tran.Data> userAllTransaction = [];

  Future fetchTransaction() async {
    var res = await httpClient().get(StaticValues.getAllTransaction);
    tran.GetUserAllTransaction model =
        tran.GetUserAllTransaction.fromMap(res.data);
    userAllTransaction = model.data!;

    update();
  }

  Future getUserMonthTransactiondata() async {
    isdailyLoad = true;
    monthTransactionList.clear();
    var res = await httpClient().get(StaticValues.getMonthTrasaction);
    if (res.statusCode == 200) {
      isdailyLoad = false;
      monthTransaction = mTra.UserMonthTransaction.fromMap(res.data);
      print("-=-=-=-=-= ${monthTransaction!.data.toString()}");
      for (var data in monthTransaction!.data!) {
        monthTransactionList.add(data);
      }
    }
    print(monthTransactionList.length);

    update();
  }

  Future getUserYearTransactiondata() async {
    isdailyLoad = true;
    yearTransactionList.clear();
    var res = await httpClient().get(StaticValues.getYearTrasaction);
    if (res.statusCode == 200) {
      isdailyLoad = false;
      yearTransaction = yTra.UserYearTransaction.fromMap(res.data);
      for (var data in yearTransaction!.data!) {
        yearTransactionList.add(data);
      }
    }
    print(yearTransactionList.length);

    update();
  }

  Future getUserDailyTransactiondata() async {
    isdailyLoad = true;
    dailyTransactionList.clear();
    var res = await httpClient().get(StaticValues.getDailyTrasaction);
    if (res.statusCode == 200) {
      isdailyLoad = false;
      print(res.data);
      dailyTransaction = dTra.UserDailyTransaction.fromMap(res.data);
      print("dailty    $dailyTransaction");
      try {
        for (var data in dailyTransaction!.data!) {
          dailyTransactionList.add(data);
        }
      } catch (e) {
        print("no data");
      }
    }
    print(dailyTransactionList.length);

    update();
  }

  Future getuserDeletedTransaction() async {
    try {
      deleteTransaction.clear();
      var res = await httpClient().get(StaticValues.getDeleted);
      if (res.statusCode == 200) {
        print(res.data);
        delTra.GetDeletedTransaction model =
            delTra.GetDeletedTransaction.fromMap(res.data);

        for (var data in model.data!) {
          deleteTransaction.add(data);
        }
        print("deleted teransaction list length ${deleteTransaction.length}");
      }
      update();
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }

  Future<bool> deleteTransactiondata(
      BuildContext context, String id, int type, String name) async {
    bool confirmed = false;
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.confirmdeletion.toUpperCase(),
            style: GoogleFonts.poppins(
                color: blue,
                fontSize: MediaQuery.of(context).size.width * 0.035,
                fontWeight: FontWeight.w600),
          ),
          elevation: 10,
          shadowColor: blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Text(
            "Are You Sure You Want To Delete This Transaction?",
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              color: lightgray,
              fontWeight: FontWeight.w400,
            ),
          ),
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
                AppLocalizations.of(context)!.confirm,
                style: TextStyle(color: blue),
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
      if (name == "daily") {
        dio.Response res;
        if (type == 0) {
          res = await httpClient().delete("${StaticValues.deletepurchase}$id");
        } else if (type == 1) {
          res = await httpClient().delete("${StaticValues.deleteSale}$id");
        } else {
          res = await httpClient().delete("${StaticValues.deleteExpense}$id");
        }
        if (res.statusCode == 200) {
          getUserDailyTransactiondata();
        }
      }
      if (name == "monthly") {
        dio.Response res;
        if (type == 0) {
          res = await httpClient().delete("${StaticValues.deletepurchase}$id");
        } else if (type == 1) {
          res = await httpClient().delete("${StaticValues.deleteSale}$id");
        } else {
          res = await httpClient().delete("${StaticValues.deleteExpense}$id");
        }
        if (res.statusCode == 200) {
          getUserMonthTransactiondata();
        }
      }
      if (name == "yearly") {
        dio.Response res;
        if (type == 0) {
          res = await httpClient().delete("${StaticValues.deletepurchase}$id");
        } else if (type == 1) {
          res = await httpClient().delete("${StaticValues.deleteSale}$id");
        } else {
          res = await httpClient().delete("${StaticValues.deleteExpense}$id");
        }
        if (res.statusCode == 200) {
          getUserYearTransactiondata();
        }
      }
    }

    return confirmed;
  }

  Future<bool> recoverTransactiondata(
    BuildContext context,
    String id,
    int type,
  ) async {
    bool confirmed = false;
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.confirmdeletion.toUpperCase(),
            style: GoogleFonts.poppins(
                color: blue,
                fontSize: MediaQuery.of(context).size.width * 0.035,
                fontWeight: FontWeight.w600),
          ),
          elevation: 10,
          shadowColor: blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Text(
            "Are You Sure You Want To Recover This Transaction?",
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.03,
              color: lightgray,
              fontWeight: FontWeight.w400,
            ),
          ),
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
                AppLocalizations.of(context)!.confirm,
                style: TextStyle(color: blue),
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
      dio.Response res;
      if (type == 0) {
        res = await httpClient().post("${StaticValues.recoverPurchase}$id");
      } else if (type == 1) {
        res = await httpClient().post("${StaticValues.recoverSale}$id");
      } else {
        res = await httpClient().post("${StaticValues.recoverExpense}$id");
      }
      if (res.statusCode == 200) {
        getuserDeletedTransaction();
      }
    }

    return confirmed;
  }
}
