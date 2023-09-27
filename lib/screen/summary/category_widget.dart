import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/models/get_all_user_transaction_model.dart' as T;
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/models/search_summary.dart';
import 'package:snabb_business/screen/summary/c/categoryController.dart';
import 'package:snabb_business/screen/transaction_schedule/transaction_card.dart';
import 'package:snabb_business/utils/color.dart';

class CategoryWidget extends StatefulWidget {
  final List<String> months;
  const CategoryWidget({super.key, required this.months});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  void initState() {
    Get.put(HomeController());
    Get.put(CategoryController());
    CategoryController.to.totalbalance = 0.0;
    CategoryController.to.enddate =
        "${CategoryController.to.now.day}-${CategoryController.to.now.month}-${CategoryController.to.now.year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedFormatfrom =
        DateFormat('dd/MM/yyyy').format(CategoryController.to.selectedDateFrom);
    final selectedFormetTo =
        DateFormat('dd/MM/yyyy').format(CategoryController.to.selectedDateTo);
    Size size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GetBuilder<CategoryController>(builder: (obj) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Card(
                  color: white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Column(
                        children: [
                          Text(
                            "Compare the values of the categories",
                            style: TextStyle(
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.type.capitalize!,
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                    focusColor: Colors.black,
                                    value: obj.selectedType,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.width * 0.035),
                                    onChanged: (newValue) {
                                      obj.selectedType = newValue as String;
                                      obj.update();
                                      obj.getcategory(
                                          obj.selectedType == "Sale"
                                              ? 1
                                              : obj.selectedType == "Expense"
                                                  ? 2
                                                  : obj.selectedType ==
                                                          "Purchase"
                                                      ? 0
                                                      : 3,
                                          obj.startdate!,
                                          obj.enddate);

                                      print("=-=-==-=-=- ${obj.selectedType}");
                                    },
                                    items: obj.types
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: size.width * 0.035),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(AppLocalizations.of(context)!
                                        .selecttype
                                        .capitalize!),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    elevation: 1,
                                    isExpanded: true,
                                    isDense: true,
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return obj.types
                                          .map<Widget>((String value) {
                                        return Container(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                fontSize: width * 0.03,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.from.capitalize!,
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    color: Colors.black),
                              ),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5)),
                                child: TextButton(
                                    onPressed: () {
                                      obj.selectDate(context, true);
                                    },
                                    child: Text(
                                      !obj.dateFromPicked
                                          ? AppLocalizations.of(context)!.select
                                          : selectedFormatfrom,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.03),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.to.capitalize!,
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                ),
                              ),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5)),
                                child: TextButton(
                                    onPressed: () {
                                      obj.selectDate(context, false);
                                    },
                                    child: Text(
                                      !obj.dateToPicked
                                          ? AppLocalizations.of(context)!.select
                                          : selectedFormetTo,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.03,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: size.width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.total.capitalize!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.035),
                          ),
                          Text(
                            ' ${obj.totalbalance} ${HomeController.to.curency}',
                            style: TextStyle(
                                color: obj.totalbalance < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.035),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      obj.startdate != null
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: obj.list.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Data snapshotdata = obj.list[index];
                                  obj.calculateTotalBalance(obj.list);

                                  T.Data a = T.Data(
                                      amount: snapshotdata.totalAmount,
                                      category: snapshotdata.details!.category,
                                      dateTime: snapshotdata.dateTime,
                                      file: snapshotdata.file,
                                      name: snapshotdata.name,
                                      note: snapshotdata.note,
                                      currency: snapshotdata.currency,
                                      imageUrl: snapshotdata.details!.imageUrl
                                          .toString(),
                                      type: snapshotdata.type);
                                  return TransactionCard(transaction: a);
                                },
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 100),
                              child: Center(
                                  child: Text(
                                "No Transaction Found !",
                                style: TextStyle(
                                    color: darkblue!,
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.035),
                                textAlign: TextAlign.center,
                              )),
                            ),
                    ],
                  )),
            ),
          ),
        ],
      );
    });
  }
}
