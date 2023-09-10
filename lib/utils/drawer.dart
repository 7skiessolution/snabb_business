import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/screen/auth/loginScreen.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/screen/drawerscreen/Calender.dart';
import 'package:snabb_business/screen/debit/debit.dart';
import 'package:snabb_business/screen/drawerscreen/MonthlyBudgets.dart';
import 'package:snabb_business/screen/transaction_schedule/ShaduleTransactionScreen.dart';
import 'package:snabb_business/screen/drawerscreen/summeryScreen.dart';
import 'package:snabb_business/screen/drawerscreen/transactionScreen.dart';
import 'package:snabb_business/screen/drawerscreen/walletScreen.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import '../screen/ExpensePieChart.dart';
import '../screen/drawerscreen/Preferences.dart';
import '../screen/drawerscreen/categories.dart';
import '../screen/drawerscreen/invoice.dart';
import '../screen/drawerscreen/time.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(builder: (obj) {
      return Column(children: [
        Container(
          height: height * 0.2,
          width: width,
          alignment: Alignment.bottomCenter,
          color: darkblue,
          child: Column(
            children: [
              Container(
                height: height * 0.1,
                width: width * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(
                            "images/images__1_-removebg-preview (1).png"))),
              ),
              Text(
                "Business Version",
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DashBoardScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  color: darkblue,
                ),
                title: const Text("OverView"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SummeryScreen()));
                obj.drawermenueclose();
              },
              child: ListTile(
                leading: Icon(
                  Icons.summarize_sharp,
                  color: darkblue,
                ),
                title: const Text("Summary"),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const TransactionScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.data_usage_rounded,
                  color: darkblue,
                ),
                title: const Text("Transaction"),
              ),
            ),

            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ShaduleTransactionScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.paid_outlined,
                  color: darkblue,
                ),
                title: const Text("Scheduled transactions"),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const WalletScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: darkblue,
                ),
                title: const Text("Wallet"),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MonthlyBudgets()));
              },
              child: ListTile(
                leading: SizedBox(
                    height: height * 0.1,
                    width: width * 0.1,
                    child: Image.asset(
                      "images/images__1_-removebg-preview (1).png",
                      color: darkblue,
                    )),
                title: const Text("Budgets"),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DebitScreen()));
              },
              child: ListTile(
                leading: SizedBox(
                    height: height * 0.1,
                    width: width * 0.1,
                    child: Image.asset(
                      "images/dollar.png",
                      color: darkblue,
                    )),
                title: const Text("Debts"),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const InvoiceScreen()));
              },
              child: ListTile(
                leading: SizedBox(
                    height: height * 0.1,
                    width: width * 0.1,
                    child: Image.asset(
                      "images/invoices.png",
                      //  color: Color.fromARGB(255, 7, 111, 197),
                    )),
                title: const Text("Invoice"),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenue();
              },
              onDoubleTap: () {
                obj.drawermenueclose();
                // obj.category = false;
                // obj.expensecata = false;
              },
              child: ListTile(
                leading: SizedBox(
                    height: height * 0.08,
                    width: width * 0.08,
                    child: Image.asset(
                      "images/growth.png",
                      color: darkblue,
                    )),
                title: const Text("Charts"),
                trailing: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
            ),
            obj.category == true
                ? InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Categories()));
                    },
                    child: Container(
                      height: height * 0.05,
                      width: width,
                      //  alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.1),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  height: height * 0.1,
                                  width: width * 0.1,
                                  child: Image.asset(
                                    "images/Groupgraph.png",
                                    color: darkblue,
                                  )),
                              Text("Catagery"),
                            ]),
                      ),

                      //     const Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                  )
                : SizedBox(),
            obj.expensecata == true
                ? InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ExpencePieChart()));
                    },
                    child: Container(
                      height: height * 0.05,
                      width: width,
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.1),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  height: height * 0.1,
                                  width: width * 0.1,
                                  child: Image.asset(
                                    "images/chartexpenseicon.png",
                                    color: darkblue,
                                  )),
                              Text("Expense"),
                            ]),
                      ),

                      //     const Icon(Icons.keyboard_arrow_down_outlined),
                    ))
                : SizedBox(),
            obj.expensecata == true
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Time()));
                    },
                    child: Container(
                      height: height * 0.05,
                      width: width,
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.15),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  height: height * 0.1,
                                  width: width * 0.1,
                                  child: Image.asset(
                                    "images/chartexpenseicon.png",
                                    color: darkblue,
                                  )),
                              Text("Time"),
                            ]),
                      ),

                      //     const Icon(Icons.keyboard_arrow_down_outlined),
                    ))
                : SizedBox(),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (_) => Preferences()));
            //   },
            //   child: ListTile(
            //     leading: SizedBox(
            //         height: height * 0.1,
            //         width: width * 0.1,
            //         child: Image.asset(
            //           "images/growth.png",
            //           color: darkblue,
            //         )),
            //     title: const Text("Charts"),
            //     trailing: const Icon(Icons.keyboard_arrow_down_outlined),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CalenderScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.calendar_month,
                  color: darkblue,
                ),
                title: const Text("Calendar"),
              ),
            ),
            const Divider(),

            InkWell(
              onTap: () {
                obj.drawermenueclose();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const MonthlyBudgets()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.construction,
                  color: darkblue,
                ),
                title: const Text("Tools"),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const UserProfile()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.cloud,
                  color: darkblue,
                ),
                title: const Text("User"),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const MonthlyBudgets()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.help_rounded,
                  color: darkblue,
                ),
                title: const Text("Frequently asked questions"),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Preferences()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: darkblue,
                ),
                title: const Text("Prefernces"),
              ),
            ),
            InkWell(
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.getKeys();
                for (String key in preferences.getKeys()) {
                  preferences.remove(key);
                }
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false);
                });
              },
              child: ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    color: darkblue,
                    size: 32,
                  ),
                  title: const Text(
                    "LogOut",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )),
            ),
          ],
        )),
        Container(
          color: AppColors.blue.withOpacity(0.7),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: Container(
                height: height * 0.061,
                width: width * 0.15,
                decoration: BoxDecoration(
                    // color: AppColors.whitecolor.withOpacity(0.9),
                    //  borderRadius: BorderRadius.circular(20),
                    //border: Border.all(width: 2, color: white),
                    image: const DecorationImage(
                        image: AssetImage("images/logo.png"))),
              ),
            ),
          ),
        ),
      ]);
    });
  }
}
