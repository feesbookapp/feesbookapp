import 'package:exampleapplication/Widgets/batches.dart';
import 'package:exampleapplication/view_model/providers.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/classes.dart';
import 'package:exampleapplication/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final institute = ref.watch(appStateViewModelProvider).institute!;

    final classes = ref.watch(appStateViewModelProvider).classes;
    final bool doesClassExists = classes != null && classes.isNotEmpty;

    final dashboardHeader = _DashboardHeader(
      institutionName: institute.name,
      city: '',
      pendingFees: '2500',
      collectedFees: '2500',
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: doesClassExists ? 0 : 24,
          ),
          child: doesClassExists
              ? Column(
                  children: [
                    dashboardHeader,
                    SizedBox(height: 16),
                    Batches(
                      name: classes[0].name,
                      subject: ' ',
                      paidNum: ' ',
                      link: ClassTile(
                        batchName: classes[0].name,
                        pendingFees: 2500,
                        collectedFees: 10000,
                      ),
                      studentNum: '',
                    ),
                  ],
                )
              : Column(
                  children: [
                    dashboardHeader,
                    Spacer(),
                    SvgAssetImage(imagePath: 'assets/no_batch.svg'),
                    Spacer(),
                    Text(
                      'Add your class',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start managing your fees collection\nby adding a class',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Container(
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
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8))),
                            context: context,
                            builder: (context) {
                              var h = MediaQuery.of(context).size.height;
                              var w = MediaQuery.of(context).size.width;

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
                                                  BorderRadius.circular(10)),
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
                                                            color: Colors.black,
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
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.fromLTRB(
                                                      15, 10, 10, 10),
                                                  margin: EdgeInsets.fromLTRB(
                                                      10, 36, 10, 0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.5)),
                                                  ),
                                                  child: TextField(
                                                    maxLength: 10,
                                                    decoration: InputDecoration(
                                                      alignLabelWithHint: false,
                                                      counterText: '',
                                                      border: InputBorder.none,
                                                      icon: SvgAssetImage(
                                                        imagePath:
                                                            'assets/two_people.svg',
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                      hintText: 'Batch name',
                                                    ),
                                                    style: GoogleFonts.outfit(
                                                        textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                          EdgeInsets.all(18),
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              10, 25, 10, 50),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xff006C67),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Text(
                                                        'Next',
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
                                                      btmPageController.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  600),
                                                          curve:
                                                              Curves.easeOut);
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
                                                      padding:
                                                          EdgeInsets.fromLTRB(
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
                                                            curve:
                                                                Curves.easeOut);
                                                  },
                                                ),
                                                //Enter class name
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 15),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Enter Monthly Fees',
                                                    style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            color: Colors.black,
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
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.fromLTRB(
                                                      15, 10, 10, 10),
                                                  margin: EdgeInsets.fromLTRB(
                                                      10, 36, 10, 0),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.5)),
                                                  ),
                                                  child: TextField(
                                                    maxLength: 10,
                                                    decoration: InputDecoration(
                                                      alignLabelWithHint: false,
                                                      counterText: '',
                                                      border: InputBorder.none,
                                                      icon: SvgAssetImage(
                                                        imagePath:
                                                            'assets/inr_round.svg',
                                                        height: 25,
                                                        width: 25,
                                                      ),
                                                      hintText: '500',
                                                    ),
                                                    style: GoogleFonts.outfit(
                                                        textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16)),
                                                    keyboardType:
                                                        TextInputType.text,
                                                  ),
                                                ),

                                                //Next button
                                                GestureDetector(
                                                  child: Container(
                                                    width: w,
                                                    alignment: Alignment.center,
                                                    padding: EdgeInsets.all(18),
                                                    margin: EdgeInsets.fromLTRB(
                                                        10, 25, 10, 50),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff006C67),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: Text(
                                                      'Finish adding class',
                                                      style: GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
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
                    GestureDetector(
                      child: Container(
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
                            SizedBox(width: 5),
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
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({
    Key? key,
    required this.institutionName,
    required this.city,
    required this.pendingFees,
    required this.collectedFees,
  }) : super(key: key);

  final String institutionName;
  final String city;
  final String pendingFees;
  final String collectedFees;

  @override
  Widget build(BuildContext context) {
    final _heading = institutionName + (city.isNotEmpty ? (', ' + city) : '');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _heading,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              "View full report",
              style: TextStyle(
                color: Color(0xff006C67),
                fontSize: 16,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
              color: Color(0xff006C67),
            ),
          ],
        ),
        SizedBox(height: 26),
        Row(
          children: [
            FeesInfo(
              Color(0xffFCEEEE),
              'Pending Fees',
              pendingFees,
              Color(0xff9D0709),
            ),
            SizedBox(width: 16),
            FeesInfo(
              Color(0xffE9EDEC),
              'Total collected',
              collectedFees,
              Color(0xff006C67),
            )
          ],
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
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              amount.toString(),
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
