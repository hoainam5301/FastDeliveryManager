import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/screens/deliveryStaffManagement/detailStaffDelivery.dart';
import 'package:managerdelivery/widget/contanst.dart';

class ShowInfoStaff extends StatelessWidget {
  //const ShowInfoStoreStaff({Key? key}) : super(key: key);
  final Staff staff;
  ShowInfoStaff({this.staff});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 280,
      margin: const EdgeInsets.symmetric(horizontal: 24),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 12,),
              CircleAvatar(
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
              SizedBox(height: 12,),
              Container(
                width: 150,
                  height: 50,
                  child: Text(staff.fullName,style: Contanst.titleInfo,textAlign: TextAlign.center,)),
          //SizedBox(height: 6,),
          Column(
            children: [
              Text(staff.phone,style: Contanst.headingShowInfo,),
              SizedBox(height: 6,),
              GestureDetector(
                onTap: (){
                  Get.to(DetailStaffDelivery(staff:staff));
                },
                child: Container(
                  height: 35,
                  width: 136,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    color: Color(0xffC8161D),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Center(
                    child: Text("View Detail",style: Contanst.viewDetail,),
                  ),
                ),
              ),
              SizedBox(height: 12,),
            ],
          ),
        ],
      ),
    );
  }
}
