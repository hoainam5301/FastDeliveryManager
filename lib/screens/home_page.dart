import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/address.dart';
import 'package:managerdelivery/class/bank.dart';
import 'package:managerdelivery/class/district.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/class/staffType.dart';
import 'package:managerdelivery/class/ward.dart';
import 'package:managerdelivery/tabs/directional.dart';
import 'package:managerdelivery/tabs/home_tab.dart';
import 'package:managerdelivery/tabs/more_tab.dart';
import 'package:managerdelivery/tabs/statistical.dart';
import 'package:managerdelivery/widget/ButtonBottomTab.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabController = PageController();
    //_tabController.animateToPage(widget.indexPage, duration:Duration(milliseconds: 300), curve: Curves.easeOutCubic);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: PageView(
                controller: _tabController,
                onPageChanged: (num) {
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [
                  HomeTab(),
                  DirectionalTab(),
                  StatisticalTab(),
                  MoreTab(),
                ],
              )),
          ButtonBottomTab(
            selectTab: _selectedTab,
            tabPressed: (num) {
              _tabController.animateToPage(num,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic);
            },
          )
        ],
      ),
    );
  }
}
