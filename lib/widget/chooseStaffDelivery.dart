import 'package:flutter/material.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/widget/contanst.dart';

class ChooseStaffDelivery extends StatelessWidget {
  //const ChooseStaffDelivery({Key? key}) : super(key: key);
  final Staff staff;
  ChooseStaffDelivery({this.staff});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 0),
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
          CircleAvatar(
            radius: 35.0,
            backgroundColor: Color(0xffC8161D),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(200.0),
              child: Image.asset(
                "assets/images/meochoican.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 6,),
          Container(
            width: 135,
              child: Center(child: Text(staff.fullName,style: Contanst.nameChooseStaff,))),
          SizedBox(height: 6,),
          Text(staff.idAddress.idWard.idDistrict.name,style: Contanst.headingShowInfo,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
