import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/orders.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInforOrder.dart';

class HomeTab extends StatelessWidget {
  //const HomeTabs({Key? key}) : super(key: key);
  Orders _orders= Get.find<Orders>();

  List<Widget> buildOrder() {
    List<Widget> listinfo = [];
    _orders.listAllOrder.forEach((element) {
      listinfo.add(ShowInforOrder(
        orders: element,
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
                      child: Container(child: const Text("Home",style: Contanst.titleTab,))),
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
              children: buildOrder(),
            )
          ],
        ),
      ),
    );
  }
}
