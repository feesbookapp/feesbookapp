import 'package:exampleapplication/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 40,
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xff6d6d6d),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          alignment: Alignment.bottomCenter,
          child: Text(
            'Registered Successfully',
            style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 20, 30, 25),
          child: Text(
            'Your account has been created, Start managing and collecting your fees digitally',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(textStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        GestureDetector(
          onTap: (() {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }),
          child: Container(
            margin: EdgeInsets.only(left: 24, right: 24, bottom: 60),
            width: w,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff006C67)),
            child: Center(
              child: Text(
                'Take me to home',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
