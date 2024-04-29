import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:smartbells/common/base_colors.dart';
import 'package:smartbells/view/bottomsheet/view_bottom/alarm.dart';
import 'package:smartbells/view/bottomsheet/view_bottom/my_account.dart';
import 'package:smartbells/view/bottomsheet/view_bottom/notification.dart';

import '../../homepage/view_home/myhourlyalarms.dart';
import 'home.dart';

enum ThemeStyle {
  Light,
}

class Bottomsheet extends StatefulWidget {
  @override
  _BottomsheetState createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = 0;
    // TODO: implement initState
    super.initState();
  }
  //ThemeStyle _currentStyle = ThemeStyle.NotificationBadge;
  final pages = [
     home(),
     alarm(),
    myhouralarm(),
     // notification(),
     myAccount(),
  ];

  void onTap(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody for floating bar get better perfomance
      extendBody: true,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('wakkas'),
      // ),
      body: pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    ThemeStyle.Light;
    return _buildLightDesign();
  }

  Widget _buildLightDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: appColor,
      strokeColor: Color(0x30040307),
      unSelectedColor: blackColor,
      backgroundColor: Colors.white,
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text(
            "Home".tr,
            style: TextStyle(fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.notifications_active_outlined),
          title: Text(
            "Alarm".tr,
            style: TextStyle(fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.notifications_active_outlined),
          title: Text(
            "Hours".tr,
            style: TextStyle(fontSize: 10),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          title: Text(
            "My Account".tr,
            style: TextStyle(fontSize: 10),
          ),
        ),
        
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}