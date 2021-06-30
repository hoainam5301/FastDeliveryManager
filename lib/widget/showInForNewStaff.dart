import 'package:flutter/material.dart';
import 'package:managerdelivery/widget/contanst.dart';

class ShowInfoNewSatff extends StatelessWidget {
  //const ShowInfo({Key? key}) : super(key: key);
  final String email;
  final String phone;

  ShowInfoNewSatff({this.email,this.phone});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal:12,vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(12),
          boxShadow:[
            BoxShadow(
              color:Colors.black.withOpacity(0.5),
              spreadRadius:1.0,
              blurRadius:10.0,
            )
          ]
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 6,),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Text("Email",
                      style:Contanst.headingShowInfo,)
                )
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Text(email,style: Contanst.regularTextInfo,)
                )
            ),
            SizedBox(height: 6,),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Text("Phone",
                      style:Contanst.headingShowInfo,)
                )
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Text(phone,style: Contanst.regularTextInfo,)
                )
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }
}
