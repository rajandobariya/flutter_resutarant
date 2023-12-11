import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resutarant/main_page.dart';
import 'package:resutarant/pages/login_success.dart';
import 'package:resutarant/pages/otp.dart';
import 'package:resutarant/ui_helper/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  static String verify = "";

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController country = TextEditingController();
  var phone = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(top: 50,bottom: 12),
                child: Image(image: AssetImage('assets/images/login_logo.png'), width: 137, height: 155,)),
            Container(margin: EdgeInsets.all(12),alignment: Alignment.center,child: Text("Log in With Mobile", style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Aclon' ),)),
            Container(
              margin: EdgeInsets.all(25),
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 60,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFFC9C9C9),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: Center(
                  //     child: Text(
                  //       "In +91",
                  //       style: mTextStyle18().copyWith(
                  //           color: Colors.black, fontSize: 13),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   height: 55,
                  //   width: 1,
                  //   color: Color(0xFFC9C9C9),
                  // ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: TextField(
                            onChanged: (value) {
                              phone = value;
                            },
                            style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: 'Lexend_Regular'),
                            maxLines: 1,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              hintText: "Enter Mobile Number",
                              hintStyle: TextStyle(fontSize: 14, color: Color(0xFFD3D3D3),fontFamily: 'Lexend_Regular'),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(  "Or Connect with",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: Image.asset(
                      "assets/images/img_google_flag.png",
                      height: 55,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/img_fb_flag.png",
                    height: 55,
                  ),
                ]),
            SizedBox(height: 55),
            InkWell(
              onTap: () async {
                if (phone.length != 10) {
                  print("Phone length is not 10");
                  return;
                }
                print("Clicked");
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: "+91$phone",
                  verificationCompleted:
                      (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent:
                      (String verificationId, int? resendToken) {
                    MyLoginPage.verify = verificationId;
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return MyVerify(phone: phone,);
                        },));
                  },
                  codeAutoRetrievalTimeout:
                      (String verificationId) {},
                );
              },
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width ,
                height: 46,
                margin: EdgeInsets.symmetric(vertical: 12,horizontal: 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF000040),
                ),
                child: Center(
                  child: Text(
                    "Send OTP",
                    style:  TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Lexend_Medium'),
                  ),
                ),
              ),
            ),

            // Stack(
            //   children: [
            //     Container(
            //       height: 300,
            //       width: MediaQuery
            //           .of(context)
            //           .size
            //           .width,
            //       decoration: BoxDecoration(
            //         gradient: RadialGradient(
            //           colors: [
            //             Color(0xFF00986B),
            //             Color(0xFF00694A),
            //           ],
            //         ),
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(50),
            //           bottomRight: Radius.circular(50),
            //         ),
            //       ),
            //     ),
            //     Container(
            //       height: 420,
            //       margin: EdgeInsets.only(top: 250, right: 12, left: 12),
            //       child: Stack(
            //         children: [
            //           Container(
            //             height: 395,
            //             width: MediaQuery
            //                 .of(context)
            //                 .size
            //                 .width,
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(12),
            //               ),
            //               border: Border.all(
            //                 color: Color(0xFFC9C9C9),
            //                 width: 1,
            //               ),
            //             ),
            //             child: Container(
            //               margin: EdgeInsets.only(top: 80),
            //               child: Column(children: [
            //                 Text(
            //                   "Freedom to Go \n Anywhere,Anytime",
            //                   style: mTextStyle22(),
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 Container(
            //                   margin: EdgeInsets.all(25),
            //                   width: MediaQuery
            //                       .of(context)
            //                       .size
            //                       .width - 60,
            //                   height: 55,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(12),
            //                     border: Border.all(
            //                       color: Color(0xFFC9C9C9),
            //                       width: 1,
            //                     ),
            //                   ),
            //                   child: Row(
            //                     children: [
            //                       Expanded(
            //                         flex: 1,
            //                         child: Center(
            //                           child: Text(
            //                             "In +91",
            //                             style: mTextStyle18().copyWith(
            //                                 color: Colors.black, fontSize: 13),
            //                           ),
            //                         ),
            //                       ),
            //                       Container(
            //                         height: 55,
            //                         width: 1,
            //                         color: Color(0xFFC9C9C9),
            //                       ),
            //                       Expanded(
            //                         flex: 6,
            //                         child: Container(
            //                           padding:
            //                           EdgeInsets.symmetric(horizontal: 10),
            //                           child: Center(
            //                             child: TextField(
            //                                 onChanged: (value) {
            //                                   phone = value;
            //                                 },
            //                                 style: mTextStyle18().copyWith(
            //                                     color: Colors.black,
            //                                     fontSize: 14),
            //                                 maxLines: 1,
            //                                 maxLength: 10,
            //                                 keyboardType: TextInputType.number,
            //                                 decoration: InputDecoration(
            //                                   counterText: "",
            //                                   border: InputBorder.none,
            //                                   hintText: "Enter Mobile Number",
            //                                   hintStyle: mTextStyleIntro(),
            //                                 )),
            //                           ),
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 Text(
            //                   "Or Connect with",
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 SizedBox(height: 20),
            //                 Row(
            //                     mainAxisAlignment: MainAxisAlignment.center,
            //                     children: [
            //                       InkWell(
            //                         onTap: () {
            //                           signInWithGoogle();
            //                         },
            //                         child: Image.asset(
            //                           "assets/images/img_google_flag.png",
            //                           height: 55,
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         width: 20,
            //                       ),
            //                       Image.asset(
            //                         "assets/images/img_fb_flag.png",
            //                         height: 55,
            //                       ),
            //                     ]),
            //                 SizedBox(height: 55),
            //               ]),
            //             ),
            //           ),
            //           Align(
            //             alignment: Alignment.bottomCenter,
            //             child: InkWell(
            //               onTap: () async {
            //                 if (phone.length != 10) {
            //                   print("Phone length is not 10");
            //                   return;
            //                 }
            //                 print("Clicked");
            //                 await FirebaseAuth.instance.verifyPhoneNumber(
            //                   phoneNumber: "+91$phone",
            //                   verificationCompleted:
            //                       (PhoneAuthCredential credential) {},
            //                   verificationFailed: (FirebaseAuthException e) {},
            //                   codeSent:
            //                       (String verificationId, int? resendToken) {
            //                     MyLoginPage.verify = verificationId;
            //                     Navigator.pushNamed(context, 'otp');
            //                   },
            //                   codeAutoRetrievalTimeout:
            //                       (String verificationId) {},
            //                 );
            //               },
            //               child: Container(
            //                 width: MediaQuery
            //                     .of(context)
            //                     .size
            //                     .width - 190,
            //                 height: 55,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(12),
            //                   color: Color(0xFF00986B),
            //                 ),
            //                 child: Center(
            //                   child: Text(
            //                     "Continue",
            //                     style: mTextStyle18(),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       height: 200,
            //       margin: EdgeInsets.only(top: 110),
            //       child: Center(
            //         child: Image.asset(
            //           "assets/images/login_car.png",
            //           height: 200,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user?.displayName);
      navigateToHomeScreen();
    } catch (e) {
      print("Error during Google sign in: $e");
    }
  }

  void navigateToHomeScreen() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("islogin", true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginSuccess(),
      ),
    );
  }
}