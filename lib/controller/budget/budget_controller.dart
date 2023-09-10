import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/budget_model.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';

class BudgetController extends GetxController {
  static BudgetController get to => Get.find();
  BudgetResponse? budgetModel;
  List<BudgetData> budgetList = [];
  List<BudgetData> displayOneMonthStatusItems = [];
  List<BudgetData> displayThreeMonthStatusItems = [];
  List<BudgetData> displayyearlytatusItems = [];
  List<BudgetData> displaySixMonthtatusItems = [];
  DateTime currentDate = DateTime.now();
  DateTime? newDurationDate;
  String? formattedDate;

  void getlists(snapshot) {
    displayOneMonthStatusItems = snapshot.where((item) {
      return item.duration == 'One Month';
    }).toList();
    print(
        " displayMonthStatusItemsdisplayMonthStatusItems ${displayOneMonthStatusItems.length}");
    /////////////////////////
    displayThreeMonthStatusItems = snapshot.where((item) {
      return item.duration == 'Three Month';

      //  &&
      //     dateTime.isAfter(
      //         DateTime.now().subtract(Duration(days: selectedWeeks * 7))

      // );
    }).toList();
    print(" displayweekStatusItems ${displayThreeMonthStatusItems.length}");

    ///////////////////////////////////////
    displayyearlytatusItems = snapshot.where((item) {
      return item.duration == 'Year';

      //  &&
      //     dateTime.isAfter(
      //         DateTime.now().subtract(Duration(days: selectedYears * 365))

      // );
    }).toList();
    print(" displayyearlytatusItems ${displayyearlytatusItems.length}");

    ////////////////////////////////
    displaySixMonthtatusItems = snapshot.where((item) {
      return item.duration == 'Six Month';
    }).toList();
    print(" displayothertatusItems ${displaySixMonthtatusItems.length}");

    update();
  }

  getbudgets() async {
    budgetList.clear();
    var result = await httpClient().get(StaticValues.getBudgets);
    if (result.statusCode == 200) {
      budgetModel = BudgetResponse.fromJson(result.data);
      for (var budget in budgetModel!.data!) {
        budgetList.add(budget);
      }
      getlists(budgetList);
    }
    update();
  }

  void showtoast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: darkblue,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 12,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG);
  }

  Future<bool> deletebudget(String id) async {
    bool isload = false;
    var result = await httpClient().delete('${StaticValues.deleteBudgets}/$id');
    if (result.statusCode == 200) {
      getbudgets();
      isload = true;
      showtoast("Delete succesfully");
    }
    return isload;
  }
}
