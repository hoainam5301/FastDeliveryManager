import 'package:flutter/material.dart';
import 'package:managerdelivery/class/wareHousing.dart';
import 'package:managerdelivery/widget/contanst.dart';

class ShowInfoWareHousing extends StatelessWidget {
  //const ShowInfoPolicy({Key? key}) : super(key: key);
  final WareHousing wareHousing;
  ShowInfoWareHousing({this.wareHousing});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          width: MediaQuery.of(context).size.width,
          height: 160,
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
                      "${wareHousing.name}",
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
                      padding: const EdgeInsets.only(top: 9),
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
                        child: Text(wareHousing.idAddress.idWard.idDistrict.name,
                          style: Contanst.titleTextFiled,
                          textAlign: TextAlign.left,
                        ))
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 10.0,
                        width: 10.0,
                        margin: const EdgeInsets.only(top: 9),
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        )),
                    SizedBox(
                      width: 6,
                    ),
                    Container(
                      width: 210,
                      child: Text(
                        "${wareHousing.idAddress.fullAddress}",
                        style: Contanst.titleTextFiled,
                        maxLines: 100,
                      ),
                    )
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
