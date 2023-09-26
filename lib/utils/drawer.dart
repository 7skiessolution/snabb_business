import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snabb_business/controller/homeController.dart';
import 'package:snabb_business/pdf/daily_sale_report.dart';
import 'package:snabb_business/screen/auth/loginScreen.dart';
import 'package:snabb_business/screen/budget/BudgetView.dart';
import 'package:snabb_business/screen/company/company.dart';
import 'package:snabb_business/screen/dashboardScreen.dart';
import 'package:snabb_business/screen/debit/deptsscreen.dart';
import 'package:snabb_business/screen/drawerscreen/Calender.dart';
import 'package:snabb_business/screen/drawerscreen/settings.dart';
import 'package:snabb_business/screen/drawerscreen/userProfile.dart';
import 'package:snabb_business/screen/schedule_transaction/schedule_transactions.dart';
import 'package:snabb_business/screen/summary/summary_screen.dart';
import 'package:snabb_business/screen/suppliers/suppliers.dart';
import 'package:snabb_business/screen/transactions/transactionScreen.dart';
import 'package:snabb_business/utils/color.dart';
import '../screen/drawerscreen/Preferences.dart';
import '../screen/drawerscreen/categories.dart';
import '../screen/invoice/invoice.dart';

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
        SizedBox(
          height: height * 0.1,
          width: width,
          child: Stack(
            children: [
              Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/dollar.jpg"))),
              ),
              Container(
                color: Colors.blue[900]!.withOpacity(0.9),
                height: height,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      HomeController.to.profilemodel!.data!.name!.toUpperCase(),
                      style:
                          TextStyle(color: white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          color: darkblue,
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const DashBoardScreen()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                    color: white,
                  ),
                  title: Text(
                    "OverView",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CompanyScreen()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.people_outline_sharp,
                    color: white,
                  ),
                  title: Text(
                    "Companies",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SuppliersScreen()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.theater_comedy_sharp,
                    color: white,
                  ),
                  title: Text(
                    "Supplier",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
                    color: white,
                  ),
                  title: Text(
                    "Summary",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
                    color: white,
                  ),
                  title: Text(
                    "Transaction",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
                    color: white,
                  ),
                  title: Text(
                    "Scheduled transactions",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     obj.drawermenueclose();
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (_) => WalletScreen(home: false)));
              //   },
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.account_balance_wallet_outlined,
              //       color: white,
              //     ),
              //     title: Text(
              //       "Wallet",
              //       style: TextStyle(
              //           color: white,
              //           fontSize: width * 0.03,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     obj.drawermenueclose();
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (_) => const BudgetView()));
              //   },
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.add_home_work_sharp,
              //       color: white,
              //     ),
              //     title: Text(
              //       "Budgets",
              //       style: TextStyle(
              //           color: white,
              //           fontSize: width * 0.03,
              //           fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const DebitScreen()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.account_tree_sharp,
                    color: white,
                  ),
                  title: Text(
                    "Debts",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
                    color: white,
                  ),
                  title: Text(
                    "Invoice",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
                    color: white,
                  ),
                  title: Text(
                    "Charts",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
              //                         color: Colors.white,
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
              //           // Navigator.push(
              //           //     context,
              //           //     MaterialPageRoute(
              //           //         builder: (_) => const ExpencePieChart()));
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

              InkWell(
                onTap: () {
                  obj.reportMenue();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => Preferences()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.file_copy_outlined,
                    color: white,
                  ),
                  title: Text(
                    "Reprts",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    obj.reports == true
                        ? Icons.keyboard_arrow_down_outlined
                        : Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                ),
              ),
              obj.reports == true
                  ? SizedBox(
                      height: height * 0.42,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              obj.drawermenueclose();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DailySaleReport()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: white,
                              ),
                              title: Text(
                                "Daily Sale Report",
                                style: TextStyle(
                                    color: white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: white,
                              ),
                              title: Text(
                                "Company Sale Report",
                                style: TextStyle(
                                    color: white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: white,
                              ),
                              title: Text(
                                "Purchase Report",
                                style: TextStyle(
                                    color: white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: white,
                              ),
                              title: Text(
                                "Supplier Report",
                                style: TextStyle(
                                    color: white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: white,
                              ),
                              title: Text(
                                "Expense Report",
                                style: TextStyle(
                                    color: white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // obj.drawermenueclose();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => const InvoiceScreen()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.wysiwyg_outlined,
                                color: white,
                              ),
                              title: Text(
                                "Cashflow Report",
                                style: TextStyle(
                                    color: white,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const CalenderScreen()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.calendar_month,
                    color: white,
                  ),
                  title: Text(
                    "Calendar",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
                    color: white,
                  ),
                  title: Text(
                    "User",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
                    Icons.details,
                    color: white,
                  ),
                  title: Text(
                    "Preferences",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  obj.drawermenueclose();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SettingsPage()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: white,
                  ),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                        color: white,
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500),
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
                      color: white,
                    ),
                    title: Text(
                      "LogOut",
                      style: TextStyle(
                          color: white,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ],
          ),
        )),
        Container(
            alignment: Alignment.center,
            width: width,
            color: darkblue,
            child: Image.asset(
              "images/icon1.png",
              width: 50,
              height: 50,
              color: Colors.white,
            )),
      ]);
    });
  }
}
