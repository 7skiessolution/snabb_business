import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/currency_model.dart';
import 'package:snabb_business/models/get_data_year_type_model.dart' as sp;
import 'package:snabb_business/models/get_sale_purchase.dart';
import 'package:snabb_business/models/user_profile_model.dart';
import 'package:snabb_business/models/user_wallet_model.dart' as wm;
import 'package:snabb_business/static_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:snabb_business/models/yearly_transaction_model.dart' as yTra;

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

  List<Chartdata> expensedata = [];
  List<Chartdata> purchasedata = [];
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
      print("totalbalancexczvzx$totalbalance");
    } else {
      print("nodata ");
    }
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
// ...

  // double totalAmountType1 = 0.0;
  // List<yTra.Transactions> salesTransaction = [];
  // saleListOFChart() async {
  //   var res = await httpClient().get(StaticValues.getYearTrasaction);
  //   if (res.statusCode == 200) {
  //     chartData.clear();
  //     yTra.UserYearTransaction yearTransaction =
  //         yTra.UserYearTransaction.fromMap(res.data);
  //     for (var element in yearTransaction.data!) {
  //       List<yTra.Transactions> transactions = element.transactions ?? [];
  //       salesTransaction =
  //           transactions.where((transaction) => transaction.type == 1).toList();
  //       // Calculate total amounts for each type after subtracting partial amounts
  //       totalAmountType1 = salesTransaction
  //           .map((transaction) =>
  //               transaction.amount! - (transaction.partialAmount ?? 0))
  //           .fold(0, (prev, curr) => prev + curr);
  //       print("-0=-=-=-=-=- $totalAmountType1");
  //       chartData.add(
  //         SalesData(DateTime(element.year!), totalAmountType1),
  //       );

  //       print("chart data ${chartData[1].sales}");
  //       print("chart data ${chartData[1].year}");
  //     }

  //     update();
  //   }
  // }
// ...

  double totalAmountType1 = 0.0;
//List<SalesData> chartData = [];

  Future<void> saleListOFChart() async {
    final int currentYear = DateTime.now().year;

    // Clear existing chart data
    chartData.clear();

    for (int year = currentYear; year >= currentYear - 11; year--) {
      final String apiUrl = '${StaticValues.getYearTrasaction}/$year';

      try {
        final response = await httpClient().get(apiUrl);

        if (response.statusCode == 200) {
          yTra.UserYearTransaction yearTransaction =
              yTra.UserYearTransaction.fromMap(response.data);

          List<yTra.Transactions> transactions =
              yearTransaction.data?.first?.transactions ?? [];

          // Calculate total amounts for type 1 after subtracting partial amounts
          double totalAmountType1 = transactions
              .where((transaction) => transaction.type == 1)
              .map((transaction) =>
                  transaction.amount! - (transaction.partialAmount ?? 0))
              .fold(0, (prev, curr) => prev + curr);

          // Add the data to chartData
          chartData.add(
            SalesData(DateTime(year), totalAmountType1),
          );

          print("Year: $year, Total Amount Type 1: $totalAmountType1");
        } else {
          // Handle API request error
          print("Failed to fetch data for year $year");
        }
      } catch (e) {
        // Handle exceptions (e.g., network error)
        print("Error fetching data for year $year: $e");
      }
    }

    // Update the UI if necessary
    update();
  }

  expenseList(int type) async {
    DateTime a = DateTime.now();
    var res = await httpClient()
        .get("${StaticValues.getSalePurchaseType}$type/${a.year}");
    if (res.statusCode == 200) {
      if (type == 2) {
        expensedata.clear();
      } else if (type == 0) {
        purchasedata.clear();
      }
      GetSalePurhase salepurchasemodel = GetSalePurhase.fromMap(res.data);
      for (int i = 0; i < salepurchasemodel.data!.length; i++) {
        var e = salepurchasemodel.data![i];
        if (type == 2) {
          expensedata.add(
            Chartdata(convertToAbbreviatedMonth(i + 1), e),
          );
        } else if (type == 0) {
          purchasedata.add(
            Chartdata(convertToAbbreviatedMonth(i + 1), e),
          );
        }
        update();
      }
      print("purchase ${purchasedata.length}");
      print("expense ${expensedata.length}");
    }
    update();
  }

  List<sp.Data> expenseData = [];
  List<sp.Data> purchaseData = [];

  getexpensePurchase(int type) async {
    DateTime a = DateTime.now();
    var res = await httpClient()
        .get("${StaticValues.getSaledatatype}${a.year}/$type");
    if (res.statusCode == 200) {
      if (type == 2) {
        expenseData.clear();
      } else if (type == 0) {
        purchaseData.clear();
      }
      sp.GetDataYearType expensepurchasemodel =
          sp.GetDataYearType.fromMap(res.data);
      for (int i = 0; i < expensepurchasemodel.data!.length; i++) {
        var e = expensepurchasemodel.data![i];
        if (type == 2) {
          expenseData.add(e);
        } else if (type == 0) {
          purchaseData.add(e);
        }
        update();
      }
      print("purchase list ${purchaseData.length}");
      print("expense list ${expenseData.length}");
    }
    update();
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
  final int y;
}
