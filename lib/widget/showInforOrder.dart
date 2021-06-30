import 'package:flutter/material.dart';
import 'package:managerdelivery/class/orders.dart';
import 'package:managerdelivery/widget/contanst.dart';

class ShowInforOrder extends StatelessWidget {
  //const ShowInforOrder({Key? key}) : super(key: key);
  Orders orders;
  ShowInforOrder({this.orders});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 7,
                      offset:Offset(4,6)
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 144),
                  child: Column(
                    children: [
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
                          Text(orders.orderName,style: Contanst.titleTextFiled,)
                        ],
                      ),
                      SizedBox(height: 6,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 10.0,
                              width: 10.0,
                              margin: const EdgeInsets.only(top: 5),
                              decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              )
                          ),
                          SizedBox(width: 6,),
                          Container(
                            width: 208,
                              child: Text(orders.receiverIDAddress.fullAddress,style: Contanst.titleTextFiled,textAlign: TextAlign.start,maxLines: 100,))
                        ],
                      ),
                      SizedBox(height: 6,),
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
                          Text(orders.idPresentStatus.idStatus.name,style: Contanst.titleTextFiled,)
                        ],
                      ),
                      SizedBox(height: 12,)
                    ],
                  ),
                ),
              ),
              Container(
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
            ],
          ),
        SizedBox(height: 12,),
      ],
    );

  }
}
