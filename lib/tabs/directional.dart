import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/orders.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/screens/assignment.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInforOrderNone.dart';

class DirectionalTab extends StatelessWidget {
  //const Directional({Key? key}) : super(key: key);
  Orders _orders= Get.find<Orders>();
  Staff _staff=Get.find<Staff>();
  List<Widget> buildOrderHandling() {
    List<Widget> listinfo = [];
    _orders.listAllOrderToHandling.forEach((element) {
      listinfo.add(GestureDetector(
        onTap: (){
          _staff.getListStaff().then((value) { Get.to(Assignment(orders: element,));});
        },
        child: ShowInforOrderNone(
          orders: element,
        ),
      ));
    });
    return listinfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: Color(0xffC8161D),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 44,left: 24),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(child: const Text("Directional",style: Contanst.titleTab,))),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
              height: 42,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(36.0),
                  border: Border.all(
                    color: Color(0xffC8161D),
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
              children: buildOrderHandling(),
            )
          ],
        ),
      ),
    );
  }
}
