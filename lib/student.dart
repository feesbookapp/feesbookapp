import 'package:exampleapplication/Widgets/fees_history.dart';
import 'package:exampleapplication/Widgets/pending_fees.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Student extends StatefulWidget {
  final String stuName;

  const Student({super.key, required this.stuName});

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
                          widget.stuName,
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
                              color: Color(0xff303030),
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    onTap: () {
                      studentController.animateToPage(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    child: Text(
                      'Fees History',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: studentController == 1
                                  ? Color(0xff006C67)
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    onTap: () {
                      studentController.animateToPage(1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                  ),
                  GestureDetector(
                    child: Text(
                      'Contact',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              color: studentController == 2
                                  ? Color(0xff006C67)
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    onTap: () {
                      studentController.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                  )
                ]),
          )),
          Expanded(
              child: Container(
            color: Colors.white,
            child: PageView(
              allowImplicitScrolling: true,
              controller: studentController,
              children: [
                pendingFeesPage(),
                feesHistoryPage(),
                contactPage(),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget contactPage() {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [Text('Contact')]),
    ));
  }

  Widget feesHistoryPage() {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        FeesHistory(month: 'Jan', fees: 500),
        FeesHistory(month: 'Feb', fees: 600),
        FeesHistory(month: 'Mar', fees: 600),
        FeesHistory(month: 'April', fees: 800),
      ]),
    ));
  }

  Widget pendingFeesPage() {
    // List pendingFeesList = [
    //   {
    //     'startingMonth': 'March',
    //     'endingMonth': 'April',
    //     'Fees': 500
    //   },
    //   {
    //     'startingMonth': 'April',
    //     'endingMonth': 'May',
    //     'Fees': 600
    //   },
    //   {
    //     'startingMonth': 'May',
    //     'endingMonth': 'June',
    //     'Fees': 800
    //   },
    //   {
    //     'startingMonth': 'June',
    //     'endingMonth': 'July',
    //     'Fees': 500
    //   }
    // ];

    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        PendingFees(startMonth: 'Jun', endMonth: 'July', fees: 600),
        PendingFees(startMonth: 'Jan', endMonth: 'Feb', fees: 500),
        PendingFees(startMonth: 'Nov', endMonth: 'Dec', fees: 600),
      ]),
    ));
  }
}
