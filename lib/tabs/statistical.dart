import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:managerdelivery/controllers/staffController.dart';
import 'package:managerdelivery/widget/contanst.dart';


class StatisticalTab extends StatefulWidget {
  //const ListPolicy({Key? key}) : super(key: key);

  @override
  _StatisticalTabState createState() => _StatisticalTabState();
}

class _StatisticalTabState extends State<StatisticalTab> {
  StaffControllers userStaff =Get.find<StaffControllers>();
  bool grossRevenueIsSelected = true;
  bool dataIsSelected = false;

  String profit;
  String deliveryRevenue;
  String salaryAmount;
  String countAllOrder;
  String countOrderSuccess;
  String countOrderFailed;

  Future<String> getGrossRevenue(String idStaff) async {
    final String apiUrl = "http://52.142.43.138:3000/staffs/$idStaff/statistic";
    await http.get(apiUrl).then((response) {
      var data = jsonDecode(response.body);
      //print(response.statusCode);
      if (mounted) {
        setState(() {
          profit=data['profit'].toString();
          deliveryRevenue=data['deliveryRevenue'].toString();
          salaryAmount=data['salaryAmount'].toString();
          countAllOrder=data['countAllOrder'].toString();
          countOrderSuccess=data['countOrderSuccess'].toString();
          countOrderFailed=data['countOrderFailed'].toString();
        });
      }
      return "Donee";
    });
  }
  @override
  void initState() {
    getGrossRevenue(userStaff.staffUser.id).then((value) {if(value=="Donee"){
      print("Loading Done");
    }});
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: Color(0xffC8161D),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 44,left: 24),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(child: const Text("Statistical",style: Contanst.titleTab,))),
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      offset: Offset(0,1.5),
                    )
                  ]
              ),
              child: Column(
                children: [
                  Text("This month",style: Contanst.titleInfo,),
                  Text("1/5/2021-31/5/2021",style: Contanst.noteText,),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 25,
                      margin: const EdgeInsets.only(left: 12),
                      color: Color(0xff3FABAE),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 40,
                        height: 20,
                        color: Color(0xff545454),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                        width: 142.5,
                        child: Text("Profit",style: Contanst.hintText,maxLines: 100,)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 25,
                      color: Color(0xffFF9900),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 40,
                        height: 20,
                        color: Color(0xff545454),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                      width: 142.5,
                        child: Text("Total number of orders delivered",style: Contanst.hintText,maxLines: 100,)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 25,
                      margin: const EdgeInsets.only(left: 12),
                      color: Color(0xffC8161D),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 40,
                        height: 20,
                        color: Color(0xff545454),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                        width: 142.5,
                        child: Text("Total delivery revenue",style: Contanst.hintText,maxLines: 100,)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 25,
                      color: Color(0xff0984FB),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 40,
                        height: 20,
                        color: Color(0xff545454),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                        width: 142.5,
                        child: Text("Number of successfully delivered orders",style: Contanst.hintText,maxLines: 100,)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 25,
                      margin: const EdgeInsets.only(left: 12),
                      color: Color(0xff990099),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 40,
                        height: 20,
                        color: Color(0xff545454),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                        width: 142.5,
                        child: Text("Total salary spent on delivery staff",style: Contanst.hintText,maxLines: 100,)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 25,
                      color: Color(0xff52C4E0),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 40,
                        height: 20,
                        color: Color(0xff545454),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                        width: 142.5,
                        child: Text("Number of failed delivered orders",style: Contanst.hintText,maxLines: 100,)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24,),
            Column(
              children: [
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: 170,
                      height:164,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Color(0xff3FABAE),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(9),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Color(0xff545454),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(profit!=null ? profit : "ProFit",style: Contanst.titleInfo,),
                          SizedBox(height: 6,),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 170,
                      height:164,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Color(0xff0984FB),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(9),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Color(0xff545454),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(countOrderSuccess != null ? countOrderSuccess : "Order Succsess",style: Contanst.titleInfo,),
                          SizedBox(height: 6,),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: 170,
                      height:164,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Color(0xffC8161D),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(9),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Color(0xff545454),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(deliveryRevenue!=null? deliveryRevenue : "Delivery Revenue",style: Contanst.titleInfo,),
                          SizedBox(height: 6,),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 170,
                      height:164,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Color(0xffFF9900),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(9),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Color(0xff545454),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(countAllOrder!=null? countAllOrder : "All Order",style: Contanst.titleInfo,),
                          SizedBox(height: 6,),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: 170,
                      height:164,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Color(0xff990099),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(9),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Color(0xff545454),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(salaryAmount!=null? salaryAmount : "Salary Amount",style: Contanst.titleInfo,),
                          SizedBox(height: 6,),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 170,
                      height:164,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                          Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Color(0xff52C4E0),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(9),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Color(0xff545454),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(countOrderFailed != null ? countOrderFailed : "Order Falied",style: Contanst.titleInfo,),
                          SizedBox(height: 12,),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
