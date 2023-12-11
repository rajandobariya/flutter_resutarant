import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'intro_two.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({super.key});

  @override
  State<IntroOne> createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(6),
          child: Column(
            children: [
              Container(
                margin:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF000040),
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: Text('1', style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: 'Lexend_Medium'))),
                    ),
                    Container(width: 20,height: 2,color: Color(0xFFCACACA),),
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Color(0xFFCACACA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: Text('2', style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Lexend_Medium'))),
                    ),
                    Container(width: 20,height: 2,color: Color(0xFFCACACA),),
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Color(0xFFCACACA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: Text('3', style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Lexend_Medium'))),
                    ),
                    Container(width: 20,height: 2,color: Color(0xFFCACACA),),
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Color(0xFFCACACA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(child: Text('4', style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Lexend_Medium'))),
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 66,
                child: Image.asset("assets/images/bg_gujarati.png",width: MediaQuery.of(context).size.width,),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Image.asset("assets/images/gujarati_food.png",width: MediaQuery.of(context).size.width,),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text("Enjoy unlimited dish For Lunch Dinner. First order 50% off ",style:TextStyle(fontSize: 16,color: Color(0xFFB1B1B1),fontFamily: 'Lexend_Regular'),textAlign:TextAlign.center,),
              ),
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return IntroTwo();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 60,vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0xFF000040),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Next",style:TextStyle(fontSize: 22,color: Colors.white ,fontFamily: 'Lexend_Medium')),
                    ),
                  ),
                ),
              )
            ]
          ),
        )
      ),
    );
  }
}
