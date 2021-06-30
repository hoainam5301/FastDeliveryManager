import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/district.dart';
import 'package:managerdelivery/class/ward.dart';
import 'package:managerdelivery/controllers/staffController.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/editInfo.dart';
import 'package:managerdelivery/widget/showInfo.dart';

class EditProfile extends StatefulWidget {
  //const Profile({Key? key}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  StaffControllers userStaff = Get.find<StaffControllers>();

  District _district = Get.find<District>();

  Ward _ward = Get.find<Ward>();

  District dropdownValueDistrict;

  Ward dropdownValueWard;

  List<Ward> listWard=[];

  Future<List<Ward>> _getWardList(String idDistrict) async {
    List<Ward> wardlist=[];
    final String apiUrl = "http://52.142.43.138:3000/districts/$idDistrict/wards";
    await http.get(apiUrl).then((response) {
      setState(() {
        var data=jsonDecode(response.body);
        //print(data);
        for (var _policy in data){
          print(Ward.fromJson(_policy).id);
          wardlist.add(Ward.fromJson(_policy));
        }
        listWard=wardlist;
      });
    });
    return listWard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Text("Edit Profile",style: Contanst.titleAppBar,),
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
                      /*Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Kieu Diem",
                            style: Contanst.titleInfo,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "036789789",
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
                            "kieudiem2211@gmail.com",
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
                            "Femal",
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
                            "22/11/2000",
                            style: Contanst.noteText,
                          ),
                        ),
                      ),
                      Divider(
                        color: Color(0xff808080),
                        height: 5.0,
                      ),
                      SizedBox(height: 12,),*/
                      EditInfo(
                        titleInfor: "Name",
                        infomation: userStaff.staffUser.fullName,
                      ),
                      EditInfo(
                        titleInfor: "Phone",
                        infomation: userStaff.staffUser.phone,
                      ),
                      EditInfo(
                        titleInfor: "Email",
                        infomation: userStaff.staffUser.email,
                      ),
                      EditInfo(
                        titleInfor: "Gender",
                        infomation: userStaff.staffUser.gender,
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 28.0),
                          child: Align(
                            child: Text("District",style: Contanst.headingShowInfo,),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          child:Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                            child: DropdownButton<District>(
                              value: dropdownValueDistrict,
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                              iconSize: 24,
                              elevation: 16,
                              style: Contanst.headingShowInfo,
                              underline: Container(
                                margin: const EdgeInsets.only(top: 18),
                                height: 2,
                                color: Colors.grey,
                              ),
                              onChanged: (District newValue) {
                                setState(() {
                                  dropdownValueWard=null;
                                  dropdownValueDistrict = newValue;
                                  _getWardList(newValue.id).then((value) {print("done"); print(listWard.length);
                                  });
                                  _ward.idDistrict=newValue;
                                });
                              },
                              hint: Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                width: 250,
                                height: 48,
                                child: Text(
                                  "District",
                                  style: Contanst.hintText,
                                ),
                              ),
                              items: _district.listAllDistrict.map((District district) {
                                return DropdownMenuItem<District>(
                                  value: district,
                                  child: Text(
                                    district.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 24.0),
                          child: Align(
                            child: Text("Ward",style: Contanst.headingShowInfo,),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: DropdownButton<Ward>(
                              value: dropdownValueWard,
                              icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                              iconSize: 24,
                              elevation: 16,
                              style: Contanst.headingShowInfo,
                              underline: Container(
                                margin: const EdgeInsets.only(top: 18),
                                height: 2,
                                color: Colors.grey,
                              ),
                              onChanged: (Ward newValue) {
                                setState(() {
                                  dropdownValueWard = newValue;
                                  //widget.staff.idAddress.idWard=newValue;
                                });
                              },
                              hint: Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                width: 250,
                                height: 48,
                                child: Text(
                                  "Ward",
                                  style: Contanst.hintText,
                                ),
                              ),
                              items: listWard.map((Ward ward) {
                                return DropdownMenuItem<Ward>(
                                  value: ward,
                                  child: Text(
                                    ward.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
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
                    EditInfo(
                      titleInfor: "Password",
                      infomation: userStaff.staffUser.password,
                    ),
                    SizedBox(height: 12,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Button(title: "Update",),
              )
            ],
          ),
        ),
      ),
    );
  }
}
