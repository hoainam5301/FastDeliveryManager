import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/screens/priceDeliveryManagement/detailPrice.dart';
import 'package:managerdelivery/widget/contanst.dart';

class ManagerPrice extends StatelessWidget {
  //const ManagerPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEFEFE),
      appBar: AppBar(
        backgroundColor: Color(0xffC8161D),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("Delivery Method",style: Contanst.titleAppBar,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(height: 24,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Inner District",
                    style: Contanst.nameChooseStaff,
                  ),
                ),
              ),
              Container(
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
                    ]
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(DetailPrice());
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                            height:50,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38.withOpacity(0.5),
                                    spreadRadius: 1.0,
                                    blurRadius: 1.0,
                                    offset: Offset(5,7),
                                  )
                                ]
                            ),
                            child: Center(
                              child:Text("Fast",style: Contanst.textInButton,) ,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text("30.000 VNĐ/3Kg",style: Contanst.notePrice,textAlign: TextAlign.left,),
                              SizedBox(height: 6,),
                              Text("0.5Kg tiếp theo\n3000VNĐ",style: Contanst.titleTextFiled,)
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                          height:50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38.withOpacity(0.5),
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                  offset: Offset(5,7),
                                )
                              ]
                          ),
                          child: Center(
                            child: Text("Normal",style: Contanst.textInButton,),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text("23.000 VNĐ/3Kg",style: Contanst.notePrice,textAlign: TextAlign.left,),
                              SizedBox(height: 6,),
                              Text("0.5Kg tiếp theo\n3000VNĐ",style: Contanst.titleTextFiled,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Outner District",
                    style: Contanst.nameChooseStaff,
                  ),
                ),
              ),
              Container(
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
                    ]
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                          height:50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38.withOpacity(0.5),
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                  offset: Offset(5,7),
                                )
                              ]
                          ),
                          child: Center(
                            child:Text("Fast",style: Contanst.textInButton,) ,
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text("30.000 VNĐ/3Kg",style: Contanst.notePrice,textAlign: TextAlign.left,),
                              SizedBox(height: 6,),
                              Text("0.5Kg tiếp theo\n3000VNĐ",style: Contanst.titleTextFiled,)
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                          height:50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38.withOpacity(0.5),
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                  offset: Offset(5,7),
                                )
                              ]
                          ),
                          child: Center(
                            child: Text("Normal",style: Contanst.textInButton,),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text("23.000 VNĐ/3Kg",style: Contanst.notePrice,textAlign: TextAlign.left,),
                              SizedBox(height: 6,),
                              Text("0.5Kg tiếp theo\n3000VNĐ",style: Contanst.titleTextFiled,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
