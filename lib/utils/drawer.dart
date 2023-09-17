import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/screen/auth/loginScreen.dart';
import 'package:snabb_business/screen/budget/BudgetView.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/screen/debit/deptsscreen.dart';
import 'package:snabb_business/screen/drawerscreen/Calender.dart';
import 'package:snabb_business/screen/drawerscreen/userProfile.dart';
import 'package:snabb_business/screen/schedule_transaction/schedule_transactions.dart';
import 'package:snabb_business/screen/summary/summary_screen.dart';
import 'package:snabb_business/screen/schedule_transaction/ShaduleTransactionScreen.dart';
import 'package:snabb_business/screen/summary/summeryScreen.dart';
import 'package:snabb_business/screen/transactions/transactionScreen.dart';
import 'package:snabb_business/screen/drawerscreen/walletScreen.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import '../screen/ExpensePieChart.dart';
import '../screen/drawerscreen/Preferences.dart';
import '../screen/drawerscreen/categories.dart';
import '../screen/invoice/invoice.dart';
import '../screen/drawerscreen/time.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeController>(initState: (state) {
      Get.put(HomeController());
    }, builder: (obj) {
      return Column(children: [
        Container(
          height: height * 0.2,
          width: width,
          color: Colors.blue[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                title: Text(
                  "OverView",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SummeryScreen()));
                obj.drawermenueclose();
              },
              child: ListTile(
                leading: Icon(
                  Icons.summarize_sharp,
                  color: darkblue,
                ),
                title: Text(
                  "Summary",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
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
                title: Text(
                  "Transaction",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
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
                title: Text(
                  "Scheduled transactions",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
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
                title: Text(
                  "Wallet",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const BudgetView()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.add_home_work_sharp,
                  color: darkblue,
                ),
                title: Text(
                  "Budgets",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DebitScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.account_tree_sharp,
                  color: darkblue,
                ),
                title: Text(
                  "Debts",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                obj.drawermenueclose();
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const InvoiceScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.wysiwyg_outlined,
                  color: darkblue,
                ),
                title: Text(
                  "Invoice",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Categories()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.donut_large,
                  color: darkblue,
                ),
                title: Text(
                  "Charts",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // obj.category == true
            //     ? InkWell(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (_) => const Categories()));
            //         },
            //         child: SizedBox(
            //           height: height * 0.05,
            //           width: width,
            //           //  alignment: Alignment.center,
            //           child: Padding(
            //             padding: EdgeInsets.only(right: width * 0.1),
            //             child: Row(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   SizedBox(
            //                       height: height * 0.1,
            //                       width: width * 0.1,
            //                       child: Image.asset(
            //                         "images/Groupgraph.png",
            //                         color: darkblue,
            //                       )),
            //                   const Text("Catagery"),
            //                 ]),
            //           ),

            //           //     const Icon(Icons.keyboard_arrow_down_outlined),
            //         ),
            //       )
            //     : const SizedBox(),
            // obj.expensecata == true
            //     ? InkWell(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (_) => const ExpencePieChart()));
            //         },
            //         child: SizedBox(
            //           height: height * 0.05,
            //           width: width,
            //           child: Padding(
            //             padding: EdgeInsets.only(right: width * 0.1),
            //             child: Row(
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   SizedBox(
            //                       height: height * 0.1,
            //                       width: width * 0.1,
            //                       child: Image.asset(
            //                         "images/chartexpenseicon.png",
            //                         color: darkblue,
            //                       )),
            //                   const Text("Expense"),
            //                 ]),
            //           ),

            //           //     const Icon(Icons.keyboard_arrow_down_outlined),
            //         ))
            //     : const SizedBox(),

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
                    MaterialPageRoute(builder: (_) => const CalenderScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.calendar_month,
                  color: darkblue,
                ),
                title: Text(
                  "Calendar",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // const Divider(),

            // InkWell(
            //   onTap: () {
            //     obj.drawermenueclose();
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (_) => const MonthlyBudgets()));
            //   },
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.construction,
            //       color: darkblue,
            //     ),
            //     title: const Text("Tools"),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const UserProfile()));

                obj.drawermenueclose();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const UserProfile()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.cloud,
                  color: darkblue,
                ),
                title: Text(
                  "User",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            // InkWell(
            //   onTap: () {
            //     obj.drawermenueclose();
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (_) => const MonthlyBudgets()));
            //   },
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.help_rounded,
            //       color: darkblue,
            //     ),
            //     title: const Text("Frequently asked questions"),
            //   ),
            // ),
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
                title: Text(
                  "Prefernces",
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w500),
                ),
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
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (Route<dynamic> route) => false);
                });
              },
              child: ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    color: darkblue,
                  ),
                  title: Text(
                    "LogOut",
                    style: TextStyle(
                        fontSize: width * 0.03, fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        )),
        Container(
          color: darkblue,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.21),
              child: Container(
                height: height * 0.061,
                width: width * 0.15,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("images/logo.png"))),
              ),
            ),
          ),
        ),
      ]);
    });
  }
}
