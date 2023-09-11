import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/currency_model.dart';
import 'package:snabb_business/models/user_profile_model.dart';
import 'package:snabb_business/models/user_wallet_model.dart' as wm;
import 'package:snabb_business/static_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
}

class Chartdata {
  Chartdata(
    this.x,
    this.y,
  );

  final String x;
  final double y;
}
