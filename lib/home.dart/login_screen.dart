import 'package:exampleapplication/home.dart/otp_screen.dart';
import 'package:flutter/cupertino.dart';
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
                    color: Colors.black)),
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

        const SizedBox(
          height: 20,
        ),

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
            onPressed: () {
              //if less than 10 digits
              if (phoneNumber.length < 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Phone number not correct')));
                setState(() {
                  gre = Colors.red;
                });
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OTPScreen(phoneNumber.text)));
              }
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
