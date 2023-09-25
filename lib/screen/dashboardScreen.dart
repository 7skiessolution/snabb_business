import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snabb_business/controller/transaction_controller.dart';
import 'package:snabb_business/screen/bottomscreen/expense.dart';
import 'package:snabb_business/screen/chartsScreens/purchaseChart.dart';
import 'package:snabb_business/screen/chartsScreens/salesChart.dart';
import 'package:snabb_business/screen/drawerscreen/walletScreen.dart';
import 'package:snabb_business/screen/homeScreen.dart';
import 'package:snabb_business/utils/color.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:snabb_business/utils/navigation/curvenavigationbar.dart';
import '../utils/demonshape.dart';
import '../utils/drawer.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int maxCount = 5;
  var _selectedTab = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Get.put(TransactionController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        } else {
          SystemNavigator.pop();
        }
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          body: SizedBox(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                      child: Container(
                        height: height * 0.08,
                        width: width,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              child: Icon(
                                Icons.notes,
                                color: darkblue,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.55,
                            ),
                            Icon(
                              Icons.notifications_active_outlined,
                              color: darkblue,
                            ),
                            Icon(
                              Icons.delete_outline,
                              color: darkblue,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: getBody()),
                  ],
                ),
                Positioned(
                  bottom: height * 0.06,
                  right: width * 0.02,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Transform.scale(
                          scale: 0.8,
                          child: const ExpandableFloatingActionButton())),
                ),
              ],
            ),
          ),
          extendBody: true,
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 50.0,
            items: <Widget>[
              Image.asset(
                'images/home.png',
                fit: BoxFit.cover,
                color: Colors.white,
                width: width * 0.06,
              ),
              // const Icon(
              //   Icons.account_balance_wallet_outlined,
              //   size: 30,
              //   color: Colors.white,
              // ),
              Image.asset(
                'images/growth.png',
                fit: BoxFit.cover,
                color: Colors.white,
                width: width * 0.06,
              ),
              Image.asset(
                'images/bottomicon.png',
                fit: BoxFit.cover,
                color: Colors.white,
                width: width * 0.06,
                // scale: 1,
              ),
              const Icon(
                Icons.wallet,
                size: 30,
                color: Colors.white,
              ),
            ],
            color: AppColors.blue,
            buttonBackgroundColor: AppColors.redcolor,
            backgroundColor: AppColors.backgroundColor,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 400),
            onTap: (index) {
              setState(() {
                _selectedTab = index;
              });
            },
            letIndexChange: (index) => true,
          ),
          drawer: Drawer(
            width: width * 0.6,
            backgroundColor: white,
            child: const DrawerScreen(),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: _selectedTab,
      children: [
        const HomeScreen(),
        // WalletScreen(home: true),
        PurchaseChart(home: true),
        SalesChart(home: true),
        const ExpenseChart1()
      ],
    );
  }
}
