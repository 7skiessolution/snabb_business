import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/currency_model.dart';
import 'package:snabb_business/models/get_data_year_type_model.dart' as sp;
import 'package:snabb_business/models/get_sale_purchase.dart';
import 'package:snabb_business/models/get_type_year_expense.dart' as elist;
import 'package:snabb_business/models/get_year_type_purchase.dart' as plist;
import 'package:snabb_business/models/get_year_type_sale.dart' as slist;
import 'package:snabb_business/models/user_profile_model.dart';
import 'package:snabb_business/models/user_wallet_model.dart' as wm;
import 'package:snabb_business/screen/company/companyModel.dart' as cm;
// import 'package:snabb_business/screen/expense/try_expense_chart.dart';
// import 'package:snabb_business/screen/purchase/try_purchase_chart.dart';
// import 'package:snabb_business/screen/sale/try_chart.dart';
import 'package:snabb_business/screen/schedule_transaction/add_Schedule_income.dart';
import 'package:dio/dio.dart' as dio;
import 'package:snabb_business/screen/suppliers/supplierModel.dart' as sm;
import 'package:snabb_business/static_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:snabb_business/models/yearly_transaction_model.dart' as yTra;
import '../models/dataclassgraphModel.dart';
import 'package:path/path.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  // ignore: library_private_types_in_public_api
  UserProfileModel? profilemodel;
  int? paymenttypeindex = -1;
  bool category = false;
  bool reports = false;
  bool expensecata = false;
  double totalSale = 0.0;
  double totalExpanse = 0.0;
  double totalPurchase = 0.0;
  String curency = "EURO";
  String userName = "Name";
  String userImage = "";

  final picker = ImagePicker();
  XFile? pickImage;
  File? compressedFile;
  String pathFile = "";

  List<Chartdata> expensedata = [];
  List<Chartdata> purchasedata = [];
  List<Chartdata> saledatalist = [];
  late TooltipBehavior tooltip;
  List<SalesData> chartData = [
    // SalesData(DateTime(2010), 54),
    // SalesData(DateTime(2011), 65),
    // SalesData(DateTime(2012), 45),
    // SalesData(DateTime(2013), 55),
    // SalesData(DateTime(2014), 76),
    // SalesData(DateTime(2015), 45),
    // SalesData(DateTime(2016), 57),
    // SalesData(DateTime(2017), 65),
    // SalesData(DateTime(2019), 78),
    // SalesData(DateTime(2019), 45),
    // SalesData(DateTime(2020), 100),
  ];
  List<SalesData> chart = [
    // SalesData(DateTime(2010), 15),
    // SalesData(DateTime(2011), 25),
    // SalesData(DateTime(2012), 38),
    // SalesData(DateTime(2013), 24),
    // SalesData(DateTime(2014), 40),
    // SalesData(DateTime(2015), 34),
    // SalesData(DateTime(2016), 12),
    // SalesData(DateTime(2017), 35),
    // SalesData(DateTime(2018), 23),
    // SalesData(DateTime(2019), 34),
    // SalesData(DateTime(2020), 50),
  ];

  cm.CompanyModel? companyModel;
  List<cm.Data> companyList = [];

  sm.SupplierModel? supplierModel;
  List<sm.Data> supplierList = [];

  double totalbalance = 0;
  List<wm.Data> walletList = [];

  CurrencyModell? selectedcurrency;
  bool isLoadData = false;
  List type = [
    "Individual",
    "Company",
  ];
  String select = "Company";
  changeValue(String value) {
    select = value;
    update();
  }

  changeCurrency(String? mycurrency, context) async {
    curency = mycurrency!;
    update();
    var res =
        await httpClient().post("${StaticValues.changeCurrency}$mycurrency");
    if (res.statusCode == 200) {
      getUserProfile();
      Fluttertoast.showToast(
          msg: res.data["status"],
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG);
    }
    Navigator.pop(context);
    update();
  }

  changeStatus(bool v) {
    isLoadData = v;
    update();
  }

  // Future adddWalletdata(Map<String, dynamic> model, BuildContext c) async {
  //   changeStatus(true);
  //   var res = await httpClient().post(StaticValues.addWalletData, data: model);
  //   if (res.statusCode == 200) {
  //     changeStatus(false);
  //     // getWalletdata();
  //   }
  //   Navigator.pop(c);
  // }
  Future addCompanyData(
      Map<String, dynamic> model, BuildContext c, String routpath) async {
    changeStatus(true);
    var res = await httpClient().post(StaticValues.addCompany, data: model);
    if (res.statusCode == 200) {
      changeStatus(false);
      getCompanydata();
    }
    if (routpath == "new") {
      Navigator.pop(c);
    }
  }

  Future addSupplierData(
    Map<String, dynamic> model,
  ) async {
    changeStatus(true);
    var res = await httpClient().post(StaticValues.addSupplier, data: model);
    if (res.statusCode == 200) {
      changeStatus(false);
      getSupplierdata();
    }
  }

  Future deleteWalletdata(String id, BuildContext c) async {
    var res = await httpClient().delete("${StaticValues.deleteWalletData}$id");
    if (res.statusCode == 200) {
      // getWalletdata();
      Fluttertoast.showToast(
          msg: res.data["status"],
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG);
      update();
    }
  }

  Future deleteCompanydata(String id, BuildContext c) async {
    var res = await httpClient().delete("${StaticValues.deleteCompany}$id");
    if (res.statusCode == 200) {
      getCompanydata();
      Navigator.pop(c);
      Fluttertoast.showToast(
          msg: res.data["status"],
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG);
      update();
    }
  }

  Future deleteSupplierdata(String id, BuildContext c) async {
    var res = await httpClient().delete("${StaticValues.deleteSupplier}$id");
    if (res.statusCode == 200) {
      getSupplierdata();
      Fluttertoast.showToast(
          msg: res.data["status"],
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG);
      update();
    }
  }

  Future getCompanydata() async {
    companyList.clear();
    isLoadData = true;
    var res = await httpClient().get(StaticValues.getCompanyList);
    companyModel = cm.CompanyModel.fromMap(res.data);
    if (companyModel!.data != null) {
      for (var company in companyModel!.data!) {
        companyList.add(company);
      }

      isLoadData = false;
      update();
    } else {
      print("nodata ");
    }
  }

  Future getSupplierdata() async {
    supplierList.clear();

    isLoadData = true;
    var res = await httpClient().get(StaticValues.getSupplierList);
    supplierModel = sm.SupplierModel.fromMap(res.data);
    if (supplierModel!.data != null) {
      for (var supplier in supplierModel!.data!) {
        supplierList.add(supplier);
      }
      log("geting home screen supplierList  ${supplierList.length}");

      isLoadData = false;
      update();
    } else {}
  }

  Future updateSupplierdata(
      Map<String, dynamic> model, String id, BuildContext c) async {
    changeStatus(true);
    var res = await httpClient()
        .post("${StaticValues.updateSuplier}$id", data: model);
    if (res.statusCode == 200) {
      print(res.data);
      changeStatus(false);
      getSupplierdata();
    }
    Navigator.pop(c);
  }

  Future updateCompanydata(
      Map<String, dynamic> model, String id, BuildContext c) async {
    changeStatus(true);
    var res = await httpClient()
        .post('${StaticValues.updateCompany}$id', data: model);
    if (res.statusCode == 200) {
      changeStatus(false);
      getCompanydata();
    }
    Navigator.pop(c);
  }

  @override
  void onInit() {
    // data = [
    //   Chartdata('JAN', 30),
    //   Chartdata('FEB', 90),
    //   Chartdata('MAR', 60),
    //   Chartdata('APR', 100),
    //   Chartdata('MAY', 80),
    //   Chartdata('JUN', 28),
    //   Chartdata('JUL', 80),
    //   Chartdata('AUG', 90),
    //   Chartdata('SEP', 50),
    //   Chartdata('OCT', 70),
    //   Chartdata('NOV', 80),
    //   Chartdata('DEC', 40)
    // ];
    tooltip = TooltipBehavior(enable: true);
    drawermenueclose();
    super.onInit();
  }

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

  pickeProfileImage() async {
    pickImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      compressedFile = await compressImage(pickImage as XFile);
    }
  }

  updateProfile(
    String email,
    String name,
    String gender,
  ) async {
    try {
      dio.FormData data = pathFile.isEmpty
          ? dio.FormData.fromMap({
              "Name": name,
              "Email": email,
              "Gender": gender,
            })
          : dio.FormData.fromMap({
              "Name": name,
              "Email": email,
              "Gender": gender,
              "Image": await dio.MultipartFile.fromFile(
                compressedFile!.path,
                filename: basename(compressedFile!.path),
              ),
            });
      print(data.fields.toString());
      dio.Response res = await httpFormDataClient()
          .post(StaticValues.updateProfileDetails, data: data);
      if (res.statusCode == 200) {
        showtoast(res.data["status"]);
        getUserProfile();
        pathFile = "";
      }
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }

  drawermenue() {
    expensecata = false;
    category = false;
    update();
    expensecata = true;
    category = true;
    update();
  }

  reportMenue() {
    reports = !reports;
    update();
  }

  drawermenueclose() {
    expensecata = false;
    category = false;

    update();
  }

  getUserProfile() async {
    var res = await httpClient().get(StaticValues.getProfileDetails);
    if (res.statusCode == 200) {
      profilemodel = UserProfileModel.fromMap(res.data);
      totalExpanse = profilemodel!.data!.expense ?? 0.0;
      totalPurchase = profilemodel!.data!.purchase ?? 0.0;
      totalSale = profilemodel!.data!.sale ?? 0.0;
      curency = profilemodel!.data!.currency!;
      userName = profilemodel!.data!.name!;
      userImage = profilemodel!.data!.imageUrl!;
    }
    update();
  }

  //////
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

  double totalAmountType1 = 0.0;
  List<yTra.Transactions> salesTransaction = [];

  // saleListOFChart() async {
  //   var res = await httpClient().get(StaticValues.getYearTrasaction);
  //   if (res.statusCode == 200) {
  //     chartData.clear();
  //     yTra.UserYearTransaction yearTransaction =
  //         yTra.UserYearTransaction.fromMap(res.data);
  //     for (var element in yearTransaction.data!) {
  //       // List<yTra.Transactions> transactions = element.transactions ?? [];
  //       print("bal match ${element.transactions}");
  //       salesTransaction = element.transactions!
  //           .where((transaction) => transaction.type == 1)
  //           .toList();
  //       print("sale list ${salesTransaction.length}");
  //       // Calculate total amounts for each type after subtracting partial amounts
  //       totalAmountType1 = salesTransaction
  //           .map((transaction) => transaction.totalAmount!)
  //           .fold(0, (prev, curr) => prev + curr);

  //       print("-0=-=-=-=-=- $totalAmountType1");

  //       chartData.add(
  //         SalesData(DateTime(element.year!), totalAmountType1),
  //       );
  //       update();

  //       // chart = [
  //       //   SalesData(DateTime(element.year!), totalAmountType1),
  //       // ];
  //     }

  //     update();
  //   }
  //   getlistofSale();
  // }

  // saleListOFChart() async {
  //   var res = await httpClient().get(StaticValues.getYearTrasaction);
  //   if (res.statusCode == 200) {
  //     chartData.clear();
  //     yTra.UserYearTransaction yearTransaction =
  //         yTra.UserYearTransaction.fromMap(res.data);
  //     for (var element in yearTransaction.data!) {
  //       List<yTra.Transactions> transactions = element.transactions ?? [];
  //       print("bal match $transactions");
  //       salesTransaction =
  //           transactions.where((transaction) => transaction.type == 1).toList();
  //       print("sale list $salesTransaction");
  //       // Calculate total amounts for each type after subtracting partial amounts
  //       totalAmountType1 = salesTransaction
  //           .map((transaction) =>
  //               transaction.amount! - (transaction.partialAmount ?? 0))
  //           .fold(0, (prev, curr) => prev + curr);

  //       print("-0=-=-=-=-=- $totalAmountType1");
  //       chartData.add(
  //         SalesData(DateTime(element.year!), totalAmountType1),
  //       );
  //       update();

  //       // chart = [
  //       //   SalesData(DateTime(element.year!), totalAmountType1),
  //       // ];
  //     }

  //     update();
  //   }
  // }

  expenseList(int type) async {
    print("select date ${selectdate.year}");
    var res = await httpClient()
        .get("${StaticValues.getSalePurchaseType}$type/${selectdate.year}");
    if (res.statusCode == 200) {
      print("res ${res.data} ");
      if (type == 2) {
        expensedata.clear();
      } else if (type == 0) {
        purchasedata.clear();
      } else if (type == 1) {
        saledatalist.clear();
        chartData.clear();
      }
      update();
      GetSalePurhase salepurchasemodel = GetSalePurhase.fromMap(res.data);
      for (int i = 0; i < salepurchasemodel.data!.length; i = i + 2) {
        var e = salepurchasemodel.data![i];
        var e2 = salepurchasemodel.data![i + 1];
        String month = "${i + 1}-${i + 2}";
        if (type == 2) {
          int total = e + e2;

          expensedata.add(
            Chartdata(month, total),
          );

          update();
        } else if (type == 0) {
          int total = e + e2;

          purchasedata.add(
            Chartdata(month, total),
          );

          update();
        } else if (type == 1) {
          int total = e + e2;
          update();
          chartData.add(
            SalesData(month, total),
          );

          saledatalist.add(
            Chartdata(month, total),
          );

          update();
        }
        update();
      }
      print("purchase ${purchasedata.length}");
      print("expense ${expensedata.length}");
      print("sale ${saledatalist.length}");
      if (type == 1) {
        chartData.forEach((element) {
          print("chartdata ${element.sales}");
        });
      }
    }
  }

  monthexpenseList(int type) async {
    print("select date ${selectdate.year}");
    var res = await httpClient().get(
        "${StaticValues.getSalePurchaseType}$type/${selectdate.year}/${selectdate.month}");
    if (res.statusCode == 200) {
      print("res ${res.data} ");
      if (type == 2) {
        expensedata.clear();
      } else if (type == 0) {
        purchasedata.clear();
      } else if (type == 1) {
        saledatalist.clear();
        chartData.clear();
      }
      update();
      GetSalePurhase salepurchasemodel = GetSalePurhase.fromMap(res.data);
      for (int i = 0; i < 30; i = i + 5) {
        var e = salepurchasemodel.data![i];
        var e2 = salepurchasemodel.data![i + 1];
        var e3 = salepurchasemodel.data![i + 2];
        var e4 = salepurchasemodel.data![i + 3];
        var e5 = salepurchasemodel.data![i + 4];
        var e6 = 0;
        if (i == 25) {
          e6 = salepurchasemodel.data![i + 5];
        }
        String month = "${i + 1}-${i + 5}";
        int total = e + e2 + e3 + e4 + e5 + e6;
        if (type == 2) {
          expensedata.add(
            Chartdata(month, total),
          );

          update();
        } else if (type == 0) {
          purchasedata.add(
            Chartdata(month, total),
          );

          update();
        } else if (type == 1) {
          update();
          chartData.add(
            SalesData(month, total),
          );

          saledatalist.add(
            Chartdata(month, total),
          );

          update();
        }
        update();
      }
      print("purchase ${purchasedata.length}");
      print("expense ${expensedata.length}");
      print("sale ${saledatalist.length}");
      if (type == 1) {
        chartData.forEach((element) {
          print("chartdata ${element.sales}");
        });
      }
    }
  }

  dayexpenseList(int type) async {
    print("select date ${selectdate.year}");
    var res = await httpClient().get(
        "${StaticValues.getdayWiseGraph}$type/${selectdate.year}/${selectdate.month}/${selectdate.day}");
    if (res.statusCode == 200) {
      print("res ${res.data} ");
      if (type == 2) {
        expensedata.clear();
      } else if (type == 0) {
        purchasedata.clear();
      } else if (type == 1) {
        saledatalist.clear();
        chartData.clear();
      }
      update();
      GetSalePurhase salepurchasemodel = GetSalePurhase.fromMap(res.data);
      print("month, total ${salepurchasemodel.data!.length}");
      for (int i = 0; i < 24; i = i + 4) {
        var e = salepurchasemodel.data![i];
        var e2 = salepurchasemodel.data![i + 1];
        var e3 = salepurchasemodel.data![i + 2];
        var e4 = salepurchasemodel.data![i + 3];

        String month = "${i + 1}-${i + 4}";
        int total = e + e2 + e3 + e4;
        if (type == 2) {
          expensedata.add(
            Chartdata(month, total),
          );

          update();
        } else if (type == 0) {
          purchasedata.add(
            Chartdata(month, total),
          );

          update();
        } else if (type == 1) {
          update();
          chartData.add(
            SalesData(month, total),
          );

          saledatalist.add(
            Chartdata(month, total),
          );

          update();
        }
        update();
      }
      print("purchase ${purchasedata.length}");
      print("expense ${expensedata.length}");
      print("sale ${saledatalist.length}");
      if (type == 1) {
        chartData.forEach((element) {
          print("chartdata ${element.sales}");
        });
      }
    }
  }

  List<elist.Data> expenseData = [];
  List<plist.Data> purchaseData = [];
  List<sp.Data> salaDatalist = [];
  List<slist.Data> salaData = [];
  DateTime now = DateTime.now();
  getlistPurchase(int type) async {
    print("hi");
    try {
      var res = await httpClient()
          .get("${StaticValues.getexpensePurchaseyearType}${now.year}/$type");
      if (res.statusCode == 200) {
        purchaseData.clear();
        plist.GetYearTypePurchase purchasemodel =
            plist.GetYearTypePurchase.fromMap(res.data);
        for (int i = 0; i < purchasemodel.data!.length; i++) {
          var e = purchasemodel.data![i];
          purchaseData.add(e);
          update();
        }
      }
      print("length of purchase data ${purchaseData.length}");
    } on Exception catch (e) {
      print("purchase error $e");
      // TODO
    }
  }

  getlistExpense(int type) async {
    print("hi");
    try {
      var res = await httpClient()
          .get("${StaticValues.getexpensePurchaseyearType}${now.year}/$type");
      if (res.statusCode == 200) {
        print("Expence data ${res.data}");
        expenseData.clear();
        elist.GetYearTypeExpense expenseemodel =
            elist.GetYearTypeExpense.fromMap(res.data);
        for (int i = 0; i < expenseemodel.data!.length; i++) {
          var e = expenseemodel.data![i];
          expenseData.add(e);
          update();
        }
      }
      print("length of purchase data ${expenseData.length}");
      //print("Expence data $expenseData");
    } on Exception catch (e) {
      print("purchase error $e");
      // TODO
    }
  }

  getlistofSale(int type) async {
    salaData.clear();
    var res = await httpClient()
        .get("${StaticValues.getexpensePurchaseyearType}${now.year}/$type");
    if (res.statusCode == 200) {
      slist.GetSaleYearType salemodel = slist.GetSaleYearType.fromMap(res.data);
      for (int i = 0; i < salemodel.data!.length; i++) {
        var e = salemodel.data![i];
        salaData.add(e);
        update();
      }
      // for (var element in yearTransaction.data!) {
      //   for (var e in element.transactions!) {
      //     if (e.type == 1) {
      //       salaData.add(e);
      //     }
      //   }
      // }
    }
  }

  // getexpensePurchase(int type) async {
  //   DateTime a = DateTime.now();
  //   var res = await httpClient()
  //       .get("${StaticValues.getSalePurchaseType}$type/${a.year}");
  //   if (res.statusCode == 200) {
  //     if (type == 1) {
  //       salaDatalist.clear();
  //     }
  //     sp.GetDataYearType expensepurchasemodel =
  //         sp.GetDataYearType.fromMap(res.data);
  //     for (int i = 0; i < expensepurchasemodel.data!.length; i++) {
  //       var e = expensepurchasemodel.data![i];
  //       if (type == 1) {
  //         salaDatalist.add(e);
  //       }
  //       update();
  //     }
  //     print("purchase list ${purchaseData.length}");
  //     print("expense list ${expenseData.length}");
  //     print("sale list ${salaDatalist.length}");
  //   }
  // }

  getinggraph(String v) {
    if (v == "Yearly") {
      expenseList(0);
      expenseList(1);
      expenseList(2);
    } else if (v == "Monthly") {
      monthexpenseList(0);
      monthexpenseList(1);
      monthexpenseList(2);
    } else {
      dayexpenseList(0);
      dayexpenseList(1);
      dayexpenseList(2);
    }
    update();
  }

  String dropdownvalue = 'Yearly';

  // List of items in our dropdown menu
  var items = [
    'Yearly',
    'Monthly',
    'Daily',
  ];
  DateTime selectdate = DateTime.now();
  String formatTime = DateFormat("dd-MM-yyyy").format(DateTime.now());
  Future<void> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      selectdate = selectedDate;
      formatTime = DateFormat("dd-MM-yyyy").format(selectedDate);
      chartData.clear();

      getinggraph(dropdownvalue);
      update();
    }
  }
}

class Chartdata {
  Chartdata(
    this.x,
    this.y,
  );

  final String x;
  final int y;
}
