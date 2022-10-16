import 'package:exampleapplication/Widgets/fees_history.dart';
import 'package:exampleapplication/Widgets/pending_fees.dart';
import 'package:exampleapplication/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Student extends StatefulWidget {
  final String stuName;

  const Student({super.key, required this.stuName});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  TextEditingController studentName = TextEditingController();
  TextEditingController parentsName = TextEditingController();
  TextEditingController updatePhoneNumber = TextEditingController();
  TextEditingController updateParentsName = TextEditingController();

  String phoneNumber = '7888456123';

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
    var w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Expanded(
          child: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Name',
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              Container(
                height: 50,
                width: w,
                margin: EdgeInsets.only(right: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffF3F3F3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft,
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: studentName,
                  decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xff006C67),
                      ),
                      suffix: GestureDetector(
                        onTap: () {
                          if (studentName.text.length == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please enter your name'),
                              duration: Duration(milliseconds: 500),
                              backgroundColor: Colors.red.withOpacity(0.5),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Change name'),
                                duration: Duration(milliseconds: 200),
                                backgroundColor: Color(0xff006C67)));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            'Change',
                            style: TextStyle(color: Color(0xff006C67)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      hintText: widget.stuName),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Parents name',
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              Container(
                height: 50,
                width: w,
                margin: EdgeInsets.only(right: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffF3F3F3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: updateParentsName,
                  decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xff006C67),
                      ),
                      suffix: GestureDetector(
                        onTap: () {
                          if (parentsName.text.length == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please enter your name'),
                              duration: Duration(milliseconds: 500),
                              backgroundColor: Colors.red.withOpacity(0.5),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Change name'),
                                duration: Duration(milliseconds: 200),
                                backgroundColor: Color(0xff006C67)));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            'Change',
                            style: TextStyle(color: Color(0xff006C67)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      hintText: 'Parent\'s name'),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Phone number',
                style: GoogleFonts.inter(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              Container(
                height: 50,
                width: w,
                margin: EdgeInsets.only(right: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffF3F3F3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: updatePhoneNumber,
                  decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: Color(0xff006C67),
                      ),
                      suffix: GestureDetector(
                        onTap: () {
                          if (parentsName.text.length == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please enter phone number'),
                              duration: Duration(milliseconds: 500),
                              backgroundColor: Colors.red.withOpacity(0.5),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Changed phone number'),
                                duration: Duration(milliseconds: 200),
                                backgroundColor: Color(0xff006C67)));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            'Change',
                            style: TextStyle(color: Color(0xff006C67)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      hintText: phoneNumber),
                  keyboardType: TextInputType.name,
                ),
              ),
            ]),
      )),
    );
  }

  Widget feesHistoryPage() {
    return SingleChildScrollView(
      child: Expanded(
          child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(children: [
          FeesHistory(month: 'Jan', fees: 500),
          FeesHistory(month: 'Feb', fees: 600),
          FeesHistory(month: 'Mar', fees: 600),
          FeesHistory(month: 'April', fees: 800),
        ]),
      )),
    );
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

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  child: Column(children: [
                    PendingFees(startMonth: 'Jun', endMonth: 'July', fees: 600),
                    PendingFees(startMonth: 'Jan', endMonth: 'Feb', fees: 500),
                    PendingFees(startMonth: 'Nov', endMonth: 'Dec', fees: 600),
                    PendingFees(startMonth: 'Nov', endMonth: 'Dec', fees: 600),
                    PendingFees(startMonth: 'Nov', endMonth: 'Dec', fees: 600),
                    PendingFees(startMonth: 'Nov', endMonth: 'Dec', fees: 600),
                    PendingFees(startMonth: 'Nov', endMonth: 'Dec', fees: 600),
                    PendingFees(startMonth: 'Nov', endMonth: 'Dec', fees: 600),
                  ]),
                ))),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 40),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: w / 2 - 25,
                        decoration: BoxDecoration(
                            color: Color(0xffFCEEEE),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/send_reminder.svg',
                              height: 18,
                            ),
                            Text(
                              ' Send Reminder',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        )),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: w / 2 - 25,
                      decoration: BoxDecoration(
                          color: Color(0xff006C67),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        ' Fees collected',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      )),
                ],
              )),
        ),
      ],
    );
  }
}
