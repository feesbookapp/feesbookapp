import 'dart:developer';

import 'package:exampleapplication/views/home/otp_screen.dart';
import 'package:exampleapplication/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumber = new TextEditingController();
  bool _loading = false;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: getBody(),
    ));
  }

  Widget getBody() {
    //Controllers

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    //Theme
    var gre = Colors.grey;

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
            'Enter your phone number',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
        ),

        //SubTitle
        Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 10),
            child: Text(
              'We will verify your phone number to keep your data secure',
              style:
                  TextStyle(color: Colors.grey, fontSize: 16, wordSpacing: 1),
            )),

        const SizedBox(height: 20),

        //Phone number
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: gre),
          ),
          child: TextField(
            maxLength: 10,
            controller: phoneNumber,
            decoration: InputDecoration(
              alignLabelWithHint: false,
              counterText: '',
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.phone,
                color: Color(0xff006C67),
              ),
              hintText: 'Phone number',
            ),
            keyboardType: TextInputType.phone,
          ),
        ),

        //Button
        Container(
          width: w,
          height: 60,
          margin: EdgeInsets.all(25),
          child: ElevatedButton(
            onPressed: _loading
                ? null
                : () async {
                    //if less than 10 digits
                    if (phoneNumber.length < 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Phone number not correct')));
                      setState(() {
                        gre = Colors.red;
                      });
                      return;
                    }

                    setState(() {
                      _loading = true;
                    });

                    await sendOneTimeCode();
                  },
            child: _loading
                ? const CircularProgressIndicator()
                : Text(
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

  Future<void> sendOneTimeCode() async {
    await _auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: '+91${phoneNumber.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign in successful')));

        try {
          await _auth.signInWithCredential(credential);

          setState(() {
            _loading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } catch (e, s) {
          setState(() {
            _loading = false;
          });

          if (e is FirebaseAuthException) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.message ?? e.code)),
            );
          } else {
            if (kDebugMode) {
              log(e.toString());
              log(s.toString());
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Something went wrong. Please try again later.'),
              ),
            );
          }
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _loading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? e.code)),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _loading = false;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              phone: phoneNumber.text,
              verificationId: verificationId,
              resendToken: resendToken,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Your network connect is slow. Please try again.')));
      },
    );
  }
}
