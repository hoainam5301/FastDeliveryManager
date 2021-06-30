import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/address.dart';
import 'package:managerdelivery/class/bank.dart';
import 'package:managerdelivery/class/district.dart';
import 'package:managerdelivery/class/orders.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/class/staffType.dart';
import 'package:managerdelivery/class/ward.dart';
import 'package:managerdelivery/controllers/staffController.dart';
import 'package:managerdelivery/screens/landing_page.dart';

void main() {
  Get.put(District());
  Get.put(Orders());
  Get.put(Ward());
  Get.put(Address());
  Get.put(StaffType());
  Get.put(StaffControllers());
  Get.put(Staff());
  Get.put(Bank());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Roboto Slab'
      ),
      home: LandingPage(),
    );
  }
}
