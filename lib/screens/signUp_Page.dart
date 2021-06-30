import 'package:flutter/material.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/customInput.dart';

class SignUp extends StatelessWidget {
  //const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F8),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child:
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  height: 300,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: BackGroundClipper(),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color(0xffC8161D),
                                borderRadius: BorderRadius.circular(0)
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          radius:70.0,
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
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text("Welcome!",
                        style: Contanst.welcomeText,),
                    )
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text("Please enter your information in the\nform below, our staff will contact you soon",
                        style: Contanst.noteText,),
                    )
                ),
                SizedBox(height: 35.0,),
                CustomInput(
                  title: "E-mail",
                  hintText: "mail@gmail.com",
                  iconImages: "assets/images/gmail.png",
                ),
                SizedBox(height: 15.0,),
                CustomInput(
                  title: "Password",
                  iconImages: "assets/images/password.png",
                  hintText: "**************",
                ),
                SizedBox(height: 40,),
                GestureDetector(
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Button(title: "Send",),
                ),
              ],
            ),
          ),
        )
    );
  }
}

class BackGroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height/2);
    var firstControlPoint = Offset(50, size.height/2+30);
    var firstEndPoint = Offset(size.width/2, size.height/2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width/2 + size.width/2 +10, size.height - size.height/2 +15);
    var secondEndPoint = Offset(size.width, size.height-45);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}