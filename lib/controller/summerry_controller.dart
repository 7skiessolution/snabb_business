import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummeryController extends GetConnect {
  SummeryController get instance => Get.find();

  var fromDate = DateTime.now().obs;
  var toDate = DateTime.now().obs;

  chosefromdate(context) async {
    DateTime? pickdate = await showDatePicker(
        context: context,
        initialDate: fromDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (pickdate != null && pickdate != fromDate.value) {
      fromDate.value = pickdate;
    }
  }

  chosetodate(context) async {
    DateTime? pickdate = await showDatePicker(
        context: context,
        initialDate: toDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (pickdate != null && pickdate != toDate.value) {
      toDate.value = pickdate;
    }
  }
}
