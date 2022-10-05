import 'package:exampleapplication/Widgets/pending_fees.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottomsheet/homepage.dart';

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var studentController = PageController(initialPage: 0);
    return Scaffold(
      body: Column(
        children: [
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
                    Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(200)),
                        child: GestureDetector(
                          child: Center(child: Icon(Icons.arrow_back)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harshit pathak',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                'View profile',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        color: Color(0xff006C67),
                                        fontSize: 14)),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff006C67),
                                size: 14,
                              )
                            ],
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('View full report')));
                          },
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
                        child: FeesInfo(Color(0xffFCEEEE), 'Pending Fees', '0',
                            Color(0xff9D0709)),
                        height: 84,
                        width: w / 2 - 22,
                      ),
                      //Green box
                      Container(
                        height: 84,
                        width: w / 2 - 22,
                        child: FeesInfo(Color(0xffE9EDEC), 'Total collected',
                            '0', Color(0xff006C67)),
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
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      'Pending Fees',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: studentController ==
                                      studentController.initialPage
                                  ? Color(0xff006C67)
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Text(
                      'Fees History',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    onTap: () {},
                  ),
                  Text(
                    'Contact',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ]),
          )),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 15),
            color: Colors.white,
            child: PageView(
              allowImplicitScrolling: true,
              controller: studentController,
              children: [
                pendingFeesPage(),
                Container(
                  color: Colors.black,
                ),
                Container(
                  color: Colors.blue,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget pendingFeesPage() {
    return Container();
  }
}
