import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/address.dart';
import 'package:managerdelivery/class/district.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/class/staffType.dart';
import 'package:managerdelivery/class/ward.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:managerdelivery/screens/home_page.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/customInput.dart';
import 'package:managerdelivery/widget/customInputCreate.dart';

class CreateStaffDelivery extends StatefulWidget {
  //const CreateStaffDelivery({Key? key}) : super(key: key);

  @override
  _CreateStaffDeliveryState createState() => _CreateStaffDeliveryState();
}

class _CreateStaffDeliveryState extends State<CreateStaffDelivery> {

  Staff staff =Get.find<Staff>();
  District _district = Get.find<District>();
  StaffType _staffType= Get.find<StaffType>();
  Ward _ward = Get.find<Ward>();
  Address _address = Get.find<Address>();
  District dropdownValueDistrict;
  Ward dropdownValueWard;
  StaffType dropdownValueStaffType;
  List<Ward> listWard=[];

  String dateformat="Date Of Birth";

  Future<List<Ward>> _getWardList(String idDistrict) async {
    List<Ward> wardlist=[];
    final String apiUrl = "http://52.142.43.138:3000/districts/$idDistrict/wards";
    await http.get(apiUrl).then((response) {
      var data = jsonDecode(response.body);

      setState(() {
        var data=jsonDecode(response.body);
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
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "Create Staff",
            style: Contanst.titleAppBar,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 48,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Text("Please enter your data to register staff delivery",
                  style: Contanst.noteTextCreate,
                  textAlign:TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 48),
                child: Divider(
                  color: Color(0xffC8161D),
                  thickness: 1.5,
                ),
              ),
              CustomInputCreate(
                title: "E-mail",
                iconImages: "assets/images/gmail.png",
                hintText: "mail@gmail.com",
                onChange: (value){
                  staff.email=value;
                },
              ),
              CustomInputCreate(
                title: "Passwrod",
                iconImages: "assets/images/password.png",
                hintText: "*******",
                onChange: (value){
                  staff.password=value;
                },
              ),
              CustomInputCreate(
                title: "Full Name",
                iconImages: "assets/images/name.png",
                hintText: "mail@gmail.com",
                onChange: (value){
                  staff.fullName=value;
                },
              ),
              CustomInputCreate(
                title: "Phone",
                iconImages: "assets/images/phone.png",
                hintText: "mail@gmail.com",
                onChange: (value){
                  staff.phone=value;
                },
              ),
              CustomInputCreate(
                title: "Gender",
                iconImages: "assets/images/gender.png",
                hintText: "mail@gmail.com",
                onChange: (value){
                  staff.gender=value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 5.0),
                      child: Align(
                        child: Text("Date Of Birth",style: Contanst.headingShowInfo,),
                        alignment: Alignment.topLeft,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 7,
                              offset: Offset(0, 7),
                            )
                          ]
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset("assets/images/dateofbirth.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:0 ,),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  child: Text(dateformat,style: Contanst.hintText,),
                                  onPressed: (){
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime(1900, 3, 5),
                                        maxTime: DateTime.now(),
                                        onChanged: (date) {
                                          setState(() {
                                            dateformat="${date.day}/${date.month}/${date.year}";
                                          });
                                        },
                                        onConfirm: (date) {
                                          staff.dateOfBirth="${date.day}/${date.month}/${date.year}";
                                        },
                                        currentTime: DateTime.now(), locale: LocaleType.en);
                                  },
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            blurRadius: 7,
                            offset: Offset(0, 7),
                          )
                        ]
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 6),
                      child: Row(
                        children: [
                          Image.asset("assets/images/address.png"),
                          SizedBox(width: 12,),
                          DropdownButton<District>(
                            value: dropdownValueDistrict,
                            icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                            iconSize: 24,
                            elevation: 16,
                            style: Contanst.headingShowInfo,
                            underline: Container(
                              margin: const EdgeInsets.only(top: 18),
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (District newValue) {
                              setState(() {
                                dropdownValueWard=null;
                                dropdownValueDistrict = newValue;
                                // _ward.getListWard(newValue.id).then((value) => print(_ward.listAllWard.length));
                                _getWardList(newValue.id);
                                _ward.idDistrict=newValue;
                              });
                            },
                            hint: Container(
                              width: 240,
                              height: 48,
                              margin: const EdgeInsets.symmetric(vertical: 12),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 28.0),
                    child: Align(
                      child: Text("Ward",style: Contanst.headingShowInfo,),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            blurRadius: 7,
                            offset: Offset(0, 7),
                          )
                        ]
                    ),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 6),
                      child: Row(
                        children: [
                          Image.asset("assets/images/address.png"),
                          SizedBox(width: 12,),
                          DropdownButton<Ward>(
                            value: dropdownValueWard,
                            icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                            iconSize: 24,
                            elevation: 16,
                            style: Contanst.headingShowInfo,
                            underline: Container(
                              margin: const EdgeInsets.only(top: 18),
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (Ward newValue) {
                              setState(() {
                                dropdownValueWard = newValue;
                                _address.idWard=newValue;
                              });
                            },
                            hint: Container(
                              width: 240,
                              height: 48,
                              margin: const EdgeInsets.symmetric(vertical: 12),
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
                                  style:TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomInputCreate(
                title: "Note Address",
                iconImages: "assets/images/address.png",
                hintText: "mail@gmail.com",
                onChange: (value){
                  _address.fullAddress=value;
                  _address.noteAddress=value;
                },
              ),
              CustomInputCreate(
                title: "ID Number",
                iconImages: "assets/images/idnumber.png",
                hintText: "",
                onChange: (value){
                  staff.idNumber=value;
                },
              ),
              CustomInputCreate(
                title: "Basic Salary",
                iconImages: "assets/images/salary.png",
                hintText: "mail@gmail.com",
                onChange: (value){
                  staff.basicSalary=value;
                  staff.actualSalary=value;
                },
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 28.0),
                    child: Align(
                      child: Text(
                        "Staff Type",
                        style: Contanst.headingShowInfo,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            blurRadius: 7,
                            offset: Offset(0, 7),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      child: Row(children: [
                        Image.asset("assets/images/staff.png"),
                        SizedBox(
                          width: 12,
                        ),
                        DropdownButton<StaffType>(
                          value: dropdownValueStaffType,
                          icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                          iconSize: 24,
                          elevation: 16,
                          style: Contanst.headingShowInfo,
                          underline: Container(
                            margin: const EdgeInsets.only(top: 18),
                            height: 2,
                            color: Colors.transparent,
                          ),
                          onChanged: (StaffType newValue) {
                            setState(() {
                              dropdownValueStaffType = newValue;
                              staff.idStaffType=newValue;
                              staff.idAddress=_address;
                            });
                          },
                          hint: Container(
                            width: 240,
                            height: 48,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Staff Type",
                              style: Contanst.hintText,
                            ),
                          ),
                          items: _staffType.listAllStaffType.map((StaffType staffType) {
                            return DropdownMenuItem<StaffType>(
                              value: staffType,
                              child: Text(
                                staffType.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  //print(staff.idAddress.fullAddress);
                  //print(staff.idStaffType.id);
                  //print(staff.idStaffType.name);
                  //print(staff.dateOfBirth);
                  //print(staff.phone);
                  //print(staff.fullName);
                  staff.createStaff(staff);
                  staff.getListStaff().then((value) {Get.off(HomePage());});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Button(title: "Create",),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
