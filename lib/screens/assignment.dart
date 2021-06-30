import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/orders.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/screens/home_page.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/chooseStaffDelivery.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInfo.dart';


class Assignment extends StatefulWidget {
  //const Assignment({Key? key}) : super(key: key);
  //final Staff staff;
  final Orders orders;
  Assignment({this.orders});

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  Staff _staff= Get.find<Staff>();
  Orders _orders =Get.find<Orders>();

  String idStaffhaveChoose;

  List<Widget>
 buildStaff() {
    List<Widget> listinfo = [];
    _staff.listAllStaff.forEach((element) {
      listinfo.add(GestureDetector(
        onTap: (){
          setState(() {
            idStaffhaveChoose=element.id;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(12),
              color:idStaffhaveChoose==element.id ? Colors.red : Colors.transparent,
            
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ChooseStaffDelivery(
              staff: element,
            ),
          ),
        ),
      ));
    });
    return listinfo;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar:
        AppBar(
          backgroundColor: Color(0xffC8161D),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:2,left: 12),
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(child: const Text("Assignment",style: Contanst.titleAppBar,))),
                ),
              ],
            ),
          ),
        ),
      body:SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(height: 25,),
              Align(
                alignment: Alignment.topLeft,
                child:Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Information order",style: Contanst.titleInfo,),
                ) ,
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 24)/*only(left: 12,right: 12,top:36)*/,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            offset:Offset(4,6)
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        ShowInfo(
                          title: "Name Order",
                          data: widget.orders.orderName,
                        ),
                        ShowInfo(
                          title:"District Order",
                          data: widget.orders.receiverIDAddress.fullAddress,
                        ),
                        ShowInfo(
                          title: "Reciever Name",
                          data: widget.orders.receiverName,
                        ),
                        SizedBox(height: 6,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 225),
                    child: Container(
                      width: 125,
                      height: 75,
                      margin: const EdgeInsets.only(left: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          "assets/images/meochoican.png",
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child:Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Select staff delivery",style: Contanst.titleInfo,),
                ) ,
              ),
              SizedBox(height: 24,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7,
                            offset:Offset(4,6)
                        )
                      ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row (
                      children: buildStaff(),
                    ),
                  ),
                )
              ),
              SizedBox(height: 36,),
              GestureDetector(
                onTap: (){
                  //print(widget.orders.id);
                  //print(chooseStaffIndex);
                  print(idStaffhaveChoose);
                  widget.orders.updateAssignment(widget.orders.id,idStaffhaveChoose).then((value) {print(idStaffhaveChoose);
                  _orders.getHandling().then((value) {print("Done");});
                  _orders.getListOrders().then((value) {print("Done");
                  Get.off(HomePage());
                  });
                  });
                },
                child: Button(
                  title: "Assignment",
                ),
              ),
              SizedBox(height: 36,),
            ],
          ),
      ),
    );
  }
}
