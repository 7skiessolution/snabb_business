import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/models/search_summary.dart' as summary;
import 'package:snabb_business/static_data.dart';

class SummeryController extends GetxController {
  static SummeryController get to => Get.find();
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
}
