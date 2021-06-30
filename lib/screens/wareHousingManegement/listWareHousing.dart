import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/wareHousing.dart';
import 'package:managerdelivery/screens/wareHousingManegement/createWareHousing.dart';
import 'package:managerdelivery/screens/wareHousingManegement/detailWareHousing.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInfoWareHousing.dart';

class ListWareHousing extends StatelessWidget {
  //const ListStaffDelivery({Key? key}) : super(key: key);
  WareHousing _wareHousing= Get.find<WareHousing>();

  List<Widget> buildWareHousing() {
    List<Widget> listinfo = [];
    _wareHousing.listAllWareHousing.forEach((element) {
      listinfo.add(GestureDetector(
        onTap: (){
          Get.to(DetailWareHousing(wareHousing: element,));
        },
        child: ShowInfoWareHousing(
          wareHousing: element,
        ),
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
          padding: const EdgeInsets.only(left: 50),
          child: Text("Ware Housing",style: Contanst.titleAppBar,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                children: buildWareHousing(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xffC8161D),
          child: Icon(
            Icons.add,
            size: 48.0,
          ),
          onPressed: () {
            Get.to(CreateWareHousing());
          },
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
