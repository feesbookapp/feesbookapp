import 'package:exampleapplication/Widgets/batches.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/classes.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/profile.dart';
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
      classes(
          batchName: 'Class 12th(6am)',
          pendingFees: 2500,
          collectedFees: 10000),
      Profile(),
    ];

    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          height: 85,
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xff0D5F5A),
            unselectedItemColor: Colors.grey,
            selectedFontSize: 16,
            unselectedFontSize: 14,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentIndex == 0
                        ? 'assets/dashboard_selected.svg'
                        : 'assets/dashboard_default.svg',
                    height: 30,
                    width: 30,
                  ),
                  label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentIndex == 1
                        ? 'assets/classes_selected.svg'
                        : 'assets/classes_default.svg',
                    height: 30,
                    width: 30,
                  ),
                  label: 'Classes'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  label: 'Profile'),
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
        'name': 'Class 12th(6AM)',
        'subject': 'Physics',
        'totalStu': '10',
        'feesPaid': '6'
      },
      {
        'name': 'Class 11th(6AM)',
        'subject': 'Chemistry',
        'totalStu': '12',
        'feesPaid': '3'
      }
    ];

    // var h = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              const Text('Header'),
              Expanded(
                  child: Column(
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
                                        child: Icon(
                                            Icons.arrow_forward_ios_outlined,
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
                                child: FeesInfo(
                                    Color(0xffFCEEEE),
                                    'Pending Fees',
                                    pendingFees,
                                    Color(0xff9D0709)),
                                height: 84,
                                width: w / 2 - 22,
                              ),
                              //Green box
                              Container(
                                height: 84,
                                width: w / 2 - 22,
                                child: FeesInfo(
                                    Color(0xffE9EDEC),
                                    'Total collected',
                                    collectedFees,
                                    Color(0xff006C67)),
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
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //   content: Text('Add a batch'),
                            //   duration: Duration(microseconds: 200),
                            // ));

                            showModalBottomSheet(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8))),
                                context: context,
                                builder: (context) {
                                  var h = MediaQuery.of(context).size.height;
                                  var btmPageController =
                                      PageController(initialPage: 0);
                                  return Container(
                                    height: h * 0.5,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              height: 5,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                          Expanded(
                                            child: PageView(
                                              controller: btmPageController,
                                              children: [
                                                //Bottom sheet page 1
                                                Column(
                                                  children: [
                                                    //Enter class name
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 50, left: 15),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Enter Class name',
                                                        style: GoogleFonts.inter(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ),
                                                    ),

                                                    //subtitle
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 15, left: 15),
                                                      child: Text(
                                                        'You can also name your batches according to time. Ex- Class 12th (6AM)',
                                                        style: GoogleFonts.inter(
                                                            textStyle: TextStyle(
                                                                color: Color(
                                                                    0xffA7A9B7))),
                                                      ),
                                                    ),

                                                    //Class name TextField
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 10, 10, 10),
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              10, 36, 10, 0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      child: TextField(
                                                        maxLength: 10,
                                                        decoration:
                                                            InputDecoration(
                                                          alignLabelWithHint:
                                                              false,
                                                          counterText: '',
                                                          border:
                                                              InputBorder.none,
                                                          icon:
                                                              SvgPicture.asset(
                                                            'assets/two_people.svg',
                                                            height: 25,
                                                            width: 25,
                                                          ),
                                                          hintText:
                                                              'Batch name',
                                                        ),
                                                        style: GoogleFonts.outfit(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16)),
                                                        keyboardType:
                                                            TextInputType.text,
                                                      ),
                                                    ),

                                                    //Next button
                                                    GestureDetector(
                                                        child: Container(
                                                          width: w,
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  18),
                                                          margin: EdgeInsets
                                                              .fromLTRB(10, 25,
                                                                  10, 50),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xff006C67),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Text(
                                                            'Next',
                                                            style: GoogleFonts.inter(
                                                                textStyle: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          btmPageController.nextPage(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      600),
                                                              curve: Curves
                                                                  .easeOut);
                                                        })
                                                  ],
                                                ),
                                                //Bottom sheet page 2
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      child: Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  15, 35, 0, 0),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_back_ios,
                                                                size: 16,
                                                                color: Color(
                                                                    0xff006C67),
                                                              ),
                                                              Text(
                                                                'Class 12th (6AM)',
                                                                style: GoogleFonts.inter(
                                                                    textStyle: TextStyle(
                                                                        color: Color(
                                                                            0xff006C67),
                                                                        fontSize:
                                                                            15)),
                                                              )
                                                            ],
                                                          )),
                                                      onTap: () {
                                                        btmPageController
                                                            .previousPage(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        600),
                                                                curve: Curves
                                                                    .easeOut);
                                                      },
                                                    ),
                                                    //Enter class name
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 15),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Enter Monthly Fees',
                                                        style: GoogleFonts.inter(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 24,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ),
                                                    ),

                                                    //subtitle
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 15, left: 15),
                                                      child: Text(
                                                        'Monthly fees to be collected from the students . Ex - 500 per month',
                                                        style: GoogleFonts.inter(
                                                            textStyle: TextStyle(
                                                                color: Color(
                                                                    0xffA7A9B7))),
                                                      ),
                                                    ),

                                                    //Class name TextField
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 10, 10, 10),
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              10, 36, 10, 0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                      ),
                                                      child: TextField(
                                                        maxLength: 10,
                                                        decoration:
                                                            InputDecoration(
                                                          alignLabelWithHint:
                                                              false,
                                                          counterText: '',
                                                          border:
                                                              InputBorder.none,
                                                          icon:
                                                              SvgPicture.asset(
                                                            'assets/inr_round.svg',
                                                            height: 25,
                                                            width: 25,
                                                          ),
                                                          hintText: '500',
                                                        ),
                                                        style: GoogleFonts.outfit(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16)),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                      ),
                                                    ),

                                                    //Next button
                                                    GestureDetector(
                                                      child: Container(
                                                        width: w,
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            EdgeInsets.all(18),
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                10, 25, 10, 50),
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xff006C67),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Text(
                                                          'Finish adding class',
                                                          style: GoogleFonts.inter(
                                                              textStyle: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
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
                  )),

                  //if not empty
                  Batches(
                      name: kBatch[0]['name'],
                      subject: kBatch[0]['subject'],
                      paidNum: kBatch[0]['feesPaid'],
                      link: classes(
                          batchName: 'Class 12th(6am)',
                          pendingFees: 2500,
                          collectedFees: 10000),
                      studentNum: kBatch[0]['totalStu']),
                ],
              )),
            ],
          ),
        ),
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
