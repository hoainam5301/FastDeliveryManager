import 'package:flutter/material.dart';
import 'package:managerdelivery/widget/contanst.dart';

class ShowInfo extends StatelessWidget {
  //const ShowInfo({Key? key}) : super(key: key);
  final String title;
  final String data;

  ShowInfo({this.data,this.title});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
              child: Container(
                  child: Text(title,
                    style:Contanst.headingShowInfo,)
              )
          ),
          SizedBox(height: 12,),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Text(data,style: Contanst.regularTextInfo,)
              )
          ),
         Divider(
           color: Colors.grey,
           thickness: 1,
         )
        ],
      ),
    );
  }
}
