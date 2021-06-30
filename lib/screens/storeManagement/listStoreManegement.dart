import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/store.dart';
import 'package:managerdelivery/screens/storeManagement/createStoreManagement.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInforStore.dart';

class ListStoreDelivery extends StatelessWidget {
  //const ListStaffDelivery({Key? key}) : super(key: key);
  Store _store= Get.find<Store>();

  List<Widget> buildStore() {
    List<Widget> listinfo = [];
    _store.listAllStore.forEach((element) {
      listinfo.add(ShowInfoStore(
        store: element,
      ));
    });
    return listinfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text("Store",style: Contanst.titleAppBar,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12.0),
                height: 42,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36.0),
                    border: Border.all(
                      color: Color(0xffC8161D),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    style: Contanst.titleTextFiled,
                    decoration: InputDecoration(
                      icon: Image.asset(
                        "assets/images/search.png",
                        width: 25,
                        height: 25,
                      ),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: Contanst.hintText,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  controller: new ScrollController(keepScrollOffset: false),
                  childAspectRatio: 0.80,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 25.0,
                  crossAxisSpacing: 5.0,
                  children: buildStore(),
              ),
              SizedBox(height: 64,),
            ],
          ),
        ),
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

            Get.to(CreateStoreDelivery());
          },
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniEndDocked,
    );
  }
}
