import 'package:flutter/material.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/showInfo.dart';

class EditPrice extends StatelessWidget {
  //const DetailPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Text(
            "Edit Price",
            style: Contanst.titleAppBar,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                //Get.to(EditMethodDelivery());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 6, left: 350),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffC8161D),
                  ),
                  child: Image.asset("assets/images/pencil.png"),
                ),
              ),
            ),
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
              height: 48,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "Information Detail Price",
                        style: Contanst.titleInfo,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    margin: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38.withOpacity(0.5),
                            spreadRadius: 1.0,
                            blurRadius: 10.0,
                            offset: Offset(5,7),
                          )
                        ]),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text("Name Order",
                                    style:Contanst.noteText,)
                              )
                          ),
                          SizedBox(height: 12,),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text("The champion of XL HLPhap",style: Contanst.regularTextInfo,)
                              )
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Text("Note",
                                    style:Contanst.noteText,)
                              )
                          ),
                          SizedBox(height: 12,),
                          Row(
                            children: [
                              Container(
                                  height: 10.0,
                                  width: 10.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  )
                              ),
                              SizedBox(width: 6,),
                              Text("23.000 VNĐ / 3Kg",style: Contanst.notePrice,)
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
                            children: [
                              Container(
                                  height: 10.0,
                                  width: 10.0,
                                  decoration: new BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  )
                              ),
                              SizedBox(width: 6,),
                              Text("0.5Kg tiếp theo  + 3000VNĐ",style: Contanst.titleTextFiled,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24,),
            Button(title: "Update",)
          ],
        ),
      ),
    );
  }
}
