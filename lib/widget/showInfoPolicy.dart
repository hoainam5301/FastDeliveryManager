import 'package:flutter/material.dart';
import 'package:managerdelivery/class/commission.dart';
import 'package:managerdelivery/widget/contanst.dart';

class ShowInfoPolicy extends StatelessWidget {
  //const ShowInfoPolicy({Key? key}) : super(key: key);
  final Commission commission;
  ShowInfoPolicy({this.commission});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          width: MediaQuery.of(context).size.width,
          height: 255,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 3,
                    offset: Offset(2, 4))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 144),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        )),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Manure Extract ${commission.ratioCommission}",
                      style: Contanst.titleTextFiled,
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        )),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${commission.orderPerMonthMin}-${commission.orderPerMonthMax} orders/month",
                      style: Contanst.titleTextFiled,
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: new BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          )),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Container(
                        width: 205,
                        child: Text(commission.note,
                          style: Contanst.titleTextFiled,
                          textAlign: TextAlign.left,
                        ))
                  ],
                ),
                SizedBox(
                  height: 12,
                )
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
    );
  }
}
