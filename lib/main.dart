import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resutarant/intro_one.dart';
import 'package:resutarant/main_page.dart';
import 'package:resutarant/pages/login_page.dart';
import 'package:resutarant/pages/otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LEGACY RENTAL CARS',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        'phone': (context) => MyLoginPage(),
        'home': (context) => MainPage(),
      },
      home: MySplashPage(),
    );
  }
}

class MySplashPage extends StatefulWidget {
  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  void initState() {
    _getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Image.asset('assets/images/logo.png', height: 120, width: 120),
      ),
    );
  }

  void _getValues() async {
    var prefs = await SharedPreferences.getInstance();
    var islogin = prefs.getBool("islogin");

    setState(
      () {
        Timer(Duration(seconds: 3), () {
          if (islogin != null) {
            if (islogin) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainPage();
                  },
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return IntroOne();
                  },
                ),
              );
            }
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return IntroOne();
                },
              ),
            );
          }
        });
      },
    );
  }
}
