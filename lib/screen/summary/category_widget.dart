import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:snabb_business/models/get_all_user_transaction_model.dart' as T;
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/summerry_controller.dart';
import 'package:snabb_business/models/search_summary.dart';
import 'package:snabb_business/screen/transaction_schedule/transaction_card.dart';
import 'package:snabb_business/utils/color.dart';

class CategoryWidget extends StatefulWidget {
  final List<String> months;
  const CategoryWidget({super.key, required this.months});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String? startdate;
  String enddate = "";
  String date = "";
  DateTime now = DateTime.now();
  Future<void> _selectDate(BuildContext context, bool from) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: darkblue!,
              colorScheme: ColorScheme.light(primary: darkblue!),
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
        setState(() {
          selectedDateFrom = picked;
          dateFromPicked = true;
          startdate = "${picked.day}-${picked.month}-${picked.year}";
        });
      }
    } else {
      if (picked != null && picked != selectedDateTo) {
        setState(() {
          selectedDateTo = picked;
          dateToPicked = true;
          enddate = "${picked.day}-${picked.month}-${picked.year}";
        });
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
  double totalAmount = 0.0;
  // final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    Get.put(HomeController());
    Get.put(SummeryController());
    SummeryController.to.totalbalance = 0.0;
    enddate = "${now.day}-${now.month}-${now.year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedFormatfrom =
        DateFormat('dd/MM/yyyy').format(selectedDateFrom);
    final selectedFormetTo = DateFormat('dd/MM/yyyy').format(selectedDateTo);
    Size size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GetBuilder<SummeryController>(builder: (obj) {
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
                                    value: selectedType,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.width * 0.035),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedType = newValue as String;
                                      });
                                    },
                                    items: types.map<DropdownMenuItem<String>>(
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
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    elevation: 1,
                                    isExpanded: true,
                                    isDense: true,
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return types.map<Widget>((String value) {
                                        return Container(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                fontSize: 14,
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
                                      _selectDate(context, true);
                                    },
                                    child: Text(
                                      !dateFromPicked
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
                                      _selectDate(context, false);
                                    },
                                    child: Text(
                                      !dateToPicked
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
                      startdate != null
                          ? FutureBuilder(
                              future: obj.getcategory(
                                  selectedType == "Sale"
                                      ? 0
                                      : selectedType == "Expense"
                                          ? 1
                                          : selectedType == "purchase"
                                              ? 2
                                              : 3,
                                  startdate!,
                                  enddate),
                              builder: (context, snapshot) {
                                return snapshot.hasData
                                    ? Expanded(
                                        child: ListView.builder(
                                          itemCount:
                                              snapshot.data!.data!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            Data snapshotdata =
                                                snapshot.data!.data![index];
                                            obj.calculateTotalBalance(
                                                snapshot.data!.data!);

                                            T.Data a = T.Data(
                                                amount: snapshotdata.amount,
                                                category:
                                                    snapshotdata.categoryName,
                                                dateTime: snapshotdata.dateTime,
                                                file: snapshotdata.files,
                                                name: snapshotdata.name,
                                                note: snapshotdata.note,
                                                currency: snapshotdata.currency,
                                                imageUrl: snapshotdata
                                                    .categoryImageUrl,
                                                type: snapshotdata.type);
                                            return TransactionCard(
                                                transaction: a);
                                          },
                                        ),
                                      )
                                    : snapshot.connectionState ==
                                            ConnectionState.waiting
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 100),
                                            child: Center(
                                                child: Text(
                                              AppLocalizations.of(context)!
                                                  .notransaction,
                                              style: TextStyle(
                                                  color: darkblue!,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: size.width * 0.035),
                                              textAlign: TextAlign.center,
                                            )),
                                          );
                              },
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
