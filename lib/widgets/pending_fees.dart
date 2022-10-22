import 'package:exampleapplication/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingFees extends StatefulWidget {
  final startMonth;
  final endMonth;
  final fees;
  const PendingFees(
      {super.key,
      required this.startMonth,
      required this.endMonth,
      required this.fees});

  @override
  State<PendingFees> createState() => _PendingFeesState();
}

class _PendingFeesState extends State<PendingFees> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    var w = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(15, 6, 15, 6),
      padding: EdgeInsets.all(10),
      width: w,
      height: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.25))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffF2F4F9),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: selected
                        ? SvgAssetImage(
                            imagePath: 'assets/tick_mark.svg',
                          )
                        : Icon(Icons.circle)
                    // ? null
                    // : SvgAssetImage(
                    //     imagePath: 'assets/tick_mark.svg',
                    //   )
                    ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monthly fees',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                Text(
                  '${widget.startMonth} - ${widget.endMonth}',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                )
              ],
            ),
            Spacer(
              flex: 10,
            ),
            Text(
              '₹${widget.fees}',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            )
          ]),
    );
  }
}
