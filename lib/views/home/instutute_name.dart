import 'package:exampleapplication/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstituteName extends StatefulWidget {
  const InstituteName({Key? key}) : super(key: key);

  @override
  State<InstituteName> createState() => _InstituteNameState();
}

class _InstituteNameState extends State<InstituteName> {
  TextEditingController _instituteName = new TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: instututeBody(),
      ),
    );
  }

  Widget instututeBody() {
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
                  image: DecorationImage(
                      image: AssetImage('assets/onboarding.png')),
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
              'Your Institute name',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black),
              ),
            ),
          ),

          //SubTitle
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 10),
            child: Text(
              'We would love to hear your name to serve you better',
              style:
                  TextStyle(color: Colors.grey, fontSize: 16, wordSpacing: 1),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //Phone number
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 10, 10, 5),
            margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: gre),
            ),
            child: TextField(
              controller: _instituteName,
              decoration: InputDecoration(
                alignLabelWithHint: false,
                counterText: '',
                border: InputBorder.none,
                hintText: 'Ex. Baba Tutorials',
              ),
              keyboardType: TextInputType.text,
            ),
          ),

          //Button
          Container(
            width: w,
            height: 60,
            margin: EdgeInsets.all(25),
            child: ElevatedButton(
              onPressed: () {
                if (_instituteName.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter your name'),
                    ),
                  );
                } else {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Color(0xfff3f3f3),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12))),
                    context: context,
                    builder: (context) => Column(
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
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 20, 30, 25),
                          child: Text(
                            'Your account has been created, Start managing and collecting your fees digitally',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 24, right: 24, bottom: 60),
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
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
              child: _loading
                  ? const CircularProgressIndicator()
                  : Text(
                      'Get started',
                      style: TextStyle(color: Colors.white),
                    ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Color(0xff006C67),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
