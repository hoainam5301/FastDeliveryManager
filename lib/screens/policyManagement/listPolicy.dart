import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/commission.dart';
import 'package:managerdelivery/screens/policyManagement/createPolicy.dart';
import 'package:managerdelivery/screens/policyManagement/editPolicy.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInfoPolicy.dart';

class ListPolicy extends StatefulWidget {
  //const ListPolicy({Key? key}) : super(key: key);

  @override
  _ListPolicyState createState() => _ListPolicyState();
}

class _ListPolicyState extends State<ListPolicy> {
  bool staffIsSelected = true;
  bool storeIsSelected = false;

  Commission _commission= Get.find<Commission>();

  List<Widget> buildPolicyStore() {
    List<Widget> listinfo = [];
    _commission.listAllCommissionStore.forEach((element) {
      listinfo.add(GestureDetector(
        onTap: (){
          Get.to(EditPolicy(commission: element,storeIsSelected: true,staffIsSelected: false,));
        },
        child: ShowInfoPolicy(
          commission: element,
        ),
      ));
    });
    return listinfo;
  }
  List<Widget> buildPolicyStaff() {
    List<Widget> listinfo = [];
    _commission.listAllCommissionStaff.forEach((element) {
      listinfo.add(GestureDetector(
        onTap: (){
          Get.to(EditPolicy(commission: element,storeIsSelected: false,staffIsSelected: true,));
        },
        child: ShowInfoPolicy(
          commission: element,
        ),
      ));
    });
    return listinfo;
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffFEFEFE),
        appBar: AppBar(
          backgroundColor: Color(0xffC8161D),
          title: Padding(
            padding: const EdgeInsets.only(left: 95),
            child: Text("Policy",style: Contanst.titleAppBar,),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 12,),
            TabBar(
              onTap: (index){
                if(index==0)
                  {
                    setState(() {
                      staffIsSelected=true;
                      storeIsSelected=false;
                    });
                  }
                else if(index==1)
                  {
                    setState(() {
                      staffIsSelected=false;
                      storeIsSelected=true;
                    });
                  }
              },
              indicatorColor: Colors.transparent,
              labelColor: Color(0xffC8161D),
              tabs: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(36.0),
                        border: Border.all(
                          color: staffIsSelected == true ? Color(0xffC8161D) : Colors.black,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 6),
                      child:  Text("Staff",style:TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          color: staffIsSelected == true ? Color(0xffC8161D) : Colors.black,
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
                          color: storeIsSelected == true ? Color(0xffC8161D) : Colors.black,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 6),
                      child: Text("Store",style:TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                          color: storeIsSelected == true ? Color(0xffC8161D) : Colors.black,
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
                thickness: 1.5,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children:buildPolicyStaff(),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: buildPolicyStore(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: FloatingActionButton(
            backgroundColor: Color(0xffC8161D),
            child: Icon(
              Icons.add,
              size: 48.0,
            ),
            onPressed: () {
              if(storeIsSelected){
              Get.to(CreatePolicy(staffIsSelected: false,storeIsSelected: true,));
              }
              else if(staffIsSelected)
                {
                  Get.to(CreatePolicy(staffIsSelected: true,storeIsSelected: false,));
                }
            },
          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniEndDocked,
      ),
    );
  }
}
