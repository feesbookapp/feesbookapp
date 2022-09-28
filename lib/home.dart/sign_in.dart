import 'package:exampleapplication/home.dart/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: h * 0.75,
            width: w,
            child: PageView(
              controller: PageController(keepPage: false),
              clipBehavior: Clip.hardEdge,
              allowImplicitScrolling: true,
              padEnds: false,
              children: <Widget>[
                Swipe1(),
                Swipe2(),
                Swipe3(),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),

              //GetStarted
              GestureDetector(
                child: Container(
                  height: 65,
                  width: w,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Color(0xff006C67),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Get started',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                    ),
                  ),
                ),
                onTap: () {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content: Text('Get Started'),
                  //   duration: Duration(microseconds: 200),
                  // ));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),

              SizedBox(
                height: 10,
              ),

              //WhatsApp need help?
              GestureDetector(
                child: Container(
                  height: 65,
                  width: w,
                  margin: EdgeInsets.only(left: 20, right: 20),
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
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Need help?',
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Need help?'),
                    duration: Duration(microseconds: 200),
                  ));
                },
              ),
            ],
          ))
        ],
      )),
    );
  }
}

//Swping page 1
class Swipe1 extends StatelessWidget {
  const Swipe1({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Welcome to Feesbook';
    String subtitle =
        'Digital fees management solution specialy build for coaching teachers';
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 50,
        ),

        //Illustration
        Container(
          height: 400,
          decoration: BoxDecoration(
              // color: Colors.grey,
              image:
                  DecorationImage(image: AssetImage('assets/onboarding.png'))),
        ),

        SizedBox(
          height: 25,
        ),

        //Title
        Text(
          title,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          )),
        ),

        //Subtitle
        Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 15),
          child: Text(
            subtitle,
            style: GoogleFonts.inter(textStyle: TextStyle(color: Colors.grey)),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ));
  }
}

class Swipe2 extends StatelessWidget {
  const Swipe2({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Track collected, pending fees';
    String subtitle =
        'Keep a track of pending and collected fees of your students digitally';
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 50,
        ),

        //Illustration
        Container(
          height: 400,
          decoration: BoxDecoration(
              // color: Colors.grey,
              image:
                  DecorationImage(image: AssetImage('assets/onboarding.png'))),
        ),

        SizedBox(
          height: 25,
        ),

        //Title
        Text(
          title,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          )),
        ),

        //Subtitle
        Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 15),
          child: Text(
            subtitle,
            style: GoogleFonts.inter(textStyle: TextStyle(color: Colors.grey)),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ));
  }
}

class Swipe3 extends StatelessWidget {
  const Swipe3({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Send reminders to collect fees';
    String subtitle =
        'Send reminders through whatsapp to collect fees from every students';
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 50,
        ),

        //Illustration
        Container(
          height: 400,
          decoration: BoxDecoration(
              // color: Colors.grey,
              image:
                  DecorationImage(image: AssetImage('assets/onboarding.png'))),
        ),

        SizedBox(
          height: 25,
        ),

        //Title
        Text(
          title,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          )),
        ),

        //Subtitle
        Padding(
          padding: EdgeInsets.only(left: 25, right: 25, top: 15),
          child: Text(
            subtitle,
            style: GoogleFonts.inter(textStyle: TextStyle(color: Colors.grey)),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ));
  }
}
