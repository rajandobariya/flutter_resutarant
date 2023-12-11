import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Color(
              0xFFDBDBDB,
            ),
            height: 1,
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? const Image(
                          image: AssetImage('assets/images/select_home.png'),
                          height: 35,
                          width: 35,
                        )
                      : const Image(
                          image: AssetImage('assets/images/unselect_home.png'),
                          height: 35,
                          width: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? const Image(
                          image: AssetImage('assets/images/select_cart.png'),
                          height: 35,
                          width: 35,
                        )
                      : const Image(
                          image: AssetImage('assets/images/unselect_cart.png'),
                          height: 35,
                          width: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? const Image(
                          image: AssetImage('assets/images/select_order.png'),
                          height: 35,
                          width: 35,
                        )
                      : const Image(
                          image: AssetImage('assets/images/unselect_order.png'),
                          height: 35,
                          width: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? const Image(
                          image: AssetImage('assets/images/select_fav.png'),
                          height: 35,
                          width: 35,
                        )
                      : const Image(
                          image: AssetImage('assets/images/unselect_fav.png'),
                          height: 35,
                          width: 35,
                        ),
                ),
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 4;
                    });
                  },
                  icon: pageIndex == 4
                      ? const Image(
                          image: AssetImage('assets/images/select_person.png'),
                          height: 35,
                          width: 35,
                        )
                      : const Image(
                          image:
                              AssetImage('assets/images/unselect_person.png'),
                          height: 35,
                          width: 35,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final List<String> imageList = [
    "assets/images/image_slider_1.png",
    "assets/images/image_slider_2.png",
    "assets/images/image_slider_3.png",
    "assets/images/image_slider_4.png",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Container(
                height: 55,
                margin: EdgeInsets.all(6),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Good Evening,Ramdpo",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Lexend_SemiBold'),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/images/notification.png'),
                      height: 26,
                      width: 26,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lexend_SemiBold'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    // Set the background color
                    hintText: "Search for Cars...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),

                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          12.0), // Set the border radius here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          12.0), // Set the border radius here
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(6),
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      items: [
                        for (int i = 0; i < imageList.length; i++)
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(6),
                            child: Image.asset(
                              imageList[i],
                            ),
                          ),
                      ],
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        autoPlay: false,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < imageList.length; i++)
                        Container(
                            height: 6,
                            width: 6,
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: currentIndex == i
                                  ? Color(0xFF151515)
                                  : Color(0xFFD2D2D2),
                              shape: BoxShape.circle,
                            ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Lexend_Medium',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            image:
                                AssetImage('assets/images/cate_gujarati.png'),
                            width: 80,
                            height: 80),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Gujarati Snakes",
                          style: TextStyle(
                              fontFamily: 'Lexend_Regular', fontSize: 12),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            image:
                                AssetImage('assets/images/cate_gujarati.png'),
                            width: 80,
                            height: 80),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Junkfood",
                          style: TextStyle(
                              fontFamily: 'Lexend_Regular', fontSize: 12),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            image:
                                AssetImage('assets/images/cate_gujarati.png'),
                            width: 80,
                            height: 80),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Sweets",
                          style: TextStyle(
                              fontFamily: 'Lexend_Regular', fontSize: 12),
                        ),
                      ],
                    )),
                  ]),
                  SizedBox(
                    height: 12,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            image: AssetImage('assets/images/cate_dhosa.png'),
                            width: 80,
                            height: 80),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Dhosa",
                          style: TextStyle(
                              fontFamily: 'Lexend_Regular', fontSize: 12),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            image: AssetImage('assets/images/cate_chiness.png'),
                            width: 80,
                            height: 80),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Chinese",
                          style: TextStyle(
                              fontFamily: 'Lexend_Regular', fontSize: 12),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                            image: AssetImage('assets/images/cate_more.png'),
                            width: 80,
                            height: 80),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "More",
                          style: TextStyle(
                              fontFamily: 'Lexend_Regular', fontSize: 12),
                        ),
                      ],
                    )),
                  ]),
                  Container(
                    margin: EdgeInsets.all(6),
                    child: Text(
                      "Popular Items",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Lexend_Medium',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 146,
                          margin: EdgeInsets.all(6),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/bg_popular.png'),
                                  height: 94,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Image(
                                image: AssetImage(
                                    'assets/images/mix_vegitable.png'),
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.all(2),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF000040),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10))),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/fav.png')),
                                  )),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 106,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              margin: EdgeInsets.only(top: 20),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0066FF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  "20% off",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 7,
                                                      fontFamily:
                                                          'Lexend_Regular'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF00A44B),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(2))),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "4.3",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 7,
                                                        fontFamily:
                                                            'Lexend_Regular'),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 9,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Mix Vegitable Sabji",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF323232),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "₹ 129.00",
                                            style: TextStyle(
                                                color: Color(0xFF909090),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 146,
                          margin: EdgeInsets.all(6),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/bg_popular.png'),
                                    height: 94,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  )),
                              Image(
                                image: AssetImage('assets/images/aloo.png'),
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.all(2),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF000040),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10))),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/fav.png')),
                                  )),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 106,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              margin: EdgeInsets.only(top: 20),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0066FF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  "50% off",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 7,
                                                      fontFamily:
                                                          'Lexend_Regular'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF00A44B),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(2))),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "3.2",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 7,
                                                        fontFamily:
                                                            'Lexend_Regular'),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 9,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Aloo Kobi mix",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF323232),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "₹ 80.00",
                                            style: TextStyle(
                                                color: Color(0xFF909090),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 146,
                          margin: EdgeInsets.all(6),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/bg_popular.png'),
                                    height: 94,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  )),
                              Image(
                                image: AssetImage(
                                    'assets/images/choole_paneer.png'),
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.all(2),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF000040),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10))),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/fav.png')),
                                  )),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 106,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              margin: EdgeInsets.only(top: 20),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0066FF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  "35% off",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 7,
                                                      fontFamily:
                                                          'Lexend_Regular'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF00A44B),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(2))),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "4.9",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 7,
                                                        fontFamily:
                                                            'Lexend_Regular'),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 9,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Chole Paneer Mix",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF323232),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "₹ 179.00",
                                            style: TextStyle(
                                                color: Color(0xFF909090),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 146,
                          margin: EdgeInsets.all(6),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/bg_popular.png'),
                                    height: 94,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  )),
                              Image(
                                image: AssetImage(
                                    'assets/images/masala_dhosas.png'),
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.all(2),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF000040),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10))),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/fav.png')),
                                  )),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 106,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              margin: EdgeInsets.only(top: 20),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0066FF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  "70% off",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 7,
                                                      fontFamily:
                                                          'Lexend_Regular'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF00A44B),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(2))),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "4.5",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 7,
                                                        fontFamily:
                                                            'Lexend_Regular'),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 9,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Masala Dhosa",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF323232),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "₹ 50.00",
                                            style: TextStyle(
                                                color: Color(0xFF909090),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 146,
                          margin: EdgeInsets.all(6),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/bg_popular.png'),
                                    height: 94,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  )),
                              Image(
                                image: AssetImage(
                                    'assets/images/tandoori_roti.png'),
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.all(2),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF000040),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10))),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/fav.png')),
                                  )),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 106,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              margin: EdgeInsets.only(top: 20),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0066FF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  "10% off",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 7,
                                                      fontFamily:
                                                          'Lexend_Regular'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF00A44B),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(2))),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "5.0",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 7,
                                                        fontFamily:
                                                            'Lexend_Regular'),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 9,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Tandoori Roti 2 pcs",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF323232),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "₹ 30.00",
                                            style: TextStyle(
                                                color: Color(0xFF909090),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 146,
                          margin: EdgeInsets.all(6),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/bg_popular.png'),
                                    height: 94,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  )),
                              Image(
                                image: AssetImage('assets/images/bhel.png'),
                                height: 88,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.all(2),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF000040),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10))),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/fav.png')),
                                  )),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 106,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              margin: EdgeInsets.only(top: 20),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0066FF),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  )),
                                              child: Center(
                                                child: Text(
                                                  "15% off",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 7,
                                                      fontFamily:
                                                          'Lexend_Regular'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF00A44B),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(2))),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "4.0",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 7,
                                                        fontFamily:
                                                            'Lexend_Regular'),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 9,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 6),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Bombay Bhel Full",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF323232),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "₹ 120.00",
                                            style: TextStyle(
                                                color: Color(0xFF909090),
                                                fontSize: 12,
                                                fontFamily: 'Lexend_Regular'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Stack(
                children: [
                  Center(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            image: AssetImage('assets/images/back.png'),
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Text(
                    "Your Cart",
                    style: TextStyle(
                        color: Color(0xFF292D32),
                        fontSize: 16,
                        fontFamily: 'Lexend_Medium'),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lexend_SemiBold'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    // Set the background color
                    hintText: "Search for Orders...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),

                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          12.0), // Set the border radius here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          12.0), // Set the border radius here
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/empty_bag.png'),
                    width: 72,
                    height: 72,
                  ),
                  Text("No order in cart",
                      style: TextStyle(
                        color: Color(0xFFC9C9C9),
                        fontSize: 17,
                        fontFamily: 'Lexend_Regular',
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Stack(
                children: [
                  Center(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            image: AssetImage('assets/images/back.png'),
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Text(
                    "Your Orders",
                    style: TextStyle(
                        color: Color(0xFF292D32),
                        fontSize: 16,
                        fontFamily: 'Lexend_Medium'),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lexend_SemiBold'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    // Set the background color
                    hintText: "Search Your Orders...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),

                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          12.0), // Set the border radius here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          12.0), // Set the border radius here
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: selectedIndex == 0
                        ? Container(
                            height: 36,
                            margin: EdgeInsets.all(6),
                            child: Center(
                                child: Text(
                              "Pending",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Lexend_Regular'),
                            )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xFF000040)),
                          )
                        : Container(
                            height: 36,
                            margin: EdgeInsets.all(6),
                            child: Center(
                                child: Text(
                              "Pending",
                              style: TextStyle(
                                  color: Color(0xFF707070),
                                  fontSize: 14,
                                  fontFamily: 'Lexend_Regular'),
                            )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xFFE3E3E3)),
                          ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: selectedIndex == 1
                        ? Container(
                            height: 36,
                            margin: EdgeInsets.all(6),
                            child: Center(
                                child: Text(
                              "Completed",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Lexend_Regular'),
                            )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xFF000040)),
                          )
                        : Container(
                            height: 36,
                            margin: EdgeInsets.all(6),
                            child: Center(
                                child: Text(
                              "Completed",
                              style: TextStyle(
                                  color: Color(0xFF707070),
                                  fontSize: 14,
                                  fontFamily: 'Lexend_Regular'),
                            )),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xFFE3E3E3)),
                          ),
                  )),
                ],
              ),
            ),
            Expanded(child: Tabs(selectedIndex))
          ],
        ),
      ),
    );
  }

  Tabs(int selectedIndex) {
    if (selectedIndex == 0) {
      return Pending();
    } else {
      return Completed();
    }
  }
}

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/empty_order.png'),
              width: 72,
              height: 72,
            ),
            Text("No order Complete",
                style: TextStyle(
                  color: Color(0xFFC9C9C9),
                  fontSize: 17,
                  fontFamily: 'Lexend_Regular',
                )),
          ],
        ),
      ),
    ));
  }
}

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/empty_order.png'),
              width: 72,
              height: 72,
            ),
            Text(
              "No order Pending",
              style: TextStyle(
                color: Color(0xFFC9C9C9),
                fontSize: 17,
                fontFamily: 'Lexend_Regular',
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Stack(
                children: [
                  Center(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            image: AssetImage('assets/images/back.png'),
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Text(
                    "Your Favorites items",
                    style: TextStyle(
                        color: Color(0xFF292D32),
                        fontSize: 16,
                        fontFamily: 'Lexend_Medium'),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                margin: EdgeInsets.all(6),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Lexend_SemiBold'),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    // Set the background color
                    hintText: "Search for Orders...",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),

                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          12.0), // Set the border radius here
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          12.0), // Set the border radius here
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/fav_no.png'),
                    width: 72,
                    height: 72,
                  ),
                  Text("No order",
                      style: TextStyle(
                        color: Color(0xFFC9C9C9),
                        fontSize: 17,
                        fontFamily: 'Lexend_Regular',
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  File? galleryFile;
  final picker = ImagePicker();

  Future<void> saveFilePathToSharedPreferences(String filePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('galleryFilePath', filePath);
  }

  Future<String?> getFilePathFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('galleryFilePath');
  }

  @override
  void initState() {
    super.initState();
    _loadGalleryFile();
  }

  void _loadGalleryFile() async {
    String? filePath = await getFilePathFromSharedPreferences();
    if (filePath != null) {
      setState(() {
        galleryFile = File(filePath);
      });
    }
  }

  Future getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(() {
      if (xfilePick != null) {
        galleryFile = File(pickedFile!.path);
        saveFilePathToSharedPreferences(galleryFile!.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/images/bg_profile.png'),
                    height: 206,
                  ),
                  SafeArea(
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      child: Stack(
                        children: [
                          Center(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image(
                                    image: AssetImage('assets/images/back.png'),
                                    height: 24,
                                    width: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                              child: Text(
                            "My Profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lexend_Medium'),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 160,
                        width: 160,
                        child: Column(children: [
                          InkWell(
                            onTap: () {
                              _showPicker(context: context);
                            },
                            child: Container(
                              height: 124,
                              width: 124,
                              child: Stack(
                                children: [
                                  galleryFile == null
                                      ? Image(
                                          image: AssetImage(
                                              'assets/images/profile_avatar.png'),
                                          fit: BoxFit.cover,
                                        )
                                      : Container(
                                          width: 124,
                                          height: 124,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(62),
                                            child: Image.file(
                                              galleryFile!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      alignment: Alignment.bottomRight,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/image.png'),
                                        height: 24,
                                        width: 24,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "MR. Metheu Nissam",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Lexend_Medium'),
                          )
                        ]),
                      ))
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(6),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(6),
                      child: TextField(
                        cursorWidth: 1,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Email id',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFD3D3D3)), //<-- SEE HERE
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFD3D3D3)), //<-- SEE HERE
                          ),
                          label: Text(
                            "Email id",
                            style: TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 12,
                                fontFamily: 'Lexend_Regular'),
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Lexend_Regular'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        cursorWidth: 1,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Mobile Number',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFD3D3D3)), //<-- SEE HERE
                          ),
                          counterText: "",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFFD3D3D3)), //<-- SEE HERE
                          ),
                          label: Text(
                            "Mobile Number",
                            style: TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 12,
                                fontFamily: 'Lexend_Regular'),
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Lexend_Regular'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6),
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: Color(0xFFD3D3D3),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Image(
                            image: AssetImage('assets/images/payment.png'),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: Text(
                            "Payment Method",
                            style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 12,
                                fontFamily: 'Lexend_Regular'),
                          )),
                          Image(
                            image: AssetImage('assets/images/next.png'),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6),
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: Color(0xFFD3D3D3),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Image(
                            image: AssetImage('assets/images/coupen.png'),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: Text(
                            "My Coupon",
                            style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 12,
                                fontFamily: 'Lexend_Regular'),
                          )),
                          Image(
                            image: AssetImage('assets/images/next.png'),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6),
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: Color(0xFFD3D3D3),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Image(
                            image: AssetImage('assets/images/offer.png'),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: Text(
                            "My offer",
                            style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 12,
                                fontFamily: 'Lexend_Regular'),
                          )),
                          Image(
                            image: AssetImage('assets/images/next.png'),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6),
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                          color: Color(0xFFD3D3D3),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Image(
                            image: AssetImage('assets/images/wallet.png'),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: Text(
                            "Wallet",
                            style: TextStyle(
                                color: Color(0xFF202020),
                                fontSize: 12,
                                fontFamily: 'Lexend_Regular'),
                          )),
                          Image(
                            image: AssetImage('assets/images/next.png'),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  "Log Out",
                  style: TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 12,
                      fontFamily: 'Lexend_Regular'),
                )),
          ],
        ),
      ),
    );
  }

  void _showPicker({required BuildContext context,}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
