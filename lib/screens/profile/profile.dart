import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/controllers/staffController.dart';
import 'package:managerdelivery/screens/profile/editProfile.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInfo.dart';

class Profile extends StatelessWidget {
  //const Profile({Key? key}) : super(key: key);
  StaffControllers userStaff = Get.find<StaffControllers>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Text("My Profile",style: Contanst.titleAppBar,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(height: 12,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  GestureDetector(
                    onTap: (){
                      Get.to(EditProfile());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
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
                ],
              ),
              SizedBox(height:12.0),
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
                margin: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.circular(6),
                    boxShadow:[
                      BoxShadow(
                        color:Colors.black.withOpacity(0.5),
                        spreadRadius:1.0,
                        blurRadius:10.0,
                      )
                    ]
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            userStaff.staffUser.fullName,
                            style: Contanst.titleInfo,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            userStaff.staffUser.phone,
                            style: Contanst.noteText,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xff808080),
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            userStaff.staffUser.email,
                            style: Contanst.noteText,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xff808080),
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            userStaff.staffUser.gender,
                            style: Contanst.noteText,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xff808080),
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            userStaff.staffUser.dateOfBirth,
                            style: Contanst.noteText,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xff808080),
                        height: 5.0,
                      ),
                      SizedBox(height: 12,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Information addresss",
                    style: Contanst.titleInfo,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.circular(6),
                    boxShadow:[
                      BoxShadow(
                        color:Colors.black.withOpacity(0.5),
                        spreadRadius:1.0,
                        blurRadius:1.0,
                      )
                    ]
                ),
                child: Column(
                  children: [
                    ShowInfo(
                      data: "District",
                      title: userStaff.staffUser.idAddress.idWard.idDistrict.name,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ShowInfo(
                      title:"Ward",
                      data:userStaff.staffUser.idAddress.idWard.name,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Information Account",
                    style: Contanst.titleInfo,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.circular(6),
                    boxShadow:[
                      BoxShadow(
                        color:Colors.black.withOpacity(0.5),
                        spreadRadius:1.0,
                        blurRadius:1.0,
                      )
                    ]
                ),
                child: Column(
                  children: [
                    ShowInfo(
                      title: "Password",
                      data: userStaff.staffUser.password,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
