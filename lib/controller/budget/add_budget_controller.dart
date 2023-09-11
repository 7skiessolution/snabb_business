import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/budget/budget_controller.dart';
import 'package:snabb_business/screen/sale/get_categories_model.dart';
import 'package:snabb_business/screen/sale/income_catagery._model.dart';
import 'package:snabb_business/screen/sale/user_category_model.dart';
import 'package:snabb_business/static_data.dart';
import 'package:snabb_business/utils/color.dart';

class AddBudgetController extends GetxController {
  static AddBudgetController get to => Get.find();
  bool isLoading = false;

  TextEditingController amountTextController = TextEditingController();
  String selectedDuration = 'One Month';

  int? clicktile;
  List<SubCatagoriesModel> dummysubcatagorylist = [];
  List<SubCatagoriesModel> subcatagorylistview = [];
  String? getimage;
  String? selectedcatId;
  UserCategoryModel? selectedCatagorymodel;
  String? selectcatagorytital;
  String? selectcatagoryurl;
  String? selectedcat;
  bool opencatagoryclick = false;
  final TextEditingController subcatagorycontroller = TextEditingController();
  String? maingetimage;
  final TextEditingController controller = TextEditingController();
  GetCategoriesModel? model;
  void clearValues() {
    amountTextController.clear();
    selectedDuration = 'One Month';
    clicktile = null;
    dummysubcatagorylist.clear();
    subcatagorylistview.clear();
    getimage = null;
    selectedcatId = null;
    selectedCatagorymodel = null;
    selectcatagorytital = null;
    selectcatagoryurl = null;
    selectedcat = null;
    opencatagoryclick = false;
    subcatagorycontroller.clear();
    maingetimage = null;
    controller.clear();
    update();
  }

  final List<String> dropdownItems = [
    'One Month',
    'Three Month',
    'Six Month',
    'Year',
  ];

  String dateString() {
    return '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  }

  Widget showspinkit(context, var height, var width) {
    var widget = Container(
      height: height,
      width: width,
      color: Colors.black.withOpacity(0.1),
      child: Center(
        child: SpinKitCircle(
          color: darkblue,
          size: 50.0,
        ),
      ),
    );
    return widget;
  }

  void showtoast(String msg, var width) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: darkblue,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: width * 0.03,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG);
  }

  Future addbudget(
    Map<String, dynamic> data,
  ) async {
    var res = await httpClient().post(StaticValues.addBudgets, data: data);
    if (res.statusCode == 200) {
      BudgetController.to.getbudgets();
      clearValues();
    }
  }

  Future<void> saveBudget(context, var width) async {
    if (amountTextController.text.isNotEmpty && selectedcatId != null) {
      addbudget(
        {
          'amount': int.parse(amountTextController.text),
          'duration': selectedDuration.toString(),
          'categoryId': selectedcatId,
        },
      );
      showtoast("Added succesfully", width);

      isLoading = false;
      update();

      Navigator.pop(context);
    } else {
      showtoast("give all fields", width);

      isLoading = false;
      update();
    }
  }

  List<String> iconList = [
    "assets/snabbicons/water  bill.png",
    "assets/snabbicons/shopping.png",
    "assets/snabbicons/tech.png",
    "assets/snabbicons/travel.png",
    "assets/snabbicons/rent.png",
    "assets/snabbicons/salary.png",
    "assets/snabbicons/rent.png",
    "assets/snabbicons/pet.png",
    "assets/snabbicons/personal savings.png",
    "assets/snabbicons/pension.png",
    "assets/snabbicons/others.png",
    "assets/snabbicons/clothing.png",
    "assets/snabbicons/children.png",
    "assets/snabbicons/others.png",
    "assets/snabbicons/entertainment.png",
    "assets/snabbicons/family.png",
    "assets/snabbicons/food drink.png",
    "assets/snabbicons/food drink(eating out).png",
    "assets/snabbicons/others.png",
    "assets/snabbicons/accomodation.png",
    "assets/snabbicons/others.png",
  ];
}
