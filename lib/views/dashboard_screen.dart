import 'package:exampleapplication/Widgets/batches.dart';
import 'package:exampleapplication/data/firestore_collection_path.dart';
import 'package:exampleapplication/models/user.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/classes.dart';
import 'package:exampleapplication/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final pendingFees = '2,500';
  final collectedFees = '10,000';
  final tuitionName = 'Balaji tutorials';
  final city = 'Manglore';

  final bool doesClassExists = true;
  final List<Class> _classes = [];

  Institute? institute;

  List classes = [
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

  @override
  void initState() {
    super.initState();
  }

  Future<void> getInstitute() async {
    final userId = '47NSr25XTqgTGCdrIVGe';
    final institutionDoc = await FirebaseCollectionPath.institutes
        .where('owner', isEqualTo: '/Users/$userId')
        .limit(1)
        .get();
  }

  Future<void> getClasses() async {
    // await
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: doesClassExists ? 24 : 0,
          ),
          child: doesClassExists
              ? Column(
                  children: [
                    _DashboardHeader(
                      institutionName: tuitionName,
                      city: city,
                      pendingFees: pendingFees,
                      collectedFees: collectedFees,
                    ),
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Add a batch >>>',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(18),
                        margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        launch('https://wa.me/+918303823055');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Need help?'),
                            duration: Duration(microseconds: 200),
                          ),
                        );
                      },
                    )
                  ],
                )
              : Batches(
                  name: classes[0]['name'],
                  subject: classes[0]['subject'],
                  paidNum: classes[0]['feesPaid'],
                  link: ClassTile(
                      batchName: 'Class 12th(6am)',
                      pendingFees: 2500,
                      collectedFees: 10000),
                  studentNum: classes[0]['totalStu'],
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${institutionName}, ${city}',
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
