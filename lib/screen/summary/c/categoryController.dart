import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/search_summary.dart' as summary;
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/colors.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();
  double totalbalance = 0.0;
  calculateTotalBalance(List<summary.Data> a) {
    totalbalance = 0.0;

    for (int i = 0; i < a.length; i++) {
      if (a[i].type == 1) {
        totalbalance += a[i].amount!;
      } else {
        totalbalance -= a[i].amount!;
      }
    }
    Future.delayed(const Duration(seconds: 2), () {
      update();
    });
  }

  Future<summary.SearchSummary> getcategory(
      int type, String start, String end) async {
    var res = await httpClient().get(
        "${StaticValues.searchSummary}$type&StartDate=$start&EndDate=$end");
    print("-------search ${res.data}");
    return summary.SearchSummary.fromMap(res.data);
  }

  String? startdate;
  String enddate = "";
  String date = "";
  DateTime now = DateTime.now();
  Future<void> selectDate(BuildContext context, bool from) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColors.blue,
              colorScheme: ColorScheme.light(primary: AppColors.blue),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );
    if (from) {
      if (picked != null && picked != selectedDateFrom) {
        selectedDateFrom = picked;
        dateFromPicked = true;
        startdate = "${picked.day}-${picked.month}-${picked.year}";
        update();
      }
    } else {
      if (picked != null && picked != selectedDateTo) {
        selectedDateTo = picked;
        dateToPicked = true;
        enddate = "${picked.day}-${picked.month}-${picked.year}";
        update();
      }
    }
    print("start  $startdate---------- end $enddate");
  }

  String selectedType = "All";
  bool dateFromPicked = false;
  bool dateToPicked = false;
  DateTime selectedDateFrom = DateTime.now();
  DateTime selectedDateTo = DateTime.now();

  List<String> types = [
    "All",
    'Sale',
    'Purchase',
    'Expense',
  ];
}
