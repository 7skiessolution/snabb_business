import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:snabb_business/controller/budget/budget_controller.dart';
import 'package:snabb_business/models/budget_model.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:snabb_business/utils/spinkit.dart';

class BudgetView extends StatefulWidget {
  const BudgetView({super.key});

  @override
  State<BudgetView> createState() => _BudgetViewState();
}

class _BudgetViewState extends State<BudgetView> {
  String selectedValue = 'One Month';

  var height, width;
  void showDeleteConfirmationDialog(BuildContext context, id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Confirm Delete',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            content: const Text(
              'Are you sure you want to delete this budget?',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Close the dialog when Cancel is pressed
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: darkblue,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(
                          255, 17, 41, 73)), // Set the custom color here
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    isLoading = true;
                  });

                  BudgetController.to.deletebudget(id).then((value) {
                    setState(() {
                      isLoading = false;
                    });
                  });
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }

  bool isLoading = false;

  // final String userId = FirebaseAuth.instance.currentUser!.uid;

  DateTime currentDate = DateTime.now();
  DateTime? newDurationDate;
  String? formattedDate;
  void updateDurationDate(String selectedOption) {
    switch (selectedOption) {
      case 'One Month':
        newDurationDate = currentDate.add(const Duration(days: 30));
        break;
      case 'Three Month':
        newDurationDate = currentDate.add(const Duration(days: 90));
        break;
      case 'Six Month':
        newDurationDate = currentDate.add(const Duration(days: 180));
        break;
      case 'Year':
        newDurationDate = currentDate.add(const Duration(days: 365));
        break;
      default:
        // Handle other cases if needed
        break;
    }
    DateTime originalDate = DateTime.parse(newDurationDate.toString());
    formattedDate = DateFormat('d/M/yyyy').format(originalDate);
  }

  double sliderCurrentValue = 0.5;
  @override
  void initState() {
    Get.put(BudgetController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              width: width * 0.9,
              height: height * 0.13,
              decoration: BoxDecoration(
                color: darkblue,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: width * 0.065,
                      )),
                  Text(
                    AppLocalizations.of(context)!.budget,
                    style: TextStyle(
                        fontSize: width * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                    flex: 0,
                    child: IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const AddBudget(),
                          //     ));
                          // showAddDialog(context);
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SizedBox(
                  height: height,
                  width: width,
                  child: GetBuilder<BudgetController>(initState: (state) {
                    BudgetController.to.getbudgets();
                  }, builder: (obj) {
                    return obj.budgetList.isEmpty
                        ? Center(
                            child: Text(
                            AppLocalizations.of(context)!.notransaction,
                          ))
                        : Stack(
                            children: [
                              SizedBox(
                                height: height,
                                width: width,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      obj.displayOneMonthStatusItems.isEmpty
                                          ? const SizedBox()
                                          : Container(
                                              height: height * 0.05,
                                              width: width * 0.9,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: darkblue),
                                              child: const Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: Center(
                                                          child: Text(
                                                            'One Month',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      obj.displayOneMonthStatusItems.isEmpty
                                          ? const SizedBox()
                                          : ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              primary: false,
                                              itemCount: obj
                                                  .displayOneMonthStatusItems
                                                  .length,
                                              itemBuilder: (context, index) {
                                                updateDurationDate(obj
                                                    .displayOneMonthStatusItems[
                                                        index]
                                                    .duration!);
                                                return customListTile(
                                                  transactions: obj
                                                      .displayOneMonthStatusItems[
                                                          index]
                                                      .transactions!,
                                                  id: obj
                                                      .displayOneMonthStatusItems[
                                                          index]
                                                      .budgetId!,
                                                  duration: obj
                                                      .displayOneMonthStatusItems[
                                                          index]
                                                      .duration!,
                                                  category: obj
                                                      .displayOneMonthStatusItems[
                                                          index]
                                                      .category!,
                                                  image: obj
                                                      .displayOneMonthStatusItems[
                                                          index]
                                                      .image!,
                                                  date: formattedDate!,
                                                  amount: obj
                                                      .displayOneMonthStatusItems[
                                                          index]
                                                      .amount!,
                                                  payable: obj
                                                      .displayOneMonthStatusItems[
                                                          index]
                                                      .paidAmount!,
                                                );
                                              },
                                            ),
                                      obj.displayThreeMonthStatusItems.isEmpty
                                          ? const SizedBox()
                                          : SizedBox(
                                              height: height * 0.02,
                                            ),
                                      ///////////////////////////////////
                                      obj.displayThreeMonthStatusItems.isEmpty
                                          ? const SizedBox()
                                          : Container(
                                              height: height * 0.05,
                                              width: width * 0.9,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: darkblue),
                                              child: const Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: Center(
                                                          child: Text(
                                                            "Three Month",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListView.builder(
                                        primary: false,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: obj
                                            .displayThreeMonthStatusItems
                                            .length,
                                        itemBuilder: (context, index) {
                                          updateDurationDate(obj
                                              .displayThreeMonthStatusItems[
                                                  index]
                                              .duration!);
                                          return customListTile(
                                            transactions: obj
                                                .displayThreeMonthStatusItems[
                                                    index]
                                                .transactions!,
                                            id: obj
                                                .displayThreeMonthStatusItems[
                                                    index]
                                                .budgetId!,
                                            duration: obj
                                                .displayThreeMonthStatusItems[
                                                    index]
                                                .duration!,
                                            category: obj
                                                .displayThreeMonthStatusItems[
                                                    index]
                                                .category!,
                                            image: obj
                                                .displayThreeMonthStatusItems[
                                                    index]
                                                .image!,
                                            date: formattedDate!,
                                            amount: obj
                                                .displayThreeMonthStatusItems[
                                                    index]
                                                .amount!,
                                            payable: obj
                                                .displayThreeMonthStatusItems[
                                                    index]
                                                .paidAmount!,
                                          );
                                        },
                                      ),
                                      obj.displaySixMonthtatusItems.isEmpty
                                          ? const SizedBox()
                                          : SizedBox(
                                              height: height * 0.02,
                                            ),
                                      /////////////////// otherrrr
                                      obj.displaySixMonthtatusItems.isEmpty
                                          ? const SizedBox()
                                          : Container(
                                              height: height * 0.05,
                                              width: width * 0.9,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: darkblue),
                                              child: const Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: Center(
                                                          child: Text(
                                                            "Six Month",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      obj.displaySixMonthtatusItems.isEmpty
                                          ? const SizedBox()
                                          : ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: obj
                                                  .displaySixMonthtatusItems
                                                  .length,
                                              itemBuilder: (context, index) {
                                                updateDurationDate(obj
                                                    .displaySixMonthtatusItems[
                                                        index]
                                                    .duration!);
                                                return customListTile(
                                                  transactions: obj
                                                      .displaySixMonthtatusItems[
                                                          index]
                                                      .transactions!,
                                                  id: obj
                                                      .displaySixMonthtatusItems[
                                                          index]
                                                      .budgetId!,
                                                  duration: obj
                                                      .displaySixMonthtatusItems[
                                                          index]
                                                      .duration!,
                                                  category: obj
                                                      .displaySixMonthtatusItems[
                                                          index]
                                                      .category!,
                                                  image: obj
                                                      .displaySixMonthtatusItems[
                                                          index]
                                                      .image!,
                                                  date: formattedDate!,
                                                  amount: obj
                                                      .displaySixMonthtatusItems[
                                                          index]
                                                      .amount!,
                                                  payable: obj
                                                      .displaySixMonthtatusItems[
                                                          index]
                                                      .paidAmount!,
                                                );
                                              },
                                            ),
                                      obj.displayyearlytatusItems.isEmpty
                                          ? const SizedBox()
                                          : SizedBox(
                                              height: height * 0.02,
                                            ),
                                      // /////////////////////// yearly
                                      obj.displayyearlytatusItems.isEmpty
                                          ? const SizedBox()
                                          : Container(
                                              height: height * 0.05,
                                              width: width * 0.9,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: darkblue),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    15.0),
                                                        child: Center(
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .yearly,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      obj.displayyearlytatusItems.isEmpty
                                          ? const SizedBox()
                                          : ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: obj
                                                  .displayyearlytatusItems
                                                  .length,
                                              itemBuilder: (context, index) {
                                                updateDurationDate(obj
                                                    .displayyearlytatusItems[
                                                        index]
                                                    .duration!);
                                                return customListTile(
                                                  transactions: obj
                                                      .displayyearlytatusItems[
                                                          index]
                                                      .transactions!,
                                                  id: obj
                                                      .displayyearlytatusItems[
                                                          index]
                                                      .budgetId!,
                                                  duration: obj
                                                      .displayyearlytatusItems[
                                                          index]
                                                      .duration!,
                                                  category: obj
                                                      .displayyearlytatusItems[
                                                          index]
                                                      .category!,
                                                  image: obj
                                                      .displayyearlytatusItems[
                                                          index]
                                                      .image!,
                                                  date: formattedDate!,
                                                  amount: obj
                                                      .displayyearlytatusItems[
                                                          index]
                                                      .amount!,
                                                  payable: obj
                                                      .displayyearlytatusItems[
                                                          index]
                                                      .paidAmount!,
                                                );
                                              },
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              isLoading == true
                                  ? Container(
                                      height: height,
                                      width: width,
                                      color: darkblue.withOpacity(0.2),
                                      child: Center(
                                        child: SpinKit.loadSpinkit,
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          );
                  })),
            )
          ],
        ),
      ),
    )));
  }

  Widget customListTile({
    required String category,
    required List<BudgetTransactions> transactions,
    required String image,
    required String duration,
    required String date,
    required double payable,
    required String id,
    required double amount,
  }) {
    var persentage = (((payable / amount) * 100)).toInt();
    var residual = amount - payable;

    sliderCurrentValue = persentage / 100;

    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      child: Card(
        elevation: 2,
        shadowColor: darkblue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            if (payable < amount) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => bugetTransaction(
              //         data: BudgetData(
              //       amount: amount,
              //       budgetId: id,
              //       category: category,
              //       image: image,
              //       paidAmount: payable,
              //       transactions: transactions,
              //       duration: duration,

              //       // date: date,
              //       // budgetAmount: amount.toInt(),
              //       // payableamount: payable.toInt(),
              //       // duration: duration,
              //       // ctagoryName: category,
              //       // ctagoryImage: image,
              //       // budgetID: id,
              //       // from: '',
              //       // notes: '',
              //     )),
              //   ),
              // );
            } else {
              BudgetController.to.showtoast("Budget Limit Full");
            }
          },
          child: Container(
            height: height * 0.12,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: height,
                  width: width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(category, style: TextStyle(fontSize: width * 0.03)),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      CircleAvatar(child: Image.asset(image)),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(dateString(),
                                  style: TextStyle(
                                    color: darkblue,
                                    fontSize: 12,
                                  )),
                              Text('$persentage %',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700)),
                              Text(date,
                                  style: TextStyle(
                                    color: darkblue,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SliderTheme(
                            data: const SliderThemeData(
                                trackHeight: 3,
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 0),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 0)),
                            child: Slider(
                              inactiveColor: Colors.grey,
                              activeColor: darkblue,
                              value: sliderCurrentValue,
                              onChanged: (double value) {},
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('0',
                                  style: TextStyle(
                                    color: darkblue,
                                    fontSize: 12,
                                  )),
                              Text(payable.toString(),
                                  style: TextStyle(
                                    color: darkblue,
                                    fontSize: 12,
                                  )),
                              Text(amount.toString(),
                                  style: TextStyle(
                                    color: darkblue,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                  '${AppLocalizations.of(context)!.residualamount}: $residual',
                                  style: TextStyle(
                                    color: darkblue,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: height,
                  width: width * 0.1,
                  child: IconButton(
                      onPressed: () {
                        showDeleteConfirmationDialog(context, id);
                      },
                      icon: const Icon(Icons.delete_forever)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String dateString() {
    return '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  }

  Widget showspinkit(context) {
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
}







//   String selectedCategory = 'Sale';
//   List<String> categories = ['Sale', 'Purchase'];

//   String selectedMonth = 'One Month';
//   List<String> months = ['One Month', 'Three Month', 'Six Month', 'Year'];
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;

//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//             width: width,
//             height: height,
//             child: Column(children: [
//               Container(
//                 alignment: Alignment.center,
//                 width: width,
//                 height: height * 0.1,
//                 decoration: BoxDecoration(
//                     color: darkblue,
//                     borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(12),
//                         bottomRight: Radius.circular(12))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(18),
//                   child: Row(children: [
//                     SizedBox(
//                       width: width * 0.05,
//                     ),
//                     InkWell(
//                         onTap: () => Navigator.pop(context),
//                         child: Icon(
//                           Icons.arrow_back_ios,
//                           color: white,
//                         )),
//                     SizedBox(
//                       width: width * 0.15,
//                     ),
//                     Text(
//                       "Budget",
//                       style: TextStyle(
//                           color: white,
//                           fontSize: width * 0.06,
//                           fontWeight: FontWeight.bold),
//                     )
//                   ]),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Select Category"),
//                   DropdownButton<String>(
//                     value: selectedCategory,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedCategory = newValue!;
//                       });
//                     },
//                     items: categories.map((String category) {
//                       return DropdownMenuItem<String>(
//                         value: category,
//                         child: Text(category),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.01,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Amount",
//                     style: TextStyle(fontSize: width * 0.05),
//                   ),
//                   Container(
//                     width: width * 0.3,
//                     child: TextFormField(
                    
                      
//                       decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.all(0),
//                         hintText: "0.000"),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Duration",
//                     style: TextStyle(
//                       fontSize: width * 0.05,
//                     ),
//                   ),
//                   DropdownButton<String>(
//                     value: selectedMonth,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedMonth = newValue!;
//                       });
//                     },
//                     items: months.map((String category) {
//                       return DropdownMenuItem<String>(
//                         value: category,
//                         child: Text(category),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.05,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: darkblue,
//                           borderRadius: BorderRadius.circular(6)),
//                       width: width * 0.25,
//                       height: height * 0.05,
//                       child: Center(
//                         child: Text(
//                           "Cancel",
//                           style: TextStyle(color: white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: width * 0.1,
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: darkblue,
//                           borderRadius: BorderRadius.circular(6)),
//                       width: width * 0.25,
//                       height: height * 0.05,
//                       child: Center(
//                         child: Text(
//                           "Save",
//                           style: TextStyle(color: white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
