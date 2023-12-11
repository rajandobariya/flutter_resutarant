import 'package:flutter/material.dart';
import 'package:resutarant/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vector_math/vector_math_64.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({super.key});

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/success.png'),
                width: 160,
                height: 160,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Login Successfully",
                style: TextStyle(fontSize: 20, fontFamily: 'Lexend_Bold'),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () async {
              var prefs = await SharedPreferences.getInstance();
              prefs.setBool("islogin", true);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return MainPage();
              }));
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
                  "Done",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18,
                      fontFamily: 'Lexend_Medium'),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
