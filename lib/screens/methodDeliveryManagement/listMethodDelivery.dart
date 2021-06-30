import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/screens/methodDeliveryManagement/createMethodDelivery.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInForNewStaff.dart';
import 'package:managerdelivery/widget/showInfo.dart';


class ListMethodDelivery extends StatelessWidget {
  //const ListStaffDelivery({Key? key}) : super(key: key);
  Staff _staff = Get.find<Staff>();

  List<Widget> buildStaff() {
    List<Widget> listinfo = [];
    _staff.listAllNewStaff.forEach((element) {
      listinfo.add(
          ShowInfoNewSatff(
            email: element['email'],
            phone:element['phone'],
          ));
    });
    return listinfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text("New Staff Sign Up", style: Contanst.titleAppBar,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
                height: 42,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36.0),
                    border: Border.all(
                      color: Color(0xffFA4A0C),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    style: Contanst.titleTextFiled,
                    decoration: InputDecoration(
                      icon: Image.asset(
                        "assets/images/search.png",
                        width: 25,
                        height: 25,
                      ),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: Contanst.hintText,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Column(
                children: buildStaff(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
