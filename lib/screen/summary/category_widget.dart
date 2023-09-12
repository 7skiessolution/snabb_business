import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:provider/provider.dart';

import 'package:snabb_business/models/get_all_user_transaction_model.dart' as T;
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/api/ApiStore.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/controller/summerry_controller.dart';
import 'package:snabb_business/models/search_summary.dart';
import 'package:snabb_business/screen/transaction_schedule/transaction_card.dart';
import 'package:snabb_business/static_data.dart';
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
              primaryColor: darkblue,
              colorScheme: ColorScheme.light(primary: darkblue),
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
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SummeryController>(builder: (obj) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.type,
                      style: TextStyle(
                          color: darkblue,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.035),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: darkblue,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        focusColor: darkblue,
                        value: selectedType,
                        style: TextStyle(
                            color: darkblue,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.035),
                        onChanged: (newValue) {
                          setState(() {
                            selectedType = newValue as String;
                          });
                        },
                        items:
                            types.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: darkblue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.035),
                            ),
                          );
                        }).toList(),
                        hint: Text(AppLocalizations.of(context)!.selecttype),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: darkblue,
                        ),
                        elevation: 1,
                        isExpanded: true,
                        isDense: true,
                        selectedItemBuilder: (BuildContext context) {
                          return types.map<Widget>((String value) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: darkblue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width / 3,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppLocalizations.of(context)!.from,
                                style: TextStyle(
                                    color: darkblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.035),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: darkblue,
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  _selectDate(context, true);
                                },
                                child: Text(
                                  !dateFromPicked
                                      ? AppLocalizations.of(context)!.select
                                      : " ${selectedDateFrom.day} ${widget.months[selectedDateFrom.month - 1]} ${selectedDateFrom.year} ",
                                  style: TextStyle(
                                      color: darkblue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * 0.03),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 3,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppLocalizations.of(context)!.to,
                                style: TextStyle(
                                    color: darkblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.035),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: darkblue,
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  _selectDate(context, false);
                                },
                                child: Text(
                                  !dateToPicked
                                      ? AppLocalizations.of(context)!.select
                                      : " ${selectedDateTo.day} ${widget.months[selectedDateTo.month - 1]} ${selectedDateFrom.year}",
                                  style: TextStyle(
                                    color: darkblue,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                )
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
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context)!.results,
                            style: TextStyle(
                                color: darkblue,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.035),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.total,
                            style: TextStyle(
                                color: darkblue,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.035),
                          ),
                          Text(
                            '${HomeController.to.curency} ${obj.totalbalance}',
                            style: TextStyle(
                                color: obj.totalbalance < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.035),
                          ),
                        ],
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
                                                  color: darkblue,
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
                                    color: darkblue,
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
