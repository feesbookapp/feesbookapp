import 'dart:async';

import 'package:exampleapplication/bottomsheet/classes.dart';
import 'package:exampleapplication/bottomsheet/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List screens = [
      getBody(),
      classes(),
      Profile(),
    ];

    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          height: 70,
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xff0D5F5A),
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_outlined), label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.monitor), label: 'Classes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ));
  }

  Widget getBody() {
    var w = MediaQuery.of(context).size.width;
    var pendingFees = '2,500';
    var collectedFees = '10,000';
    var tuitionName = 'Balaji tutorials';
    var city = 'Manglore';

    //List
    List kBatch = [
      {
        'name': '12th',
        'subject': 'Physics',
        'number of students': '10',
        'feesPaid': '6'
      },
      {
        'name': '11th',
        'subject': 'Chemistry',
        'number of students': '12',
        'feesPaid': '3'
      }
    ];

    // var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        //Name, pending amount and collecte amount
        Container(
          color: Color(0xffF8F9FB),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: w,
              ),
              //Safe area
              //Class, back button and view full report
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset("img/back.svg"),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${tuitionName}, ${city}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "View full report",
                                style: TextStyle(
                                  color: Color(0xff006C67),
                                  fontSize: 16,
                                )),
                            WidgetSpan(
                              child: Icon(Icons.arrow_forward_ios_outlined,
                                  size: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),

              //Red and green box
              Container(
                width: w,
                margin: EdgeInsets.only(left: 16, right: 16, top: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Red box
                    Container(
                      child: FeesInfo(Color(0xffFCEEEE), 'Pending Fees',
                          pendingFees, Color(0xff9D0709)),
                      height: 84,
                      width: w / 2 - 22,
                    ),
                    //Green box
                    Container(
                      height: 84,
                      width: w / 2 - 22,
                      child: FeesInfo(Color(0xffE9EDEC), 'Total collected',
                          collectedFees, Color(0xff006C67)),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
        //All classes or empty SVG
        Expanded(
            child: Center(
          child: Column(
            children: [
              SvgPicture.asset('assets/no_batch.svg'),
              //Add your class
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Add your class',
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),

              //subtitle
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Start managing your fees collection\nby adding a class',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),

              //Add a batch
              GestureDetector(
                child: Container(
                  width: w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(18),
                  margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  decoration: BoxDecoration(
                      color: Color(0xff006C67),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Add a batch >>>',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Add a batch'),
                    duration: Duration(microseconds: 200),
                  ));
                },
              ),

              //WhatsApp need help?
              GestureDetector(
                child: Container(
                  width: w,
                  padding: EdgeInsets.all(18),
                  margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.whatsapp_outlined,
                        color: Color(0xff006C67),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Need help setting up?',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                      ),
                    ],
                  )),
                ),
                onTap: () {
                  launch('https://wa.me/+918303823055');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Need help?'),
                    duration: Duration(microseconds: 200),
                  ));
                },
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class FeesInfo extends StatelessWidget {
  final Color backgroundColor, textColor;
  final title;
  final amount;
  FeesInfo(this.backgroundColor, this.title, this.amount, this.textColor);

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 15, left: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            amount.toString(),
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 24),
          )
        ],
      ),
    );
  }
}
