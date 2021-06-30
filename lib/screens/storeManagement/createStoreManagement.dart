import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/address.dart';
import 'package:managerdelivery/class/bank.dart';
import 'package:managerdelivery/class/district.dart';
import 'package:managerdelivery/class/store.dart';
import 'package:managerdelivery/class/ward.dart';
import 'package:managerdelivery/screens/home_page.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/customInputCreate.dart';

class CreateStoreDelivery extends StatefulWidget {
  //const CreateStaffDelivery({Key? key}) : super(key: key);

  @override
  _CreateStoreDeliveryState createState() => _CreateStoreDeliveryState();
}

class _CreateStoreDeliveryState extends State<CreateStoreDelivery> {

  Ward _ward = Get.find<Ward>();
  Address _address = Get.find<Address>();
  District _district = Get.find<District>();
  District dropdownValueDistrict;
  Bank _bank = Get.find<Bank>();
  Bank dropdownValue;
  Store store = Get.find<Store>();
  Ward dropdownValueWard;
  List<Ward> listWard=[];

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
            "Create Store",
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
                child: Text("Please enter your data to register store",
                  style: Contanst.noteTextCreate,
                  textAlign: TextAlign.center,
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
                  store.email=value;
                },
              ),
              CustomInputCreate(
                title: "Passwrod",
                iconImages: "assets/images/password.png",
                hintText: "*******",
                onChange: (value){
                  store.password=value;
                },
              ),
              CustomInputCreate(
                title: "Phone",
                iconImages: "assets/images/phone.png",
                hintText: "09080***",
                onChange: (value){
                  store.phone=value;
                },
              ),
              CustomInputCreate(
                title: "Store Name",
                iconImages: "assets/images/name.png",
                hintText: "KD House's",
                onChange: (value){
                  store.name=value;
                },
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
                              width: 250,
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
                              width: 250,
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
              CustomInputCreate(
                title: "Note Address",
                iconImages: "assets/images/address.png",
                hintText: "ABC Ward 12 District 1",
                onChange: (value){
                  _address.noteAddress=value;
                  _address.fullAddress="NO";
                  store.idAddress=_address;
                },
              ),
              CustomInputCreate(
                title: "Bank Account Name",
                iconImages: "assets/images/gmail.png",
                hintText: "Hoai Nam",
                onChange: (value){
                  store.accountName=value;
                },
              ),
              CustomInputCreate(
                title: "Bank Account Number",
                iconImages: "assets/images/gmail.png",
                hintText: "090909123",
                onChange: (value){
                  store.accountNumber=value;
                },
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 28.0),
                    child: Align(
                      child: Text(
                        "Bank Name",
                        style: Contanst.titleMoreButton,
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
                        Image.asset("assets/images/address.png"),
                        SizedBox(
                          width: 12,
                        ),
                        DropdownButton<Bank>(
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                          iconSize: 24,
                          elevation: 16,
                          style: Contanst.headingShowInfo,
                          underline: Container(
                            margin: const EdgeInsets.only(top: 18),
                            height: 2,
                            color: Colors.transparent,
                          ),
                          onChanged: (Bank newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              store.idBank = newValue;
                            });
                          },
                          hint: Container(
                            width: 250,
                            height: 48,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Bank Name",
                              style: Contanst.hintText,
                            ),
                          ),
                          items: _bank.listAllBank.map((Bank bank) {
                            return DropdownMenuItem<Bank>(
                              value: bank,
                              child: Container(
                                width: 250,
                                child: Text(
                                  bank.name,
                                  style: Contanst.titleMoreButton,
                                  maxLines: 10,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              CustomInputCreate(
                title: "Branch",
                iconImages: "assets/images/gmail.png",
                hintText: "HCM",
                onChange: (value){
                  store.branchBank=value;
                },
              ),
              GestureDetector(
                onTap: (){
                  store.createStore(store).then((value) {print("Done");
                  store.getListStore().then((value) {Get.off(HomePage());});
                  });
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
