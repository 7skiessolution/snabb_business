import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/search_summary.dart' as summary;
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();
  double totalbalance = 0.0;
  calculateTotalBalance(List<summary.Data> a) {
    totalbalance = 0.0;

    for (int i = 0; i < a.length; i++) {
      if (a[i].type == 1) {
        totalbalance += a[i].totalAmount!;
      } else {
        totalbalance -= a[i].totalAmount!;
      }
    }
    Future.delayed(const Duration(seconds: 2), () {
      update();
    });
  }

  List<summary.Data> list = [];
  getcategory(int type, String start, String end) async {
    list.clear();
    var res = await httpClient().get(
        "${StaticValues.searchSummary}$type&StartDate=$start&EndDate=$end");
    print("-------search ${res.data}");
    summary.SearchSummary model = summary.SearchSummary.fromMap(res.data);
    model.data!.forEach((element) {
      list.add(element);
    });
    update();
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
              primaryColor: blue,
              colorScheme: ColorScheme.light(primary: blue),
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
        getcategory(
            selectedType == "Sale"
                ? 1
                : selectedType == "Expense"
                    ? 2
                    : selectedType == "Purchase"
                        ? 0
                        : 3,
            startdate!,
            enddate);
        update();
      }
    } else {
      if (picked != null && picked != selectedDateTo) {
        selectedDateTo = picked;
        dateToPicked = true;
        enddate = "${picked.day}-${picked.month}-${picked.year}";
        getcategory(
            selectedType == "Sale"
                ? 1
                : selectedType == "Expense"
                    ? 2
                    : selectedType == "Purchase"
                        ? 0
                        : 3,
            startdate!,
            enddate);
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
