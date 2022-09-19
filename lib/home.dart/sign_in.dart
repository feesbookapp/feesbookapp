import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_screen.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getStarted(),
    );
  }
  Widget getStarted() {
    int y = x%3;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    //List
    List text_info = [
      {
        'title' : 'Welcome to Feesbook',
        'subtitle' : 'Digital fees management solution specially build for coaching teachers',
        'illustration' : AssetImage('assets/onboarding.png'),
        'color1' : Colors.black,
        'color2' : Colors.grey.withOpacity(0.5),
        'color3' : Colors.grey.withOpacity(0.5),
      },
      {
        'title' : 'Track collected, pending fees',
        'subtitle' : 'Keep a track of pending and collected fees of your students digitally',
        'illustration' : AssetImage('assets/onboarding.png'),
        'color1' : Colors.grey.withOpacity(0.5),
        'color2' : Colors.black,
        'color3' : Colors.grey.withOpacity(0.5)
      },
      {
        'title' : 'Send reminders to collect fees',
        'subtitle' : 'Send reminders through whatsapp to collect fees from every students',
        'illustration' : AssetImage('assets/onboarding.png'),
        'color1' : Colors.grey.withOpacity(0.5),
        'color2' : Colors.grey.withOpacity(0.5),
        'color3' : Colors.black
      },

    ];

    return SafeArea(child: SingleChildScrollView(child: Column(
      children: [
        SizedBox(height: h*0.2),

        //Content

        //Illustration
          Center(child: Container(height: h*0.3, width: h*0.3 , decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/onboarding.png'),)), )),

          //Sized box
          SizedBox(height: h*0.1,),

          //Welcome to Feesbook
          Container(width: w, child: Center(child: Text(text_info[y]['title'], style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black) ,)),),

          //description
          Container(width: w, padding: EdgeInsets.only(left: 30,top: 10 ,right: 30),child: Center(child: Text(text_info[y]['subtitle'], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal,)),textAlign: TextAlign.center,),),),


        //three dots
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 10,
          width: w,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(height: 10, width: 10, color: text_info[y]['color1'],),
              SizedBox(width: 10,),
              Container(height: 10, width: 10, color: text_info[y]['color2'],),
              SizedBox(width: 10,),
              Container(height: 10, width: 10, color: text_info[y]['color3'],),
              SizedBox(width: 10,),
            ],),
          ),
        ),

        //Sized box
        SizedBox(height: h*0.06,),



        //next
        // Center(child: Container(width: h*0.08, height: h*0.08, decoration: BoxDecoration(color: Color(0xff006C67), borderRadius: BorderRadius.circular(200)), child: Center(child: Icon(Icons.navigate_next, color: Colors.white, size: 50,)),),),

        //next
        GestureDetector(
          onTap: () {
            x++;
            setState(() {
              // Toggle light when tapped.
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Clicked'), duration: Duration(milliseconds: 500),));
              if(y==2){
                Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
              }
            });
          },
          child: Container(
            width: h*0.08,
            height: h*0.08,
            decoration: BoxDecoration(
              color: Color(0xff006C67),
              borderRadius: BorderRadius.circular(200)
            ),
            // Change button text when light changes state.
            child: Center(child: Icon(Icons.navigate_next, size: 40, color: Colors.white,),)
          ),
        ),
      ],
    ))
    );
  }
}
