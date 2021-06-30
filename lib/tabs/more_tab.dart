import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/commission.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/class/store.dart';
import 'package:managerdelivery/class/wareHousing.dart';
import 'package:managerdelivery/screens/deliveryStaffManagement/listStaffDelivery.dart';
import 'package:managerdelivery/screens/methodDeliveryManagement/listMethodDelivery.dart';
import 'package:managerdelivery/screens/policyManagement/listPolicy.dart';
import 'package:managerdelivery/screens/priceDeliveryManagement/managerPrice.dart';
import 'package:managerdelivery/screens/profile/profile.dart';
import 'package:managerdelivery/screens/storeManagement/listStoreManegement.dart';
import 'package:managerdelivery/screens/wareHousingManegement/listWareHousing.dart';
import 'package:managerdelivery/widget/contanst.dart';

class MoreTab extends StatelessWidget {
  //const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(111.0),
        child: AppBar(
          backgroundColor: Color(0xffC8161D),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 44,left: 24),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(child: const Text("More",style: Contanst.titleTab,))),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(Profile());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius:35.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          "assets/images/beyeu.png",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.put(Staff());
                    Staff staff = Get.find<Staff>();
                    staff.getListStaff().then((value) {Get.to(ListStaffDelivery());});
                  },
                  child: Container(
                    height: 150,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color:Colors.black.withOpacity(0.5),
                            spreadRadius:1.0,
                            blurRadius:10.0,
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Image.asset("assets/images/management.png"),
                        SizedBox(height: 12,),
                        Text("Delivery Staff Management",style:Contanst.titleMoreButton,textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.put(Store());
                    Store store = Get.find<Store>();
                    store.getListStore().then((value) {Get.to(ListStoreDelivery());});
                  },
                  child: Container(
                    height: 150,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color:Colors.black.withOpacity(0.5),
                            spreadRadius:1.0,
                            blurRadius:10.0,
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Image.asset("assets/images/store.png"),
                        SizedBox(height: 12,),
                        Text("Store Management",style:Contanst.titleMoreButton,textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.put(WareHousing());
                    WareHousing wareHuosing = Get.find<WareHousing>();
                    wareHuosing.getListWareHousing().then((value) {Get.to(ListWareHousing());});
                  },
                  child: Container(
                    height: 150,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color:Colors.black.withOpacity(0.5),
                            spreadRadius:1.0,
                            blurRadius:10.0,
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Image.asset("assets/images/warehouse.png"),
                        SizedBox(height: 12,),
                        Text("Ware Housing Management",style:Contanst.titleMoreButton,textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.put(Staff());
                    Staff staff = Get.find<Staff>();
                    staff.getListAllNewStaff().then((value) {Get.to(ListMethodDelivery());});
                  },
                  child: Container(
                    height: 150,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color:Colors.black.withOpacity(0.5),
                            spreadRadius:1.0,
                            blurRadius:10.0,
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Image.asset("assets/images/method.png"),
                        SizedBox(height: 12,),
                        Text("Infomation Sign Up",style:Contanst.titleMoreButton,textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(ManagerPrice());
                  },
                  child: Container(
                    height: 150,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color:Colors.black.withOpacity(0.5),
                            spreadRadius:1.0,
                            blurRadius:10.0,
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Image.asset("assets/images/pricer.png"),
                        SizedBox(height: 12,),
                        Text("Delivery Method",style:Contanst.titleMoreButton,textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.put(Commission());
                    Commission commission = Get.find<Commission>();
                    commission.getListCommissionStaff().then((value) {print("Done Staff");});
                    commission.getListCommissionStore().then((value) {Get.to(ListPolicy());});
                  },
                  child: Container(
                    height: 150,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(12),
                        boxShadow:[
                          BoxShadow(
                            color:Colors.black.withOpacity(0.5),
                            spreadRadius:1.0,
                            blurRadius:10.0,
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Image.asset("assets/images/policy.png"),
                        SizedBox(height: 12,),
                        Text("Policy Management",style:Contanst.titleMoreButton,textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
