import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/commission.dart';
import 'package:managerdelivery/screens/policyManagement/listPolicy.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/editInfo.dart';
import 'package:managerdelivery/widget/showInfo.dart';

class EditPolicy extends StatefulWidget {
  //const CreatePolicy({Key? key}) : super(key: key);
  final Commission commission;
  final bool staffIsSelected;
  final bool storeIsSelected;
  EditPolicy({this.commission,this.storeIsSelected,this.staffIsSelected});
  @override
  _EditPolicyState createState() => _EditPolicyState();
}

class _EditPolicyState extends State<EditPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("Edit Policy",style: Contanst.titleAppBar,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36.0),
                          border: Border.all(
                            color:widget.staffIsSelected == true ? Color(0xffC8161D) : Colors.black,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 6),
                        child:  Text("Staff",style:TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                            color:widget.staffIsSelected == true ? Color(0xffC8161D) : Colors.black,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none
                        ),
                        ),
                      )
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36.0),
                          border: Border.all(
                            color:widget.storeIsSelected == true ? Color(0xffC8161D) : Colors.black,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 6),
                        child: Text("Store",style:TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w700,
                            color:widget.storeIsSelected == true ? Color(0xffC8161D) : Colors.black,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none
                        ),
                        ),
                      )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Divider(
                  color: Colors.black,
                  thickness: 1.2,
                ),
              ),
              Container(
                height: 100,
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
                        "assets/images/meochoican.png",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
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
                      margin: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38.withOpacity(0.5),
                              spreadRadius: 1.0,
                              blurRadius: 7.0,
                              offset: Offset(5,7),
                            )
                          ]),
                      child: Column(
                        children: [
                          EditInfo(
                            titleInfor: "Name",
                            infomation: widget.commission.name,
                            onChange: (value){
                              widget.commission.name=value;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          EditInfo(
                            titleInfor: "Min Order Per Month",
                            infomation: widget.commission.orderPerMonthMin,
                            onChange: (value){
                              widget.commission.orderPerMonthMin=value;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          EditInfo(
                            titleInfor: "Max Order Per Month ",
                            infomation: widget.commission.orderPerMonthMax,
                            onChange: (value){
                              widget.commission.orderPerMonthMax=value;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          EditInfo(
                            titleInfor: "Ratio",
                            infomation: widget.commission.ratioCommission,
                            onChange: (value){
                              widget.commission.ratioCommission=value;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                  "Note",
                                  style: Contanst.headingShowInfo,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 18),
                                    height: 10.0,
                                    width: 10.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    )
                                ),
                                SizedBox(width: 6,),
                                Container(
                                  width: 300,
                                  height: 100,
                                  child: TextField(
                                    maxLines: 100,
                                    onChanged: (value){
                                      widget.commission.note=value;
                                    },
                                    controller: TextEditingController()..text=widget.commission.note,
                                    style: Contanst.titleTextFiled,
                                    //onChanged:onChange ,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 24,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  if(widget.storeIsSelected){
                  widget.commission.updateCommissionStore(widget.commission.id, widget.commission).then((value) {print(value);
                    Get.to(ListPolicy());
                  });}
                  else if(widget.staffIsSelected)
                    {
                      widget.commission.updateCommissionStaff(widget.commission.id, widget.commission).then((value) {print(value);
                      Get.to(ListPolicy());
                      });
                    }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Button(title: "Update",),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
