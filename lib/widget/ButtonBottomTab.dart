import 'package:flutter/material.dart';

class ButtonBottomTab extends StatefulWidget {
  //const ButtonBottomTab({Key? key}) : super(key: key);
  final int selectTab;
  final Function (int) tabPressed;

  ButtonBottomTab({this.tabPressed,this.selectTab});

  @override
  _ButtonBottomTabState createState() => _ButtonBottomTabState();
}

class _ButtonBottomTabState extends State<ButtonBottomTab> {
  @override
  int _selectTab=0;

  Widget build(BuildContext context) {
    _selectTab= widget.selectTab;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:[
            BoxShadow(
              color:Colors.black.withOpacity(0.5),
              spreadRadius:1.0,
              blurRadius:10.0,
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomButton(
            imagePath: "assets/images/dashboard.png",
            selected: _selectTab==0 ? true : false,
            onPressed: (){
              widget.tabPressed(0);
            },
          ),
         BottomButton(
              imagePath: "assets/images/directional.png",
              selected: _selectTab==1 ? true :false,
              onPressed: (){
                widget.tabPressed(1);
              },
            ),
         BottomButton(
              imagePath: "assets/images/statistics.png",
              selected: _selectTab ==2 ? true : false,
              onPressed: (){
                widget.tabPressed(2);
              },
            ),
          BottomButton(
            imagePath: "assets/images/more.png",
            selected:  _selectTab ==3 ? true : false,
            onPressed: (){
              widget.tabPressed(3);
            },
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget{
  final String imagePath;
  final bool selected;
  final Function onPressed;

  BottomButton({this.onPressed,this.imagePath,this.selected});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: _selected ? Color(0xffC8161D) : Colors.transparent,
                ))),
        child: Image(
          image: AssetImage(imagePath ?? ""),
          width: 40.0,
          height: 40.0,
          color: _selected ? Color(0xffC8161D) : Color(0xff667C8A),
        ),
      ),
    );
  }
}
