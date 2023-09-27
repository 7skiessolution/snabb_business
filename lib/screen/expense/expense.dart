import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/expense_controller.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({
    super.key,
  });

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var height, width;

  @override
  void initState() {
    Get.put(ExpenseController());
    Get.put(TransactionController());
    ExpenseController.to.clearData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return KeyboardVisibilityBuilder(builder: (context, visible) {
      return GetBuilder<ExpenseController>(builder: (obj) {
        return Form(
          key: _formKey,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey[100],
            body: SafeArea(
              child: SizedBox(
                height: height,
                width: width,
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                            height: height * 0.06,
                            width: width * 0.8,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.arrow_back_ios)),
                                  Expanded(
                                    child: Container(
                                      height: height,
                                      width: width,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Expense",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.08),
                    child: SizedBox(
                      height: height * 0.12,
                      width: width,
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.12,
                            width: width,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/dollar.jpg"))),
                          ),
                          Container(
                            height: height * 0.12,
                            width: width,
                            color: Colors.blue[900]!.withOpacity(0.9),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 20, right: 20),
                              child: Text(
                                "New Entry",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.13),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.blue[900],
                        child: SizedBox(
                          height: height * 0.81,
                          width: width * 0.95,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.15,
                                        child: const CircleAvatar(
                                          child: CircleAvatar(
                                            radius: 22,
                                            backgroundImage: AssetImage(
                                                "images/expensive.png"),
                                          ),
                                        )),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Expense",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () => obj.selectDate(context),
                                  child: SizedBox(
                                    height: height * 0.06,
                                    width: width * 0.9,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: Colors.grey.shade700,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            width: width * 0.05,
                                          ),
                                          Text(
                                            obj.formatTime,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.55,
                                          ),
                                        ]),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    obj.showCategoryDilogue(
                                        context, height, width);
                                  },
                                  child: Container(
                                    height: height * 0.06,
                                    width: width * 0.9,
                                    color: const Color(0xfff3f2f2),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                            "images/paidas.png",
                                            width: width * 0.07,
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          const Text(
                                            'Category',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          obj.selectedCateory == null
                                              ? SizedBox(
                                                  width: width * 0.46,
                                                )
                                              : Container(
                                                  width: width * 0.46,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    obj.selectedCateory!.name!,
                                                    style: TextStyle(
                                                        color: Colors.blue[900],
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                          const Icon(
                                              Icons.arrow_drop_down_sharp)
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                InkWell(
                                  onTap: () {
                                    obj.showPaidDilogue(context, height, width);
                                  },
                                  child: Container(
                                    height: height * 0.06,
                                    width: width * 0.9,
                                    color: const Color(0xfff3f2f2),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                            "images/paidas.png",
                                            width: width * 0.07,
                                          ),
                                          SizedBox(
                                            width: width * 0.05,
                                          ),
                                          const Text(
                                            'Paid As',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.5,
                                          ),
                                          const Icon(
                                              Icons.arrow_drop_down_sharp)
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.025),
                                  child: SizedBox(
                                    height: height * 0.07,
                                    width: width * 0.95,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money_sharp,
                                          color: Colors.grey.shade700,
                                          size: 28,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: width,
                                            height: height,
                                            child: IgnorePointer(
                                              child: TextFormField(
                                                  controller: obj.expenseAmount,
                                                  decoration: InputDecoration(
                                                    labelText: 'Balance',
                                                    labelStyle: TextStyle(
                                                        fontSize: 14,
                                                        color: lightgray),
                                                  ),
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Balance";
                                                    } else {
                                                      return null;
                                                    }
                                                  }),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.025),
                                  child: SizedBox(
                                    height: height * 0.07,
                                    width: width * 0.95,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: Colors.grey.shade700,
                                          size: 28,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: width,
                                            height: height,
                                            child: TextFormField(
                                              controller: obj.particular,
                                              decoration: InputDecoration(
                                                labelText: 'Particular',
                                                labelStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: lightgray),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 9),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.file_present_outlined,
                                        color: darkblue,
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          TransactionController.to.selectImages(
                                              context, height, width);
                                        },
                                        child: Card(
                                          child: Container(
                                            width: width * 0.25,
                                            height: height * 0.05,
                                            decoration: BoxDecoration(
                                                color: darkblue,
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: Center(
                                                child: Text(
                                              "Add File",
                                              style: TextStyle(color: white),
                                            )),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Card(
                                      child: Container(
                                        width: width * 0.2,
                                        height: height * 0.05,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Center(
                                            child: Text(
                                          "Cancle",
                                          style: TextStyle(color: white),
                                        )),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          obj.postexpense();
                                        }
                                      },
                                      child: Card(
                                        child: Container(
                                          width: width * 0.2,
                                          height: height * 0.05,
                                          decoration: BoxDecoration(
                                              color: AppColors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Center(
                                              child: Text(
                                            "Save",
                                            style: TextStyle(color: white),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                visible
                                    ? SizedBox(height: height * 0.4)
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        );
      });
    });
  }
}
