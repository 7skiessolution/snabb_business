import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/budget/budget_controller.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';

class TransactionBudgetController extends GetxController {
  static TransactionBudgetController get to => Get.find();
  final TextEditingController value = TextEditingController();

  final TextEditingController numberoftimescontroller = TextEditingController();
  final TextEditingController repeatcontrooler = TextEditingController();
  int index = 1;
  bool opencatagoryclick = false;
  int? clicktile;
  String? getimage;
  String? selectcatagorytital;
  String? paymentMethod;

  final TextEditingController controller = TextEditingController();
  final TextEditingController subcatagorycontroller = TextEditingController();
  final TextEditingController fromcontroller = TextEditingController();
  final TextEditingController notescontroller = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2400),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue,
              colorScheme: ColorScheme.light(primary: darkblue),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      _selectedDate = pickedDate;
      print(_selectedDate);
    }
  }

  void showtoast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: darkblue,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG);
  }

  void updatebudget(String budgetid, context) async {
    if (pay! < double.parse(value.text)) {
      showtoast("The Amount is up from the given budget.");
    } else {
      // double pay = widget.data.paidAmount! + int.parse(value.text);

      DateTime originalDate = DateTime.parse(_selectedDate.toString());
      String formattedDate = DateFormat('d/M/yyyy').format(originalDate);
      bool? iscash;
      if (paymentMethod == 'Cash') {
        iscash = true;
        update();
      } else {
        iscash = false;
        update();
      }
      Map<String, dynamic> data = {
        "budgetId": budgetid,
        "amount": double.parse(value.text),
        "isCash": iscash,
        "from": fromcontroller.text,
        "note": notescontroller.text,
        "date": formattedDate,
      };

      var result = await httpClient().post(StaticValues.payBudgets, data: data);
      if (result.statusCode == 200) {
        BudgetController.to.getbudgets();
        showtoast("update succesfully");
        paymentMethod = null;
        fromcontroller.clear();
        notescontroller.clear();
        value.clear();
      }

      isLoading = false;
      update();
      Navigator.pop(context);
    }
  }

  clearval() {}
  double? pay;
  DateTime _selectedDateschedule = DateTime.now();
  Future<void> selectDateschedule(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2400),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue,
              colorScheme: ColorScheme.light(primary: darkblue),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
    );

    if (pickedDate != null) {
      _selectedDateschedule = pickedDate;
      print(_selectedDateschedule);
    }
  }

  String formatTime = "";
  final TimeOfDay selectedTime = TimeOfDay.now();
  bool isLoading = false;
  bool status = false;
}
