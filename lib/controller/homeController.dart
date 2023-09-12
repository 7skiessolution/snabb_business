import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/currency_model.dart';
import 'package:snabb_business/models/pagemodel.dart';
import 'package:snabb_business/models/user_profile_model.dart';
import 'package:snabb_business/models/user_wallet_model.dart' as wm;
import 'package:snabb_business/static_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:snabb_business/models/yearly_transaction_model.dart' as yTra;
import 'package:snabb_business/models/monthly_transaction_model.dart' as mTra;

import '../models/dataclassgraphModel.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  // ignore: library_private_types_in_public_api
  UserProfileModel? profilemodel;
  int? paymenttypeindex = -1;
  bool category = false;
  bool expensecata = false;
  double totalSale = 0.0;
  double totalExpanse = 0.0;
  double totalPurchase = 0.0;
  String curency = "USD";

  late List<Chartdata> data;
  late TooltipBehavior tooltip;
  final List<SalesData> chartData = [
    SalesData(DateTime(2010), 54),
    SalesData(DateTime(2011), 65),
    SalesData(DateTime(2012), 45),
    SalesData(DateTime(2013), 55),
    SalesData(DateTime(2014), 76),
    SalesData(DateTime(2015), 45),
    SalesData(DateTime(2016), 57),
    SalesData(DateTime(2017), 65),
    SalesData(DateTime(2019), 78),
    SalesData(DateTime(2019), 45),
    SalesData(DateTime(2020), 100),
  ];
  final List<SalesData> chart = [
    SalesData(DateTime(2010), 15),
    SalesData(DateTime(2011), 25),
    SalesData(DateTime(2012), 38),
    SalesData(DateTime(2013), 24),
    SalesData(DateTime(2014), 40),
    SalesData(DateTime(2015), 34),
    SalesData(DateTime(2016), 12),
    SalesData(DateTime(2017), 35),
    SalesData(DateTime(2018), 23),
    SalesData(DateTime(2019), 34),
    SalesData(DateTime(2020), 50),
  ];

  wm.UserWalletModel? walletModel;

  double totalbalance = 0;
  List<wm.Data> walletList = [];

  CurrencyModell? selectedcurrency;
  bool isLoadData = false;

  changeCurrency(CurrencyModell model) {
    selectedcurrency = model;
    update();
  }

  changeStatus(bool v) {
    isLoadData = v;
    update();
  }

  Future adddWalletdata(Map<String, dynamic> model, BuildContext c) async {
    changeStatus(true);
    var res = await httpClient().post(StaticValues.addWalletData, data: model);
    if (res.statusCode == 200) {
      changeStatus(false);
      getWalletdata();
    }
    Navigator.pop(c);
  }

  Future deleteWalletdata(String id, BuildContext c) async {
    var res = await httpClient().delete("${StaticValues.deleteWalletData}$id");
    if (res.statusCode == 200) {
      getWalletdata();
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

  Future getWalletdata() async {
    walletList.clear();
    totalbalance = 0;
    isLoadData = true;
    var res = await httpClient().get(StaticValues.getWalletList);
    walletModel = wm.UserWalletModel.fromMap(res.data);
    if (walletModel!.data != null) {
      for (var wallet in walletModel!.data!) {
        walletList.add(wallet);
      }
      for (var vlaue in walletList) {
        totalbalance += vlaue.amount!;
      }

      isLoadData = false;
      curency = walletList[0].currency!;
      update();
      print("totalbalancexczvzx${totalbalance}");
    } else {
      print("nodata ");
    }
  }

  @override
  void onInit() {
    data = [
      Chartdata('JAN', 30),
      Chartdata('FEB', 90),
      Chartdata('MAR', 60),
      Chartdata('APR', 100),
      Chartdata('MAY', 80),
      Chartdata('JUN', 28),
      Chartdata('JUL', 80),
      Chartdata('AUG', 90),
      Chartdata('SEP', 50),
      Chartdata('OCT', 70),
      Chartdata('NOV', 80),
      Chartdata('DEC', 40)
    ];
    tooltip = TooltipBehavior(enable: true);
    drawermenueclose();
    super.onInit();
  }

  drawermenue() {
    expensecata = false;
    category = false;
    update();
    expensecata = true;
    category = true;
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
    }
    print(profilemodel.toString());
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

  saleListOFChart() async {
    var res = await httpClient().get(StaticValues.getYearTrasaction);
    if (res.statusCode == 200) {
      yTra.UserYearTransaction yearTransaction =
          yTra.UserYearTransaction.fromMap(res.data);
      yearTransaction.data!.forEach((element) {
        List<yTra.Transactions> transactions = element.transactions ?? [];
        List<yTra.Transactions> type1Transactions =
            transactions.where((transaction) => transaction.type == 1).toList();
        // Calculate total amounts for each type after subtracting partial amounts
        double totalAmountType1 = type1Transactions
            .map((transaction) =>
                transaction.amount! - (transaction.partialAmount ?? 0))
            .fold(0, (prev, curr) => prev + curr);
        print("-0=-=-=-=-=- ${convertToKMBa(totalAmountType1)}");
      });

      update();
    }
  }

  expenseAndPurchaseListOfchart() async {
    var res = await httpClient().get(StaticValues.getMonthTrasaction);
    if (res.statusCode == 200) {
      mTra.UserMonthTransaction monthTransaction =
          mTra.UserMonthTransaction.fromMap(res.data);
// purchase
      for (int i = 0; i < monthTransaction.data!.length; i++) {
        var element = monthTransaction.data![i];
        List<mTra.Transactions> transactions = element.transactions ?? [];
        List<mTra.Transactions> type0Transactions =
            transactions.where((transaction) => transaction.type == 0).toList();
        // Calculate total amounts for each type after subtracting partial amounts
        double totalAmountType0 = type0Transactions
            .map((transaction) =>
                transaction.amount! - (transaction.partialAmount ?? 0))
            .fold(0, (prev, curr) => prev + curr);
        print("-1=-=-=-=-=- ${convertToKMBa(totalAmountType0)}");

        //expense

        List<mTra.Transactions> type2Transactions =
            transactions.where((transaction) => transaction.type == 2).toList();
        // Calculate total amounts for each type after subtracting partial amounts
        double totalAmountType2 = type2Transactions
            .map((transaction) =>
                transaction.amount! - (transaction.partialAmount ?? 0))
            .fold(0, (prev, curr) => prev + curr);
        print("-2=-=-=-=-=- ${convertToKMBa(totalAmountType2)}");
        print("month convert ${convertToAbbreviatedMonth(i + 1)}");
      }
    }
  }

  // Function to convert full month names to lowercase abbreviated month names
  String convertToAbbreviatedMonth(int fullMonthName) {
    switch (fullMonthName) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'unknown';
    }
  }
}

class Chartdata {
  Chartdata(
    this.x,
    this.y,
  );

  final String x;
  final double y;
}
