import 'package:exampleapplication/views/dashboard_screen.dart';
import 'package:exampleapplication/views/home_screen.dart';
import 'package:exampleapplication/views/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassTile extends StatefulWidget {
  final String batchName;
  final int pendingFees;
  final int collectedFees;

  ClassTile(
      {Key? key,
      required this.batchName,
      required this.pendingFees,
      required this.collectedFees})
      : super(key: key);

  @override
  State<ClassTile> createState() => _ClassTileState();
}

class _ClassTileState extends State<ClassTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var w = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;
    return Column(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
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
                        widget.batchName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      GestureDetector(
                        child: Row(
                          children: [
                            Text(
                              'View full report',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color(0xff006C67), fontSize: 14)),
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
                      child: FeesInfo(Color(0xffFCEEEE), 'Pending Fees',
                          widget.pendingFees, Color(0xff9D0709)),
                      height: 84,
                      width: w / 2 - 22,
                    ),
                    //Green box
                    Container(
                      height: 84,
                      width: w / 2 - 22,
                      child: FeesInfo(Color(0xffE9EDEC), 'Total collected',
                          widget.collectedFees, Color(0xff006C67)),
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
        Container(
          width: w,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),

              //Students + add class
              Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Students',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '+ Add student',
                        style: TextStyle(
                            color: Color(0xff006C67),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 24,
              ),

              //Student info
              StudentInfo(
                studentName: 'Harshit Pathak',
                subject: 'Chemistry',
                paidMonths: 6,
              )
            ],
          ),
        )
      ],
    );
  }
}

class StudentInfo extends StatelessWidget {
  final String studentName;
  final String subject;
  final int paidMonths;

  const StudentInfo(
      {super.key,
      required this.studentName,
      required this.subject,
      required this.paidMonths});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
        width: w,
        margin: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 6)
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                studentName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              Text('$paidMonths/10 months paid',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 8,
              ),
              SvgPicture.asset('img/progress.svg'),
              const SizedBox(
                height: 26,
              ),
              GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffE6F0F0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "View ",
                            style: TextStyle(
                              color: Color(0xff09635E),
                              fontSize: 16,
                            )),
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Color(0xff09635E),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Student(
                                stuName: studentName,
                              )));
                },
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                child: Center(
                    child: Text(
                  'Send fees reminder',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                )),
                onTap: (() => ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Send Reminder')))),
              ),
              const SizedBox(
                height: 26,
              ),
            ],
          ),
        ));
  }
}
