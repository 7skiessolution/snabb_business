// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:snabb_business/utils/colors.dart';
import 'package:snabb_business/utils/navigation/curvenavigationbar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _selectedTab = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: AppColors.whitecolor,
          ),
          Icon(
            Icons.broadcast_on_home,
            size: 30,
            color: AppColors.whitecolor,
          ),
          Icon(
            Icons.explore,
            size: 30,
            color: AppColors.whitecolor,
          ),
          Icon(
            Icons.chat_bubble,
            size: 30,
            color: AppColors.whitecolor,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: AppColors.whitecolor,
          ),
        ],
        color: AppColors.whitecolor,
        buttonBackgroundColor: AppColors.blue,
        backgroundColor: AppColors.whitecolor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: _selectedTab,
      children: const [
        // HomeScreen(),
        // BroadCastScreen(),
        // ExploreScreen(),
        // MineScreen(),
        // ProfileScreen(),
      ],
    );
  }
}
