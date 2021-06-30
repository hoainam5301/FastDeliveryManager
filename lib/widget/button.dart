import 'package:flutter/material.dart';
import 'package:managerdelivery/widget/contanst.dart';

class Button extends StatelessWidget {
  final String title;
  Button({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: Color(0xffC8161D),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Center(
        child: Text(title,style: Contanst.textInButton,),
      ),
    );
  }
}
