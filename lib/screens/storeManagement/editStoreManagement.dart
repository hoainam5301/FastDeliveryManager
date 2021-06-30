import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/district.dart';
import 'package:managerdelivery/class/store.dart';
import 'package:managerdelivery/class/ward.dart';
import 'package:managerdelivery/screens/home_page.dart';
import 'package:managerdelivery/screens/storeManagement/listStoreManegement.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/editInfo.dart';
import 'package:managerdelivery/widget/showInfo.dart';

class EditStoreDelivery extends StatefulWidget {
  //const DetailStaffDelivery({Key? key}) : super(key: key);
  final Store store;
  EditStoreDelivery({this.store});

  @override
  _EditStoreDeliveryState createState() => _EditStoreDeliveryState();
}

class _EditStoreDeliveryState extends State<EditStoreDelivery> {
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
          padding: const EdgeInsets.only(right: 36),
          child: Center(
            child: Text(
                "Edit  Store",
                style: Contanst.titleAppBar,
              textAlign: TextAlign.justify,
              ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
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
              widget.store.name,
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
                        EditInfo(
                          titleInfor: "Email",
                          infomation: widget.store.email,
                          onChange: (value){
                            widget.store.email=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        EditInfo(
                          titleInfor: "Phone",
                          infomation: widget.store.phone,
                          onChange: (value){
                            widget.store.phone=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        EditInfo(
                          titleInfor: "Bank Name",
                          infomation: widget.store.accountName,
                          onChange: (value){
                            widget.store.accountName=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        EditInfo(
                          titleInfor: "Bank Account Number",
                          infomation: widget.store.accountNumber,
                          onChange: (value){
                            widget.store.accountNumber=value;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 28.0),
                                    child: Align(
                                      child: Text("District",style: Contanst.titleInfo,),
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
                                          width: 250,
                                          height: 48,
                                          margin: const EdgeInsets.symmetric(vertical: 6),
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
                                            widget.store.idAddress.idWard=newValue;
                                          });
                                        },
                                        hint: Container(
                                          width: 250,
                                          height: 48,
                                          margin: const EdgeInsets.symmetric(vertical: 6),
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
                            ],
                          ),
                        ),
                        EditInfo(
                          titleInfor: "Note Address",
                          infomation: widget.store.idAddress.noteAddress,
                          onChange: (value){
                            widget.store.idAddress.noteAddress=value;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                widget.store.updateStore(widget.store.id, widget.store).then((value) {
                  //print(value);
                  Get.off(HomePage());
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Button(title: "Update",),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
