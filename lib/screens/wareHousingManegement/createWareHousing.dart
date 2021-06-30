import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/address.dart';
import 'package:managerdelivery/class/district.dart';
import 'package:managerdelivery/class/ward.dart';
import 'package:managerdelivery/class/wareHousing.dart';
import 'package:managerdelivery/screens/home_page.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/customInputCreate.dart';
import 'package:managerdelivery/widget/showInfo.dart';

class CreateWareHousing extends StatefulWidget {
  //const DetailStaffDelivery({Key? key}) : super(key: key);
  @override
  _CreateWareHousingState createState() => _CreateWareHousingState();
}

class _CreateWareHousingState extends State<CreateWareHousing> {
  WareHousing wareHousing = Get.find<WareHousing>();
  Ward _ward = Get.find<Ward>();
  Address _address = Get.find<Address>();
  District _district = Get.find<District>();
  District dropdownValueDistrict;
  Ward dropdownValueWard;
  List<Ward> listWard = [];

  Future<List<Ward>> _getWardList(String idDistrict) async {
    List<Ward> wardlist = [];
    final String apiUrl =
        "http://52.142.43.138:3000/districts/$idDistrict/wards";
    await http.get(apiUrl).then((response) {
      var data = jsonDecode(response.body);

      setState(() {
        var data = jsonDecode(response.body);
        for (var _policy in data) {
          print(Ward.fromJson(_policy).id);
          wardlist.add(Ward.fromJson(_policy));
        }
        listWard = wardlist;
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
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Create Ware Housing",
            style: Contanst.titleAppBar,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Color(0xffC8161D),
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Color(0xffC8161D),
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(24.0),
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
                  height: 64,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "Information Ware Housing",
                      style: Contanst.titleInfo,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38.withOpacity(0.5),
                          spreadRadius: 1.0,
                          blurRadius: 7.0,
                          offset: Offset(5, 7),
                        )
                      ]),
                  child: Column(
                    children: [
                      CustomInputCreate(
                        title: "Name",
                        iconImages: "assets/images/gmail.png",
                        hintText: "Ware Housing Bla",
                        onChange: (value) {
                          wareHousing.name = value;
                        },
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 28.0),
                            child: Align(
                              child: Text(
                                "District",
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
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/address.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  DropdownButton<District>(
                                    value: dropdownValueDistrict,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: 40,
                                    ),
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
                                        _ward.idDistrict = newValue;
                                      });
                                    },
                                    hint: Container(
                                      width: 250,
                                      height: 48,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Text(
                                        "District",
                                        style: Contanst.hintText,
                                      ),
                                    ),
                                    items: _district.listAllDistrict
                                        .map((District district) {
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 28.0),
                            child: Align(
                              child: Text(
                                "Ward",
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
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/address.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  DropdownButton<Ward>(
                                    value: dropdownValueWard,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: 40,
                                    ),
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
                                        _address.idWard = newValue;
                                        //wareHousing.idAddress.idWard=newValue;
                                      });
                                    },
                                    hint: Container(
                                      width: 250,
                                      height: 48,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 12),
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
                        iconImages: "assets/images/gmail.png",
                        hintText: "Ware Housing Bla",
                        onChange: (value) {
                          _address.noteAddress = value;
                          wareHousing.idAddress = _address;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                wareHousing.createWareHousing(wareHousing).then((value) {
                  Get.off(HomePage());
                  //print("Done");
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Button(
                  title: "Create",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
