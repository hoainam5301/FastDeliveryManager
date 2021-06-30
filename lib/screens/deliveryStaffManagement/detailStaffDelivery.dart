import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/screens/deliveryStaffManagement/editStaffDelivery.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInfo.dart';

class DetailStaffDelivery extends StatelessWidget {
  //const DetailStaffDelivery({Key? key}) : super(key: key);
  final Staff staff;
  DetailStaffDelivery({this.staff});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "Detail Delivery",
            style: Contanst.titleAppBar,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(EditStaffDelivery(staff: staff,));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 6, left: 350),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffC8161D),
                  ),
                  child: Image.asset("assets/images/pencil.png"),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Color(0xffC8161D),
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Color(0xffC8161D),
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(200.0),
                    child: Image.asset(
                      "assets/images/beyeu.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              staff.fullName,
              style: Contanst.nameChooseStaff,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 140, top: 6),
              child: Divider(
                color: Color(0xffC8161D),
                thickness: 1.5,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "General",
                        style: Contanst.titleInfo,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38.withOpacity(0.5),
                            spreadRadius: 1.0,
                            blurRadius: 1.0,
                            offset: Offset(5,7),
                          )
                        ]),
                    child: Column(
                      children: [
                        ShowInfo(
                          title: "Email",
                          data: staff.email,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ShowInfo(
                          title: "Phone",
                          data: staff.phone,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ShowInfo(
                          title: "Gender",
                          data: staff.gender,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ShowInfo(
                          title: "Date of birth",
                          data: staff.dateOfBirth,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ShowInfo(
                          title: "District",
                          data: staff.idAddress.idWard.idDistrict.name,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ShowInfo(
                          title: "Ward",
                          data: staff.idAddress.idWard.name,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
