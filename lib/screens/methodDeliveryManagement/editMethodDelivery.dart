import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/screens/deliveryStaffManagement/editStaffDelivery.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInfo.dart';

class EditMethodDelivery extends StatelessWidget {
  //const DetailStaffDelivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Edit Method Delivery",
            style: Contanst.titleAppBar,
          ),
        ),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 24,),
              Container(
                height: 150,
                width: 150,
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Information Method Delivery",
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
                          ShowInfo(),
                          SizedBox(
                            height: 15,
                          ),
                          ShowInfo(),
                          SizedBox(
                            height: 15,
                          ),
                          ShowInfo(),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Button(title: "Update",),
          )
        ],
      ),
    );
  }
}
