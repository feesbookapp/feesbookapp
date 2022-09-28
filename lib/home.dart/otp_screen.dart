import 'package:exampleapplication/bottomsheet/homepage.dart';
import 'package:exampleapplication/home.dart/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../onboardingscreens.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: OTPBody(),
    ));
  }

  Widget OTPBody() {
    //Variables
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    //Theme

    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: h * 0.1,
        ),

        //illustration
        Container(
          width: w,
          child: Center(
            child: Container(
              width: w * 0.8,
              height: w * 0.8,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/onboarding.png')),
              ),
            ),
          ),
        ),

        SizedBox(
          height: h * 0.1,
        ),

        //Title
        Container(
          margin: EdgeInsets.only(left: 24, right: 24),
          alignment: Alignment.centerLeft,
          child: Text(
            'Enter OTP',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black)),
          ),
        ),

        //SubTitle
        GestureDetector(
          child: Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 10),
              child: RichText(
                text: TextSpan(
                  text:
                      'A 6 digit one time password has been sent to your phone number ',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 18, wordSpacing: 1),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.phone,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff006C67),
                            fontSize: 16)),
                    TextSpan(
                        text: '. Edit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff006C67),
                            fontSize: 16)),
                  ],
                ),
              )),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),

        const SizedBox(
          height: 20,
        ),

        //OTP
        Container(
          padding: EdgeInsets.all(10),
          child: Pinput(
            length: 6,
          ),
        ),

        //Button
        Container(
          width: w,
          height: 60,
          margin: EdgeInsets.all(25),
          child: ElevatedButton(
            onPressed: () {
              //Send OTP
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xff006C67)),
            ),
          ),
        ),
      ],
    ));
  }
}
