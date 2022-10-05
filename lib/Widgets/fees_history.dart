import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FeesHistory extends StatelessWidget {
  final String month;

  final int fees;
  const FeesHistory({super.key, required this.month, required this.fees});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
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
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xffF2F4F9),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: SvgPicture.asset('assets/arrow_bottom_left.svg')),
            ),
            Spacer(
              flex: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paid',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                Text(
                  '$month',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                )
              ],
            ),
            Spacer(
              flex: 10,
            ),
            Text(
              '₹$fees',
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
