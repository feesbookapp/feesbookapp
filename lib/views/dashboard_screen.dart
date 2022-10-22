import 'package:exampleapplication/Widgets/batches.dart';
import 'package:exampleapplication/view_model/providers.dart';
import 'package:exampleapplication/views/add_class_screen.dart';
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
                          'Add a class >>>',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return AddClassScreen();
                          },
                        );
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
