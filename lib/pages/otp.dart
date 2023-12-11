import 'package:flutter/material.dart';
import 'package:resutarant/main_page.dart';
import 'package:resutarant/pages/login_page.dart';
import 'package:resutarant/ui_helper/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_success.dart';

class MyVerify extends StatefulWidget {
   var phone = "";

  MyVerify({required this.phone});

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  var code = "";
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            margin: EdgeInsets.only(top: 50, bottom: 12),
            child: Image(
              image: AssetImage('assets/images/login_logo.png'),
              width: 137,
              height: 155,
            )),
        Container(
            margin: EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Text(
              "Enter otp",
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontFamily: 'Aclon'),
            )),
        Container(
            margin: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "+91 ${widget.phone}",
                  style: TextStyle(
                      color: Color(0xFFB8B8B8),
                      fontSize: 12,
                      fontFamily: 'Aclon'),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("Change",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lexend_Regular',
                        fontSize: 12))
              ],
            )),
        Container(
          margin: EdgeInsets.all(12),
          child: Pinput(
            length: 6,
            onChanged: (values) {
              code = values;
            },
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
        ),
        InkWell(
          onTap: () async {
            try {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: MyLoginPage.verify, smsCode: code);

              await auth.signInWithCredential(phoneAuthCredential);
              navigateToHomeScreen();
            } catch (e) {
              print(e);
              print("Wrong OPT");
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 46,
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF000040),
            ),
            child: Center(
              child: Text(
                "Submit",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Lexend_Medium'),
              ),
            ),
          ),
        ),
      ]),
    );

  }

  void navigateToHomeScreen() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginSuccess()));
  }
}
