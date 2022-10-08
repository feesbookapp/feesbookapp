import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exampleapplication/data/firestore_collection_path.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  final String verificationId;
  final int? resendToken;

  OTPScreen({
    required this.phone,
    required this.verificationId,
    required this.resendToken,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? otpCode;
  bool _loading = false;

  final _auth = FirebaseAuth.instance;

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
        SizedBox(height: h * 0.1),

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
                    color: Color.fromARGB(255, 0, 59, 56))),
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
                      color: Colors.grey, fontSize: 16, wordSpacing: 1),
                  children: <TextSpan>[
                    TextSpan(
                      text: '*******${widget.phone.substring(7)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff006C67),
                          fontSize: 16),
                    ),
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
            Navigator.of(context).pop();
          },
        ),

        const SizedBox(
          height: 20,
        ),

        //OTP
        Container(
          padding: EdgeInsets.all(10),
          child: Pinput(
            onChanged: (value) {
              otpCode = value;
            },
            length: 6,
            defaultPinTheme: PinTheme(
                height: 58,
                width: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffF8F9FB),
                    // color: Colors.black,
                    border:
                        Border.all(color: Color(0xff006C67).withOpacity(0.3)))),
            focusedPinTheme: PinTheme(
                height: 58,
                width: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xffF8F9FB),
                    // color: Colors.black,
                    border: Border.all(color: Color(0xff006C67)))),
          ),
        ),

        //Button
        Container(
          width: w,
          height: 60,
          margin: EdgeInsets.fromLTRB(25, 25, 25, 10),
          child: ElevatedButton(
            onPressed: _loading
                ? null
                : () async {
                    if (otpCode?.length != 6) {
                      return;
                    }

                    setState(() {
                      _loading = true;
                    });

                    final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpCode!,
                    );

                    try {
                      await _auth.signInWithCredential(credential);

                      final currentUser = _auth.currentUser!;

                      final userDoc = await FirestoreCollectionPath.users
                          .doc(currentUser.uid);

                      final firebaseUser = await userDoc.get();

                      if (!firebaseUser.exists) {
                        final userMap = {
                          'id': currentUser.uid,
                          'phone': currentUser.phoneNumber,
                          'name': currentUser.displayName,
                          'profilePicture': currentUser.photoURL,
                          'updatedAt': FieldValue.serverTimestamp().toString(),
                          'createdAt': FieldValue.serverTimestamp().toString(),
                        };

                        await userDoc.set(userMap);
                      }

                      setState(() {
                        _loading = false;
                      });

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Homepage()),
                        (Route<dynamic> route) => false,
                      );
                    } catch (e) {
                      setState(() {
                        _loading = false;
                      });

                      if (e is FirebaseAuthException) {
                        switch (e.code) {
                          case 'invalid-verification-code':
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'OTP is wrong. Please enter the correct OTP.',
                                ),
                              ),
                            );
                            break;

                          default:
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.message ?? e.code)),
                            );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Something went wrong. Please try again later.'),
                          ),
                        );
                      }
                    }
                  },
            child: _loading
                ? CircularProgressIndicator()
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

        //Didn’t receive the code? Resend
        Padding(
            padding: EdgeInsets.all(2),
            child: GestureDetector(
              child: RichText(
                text: TextSpan(
                    text: 'Didn’t receive the code?',
                    style: TextStyle(color: Color(0xffA7A9B7)),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Resend.',
                          style: TextStyle(
                            color: Colors.black,
                          ))
                    ]),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Resending code',
                  ),
                  duration: Duration(microseconds: 500),
                ));
              },
            ))
      ],
    ));
  }
}
