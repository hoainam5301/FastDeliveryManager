import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerdelivery/class/bank.dart';
import 'package:managerdelivery/class/district.dart';
import 'package:managerdelivery/class/orders.dart';
import 'package:managerdelivery/class/staff.dart';
import 'package:managerdelivery/class/staffType.dart';
import 'package:managerdelivery/controllers/staffController.dart';
import 'package:managerdelivery/screens/home_page.dart';
import 'package:managerdelivery/screens/signUp_Page.dart';
import 'package:managerdelivery/widget/button.dart';
import 'package:managerdelivery/widget/contanst.dart';
import 'package:managerdelivery/widget/customInput.dart';

class SignIn extends StatefulWidget {
  //const SignInPage({Key? key}) : super(key: key);


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Orders _orders =Get.find<Orders>();
  StaffControllers userStaff =Get.find<StaffControllers>();
  String email;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F8),
        body: SingleChildScrollView(
          child: Padding(
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
                        child: Text("Please enter your data to sign in",
                          style: Contanst.noteText,),
                      )
                  ),
                  SizedBox(height: 35.0,),
                  CustomInput(
                    title: "E-mail",
                    hintText: "mail@gmail.com",
                    iconImages: "assets/images/gmail.png",
                    onChange: (value){
                      email=value;
                    },
                  ),
                  SizedBox(height: 15.0,),
                  CustomInput(
                    title: "Password",
                    iconImages: "assets/images/password.png",
                    hintText: "**************",
                    isPasswordField: true,
                    onChange: (value){
                      password=value;
                    },
                  ),
                  SizedBox(height: 35,),
                  GestureDetector(
                    onTap: (){
                      Bank _bank = Get.find<Bank>();
                      District _district=Get.find<District>();
                      StaffType _staffType= Get.find<StaffType>();
                      _staffType.getListStaffType();
                      _bank.getListBank();
                      _district.getListDistrict().then((value) {print("Done");});
                      _orders.getHandling().then((value) {print("Done");});
                      _orders.getListOrders().then((value) {print("Done");});
                      userStaff.loginStaff(email, password).then((value) {if(value=="Logged in successfully"){
                        Get.offAll(HomePage());
                      }
                      });
                      //
                    },
                    child: Button(title: "Login",),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(SignUp());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have an account?",
                            style: Contanst.regularText,
                            children: const <TextSpan>[
                              TextSpan(
                                  text: "Sign Up",
                                  style: Contanst.textInButtonLanding
                              )
                            ]
                        ),),
                    ),
                  )
                ],
              ),
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