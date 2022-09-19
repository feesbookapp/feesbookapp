import 'package:exampleapplication/Registration.dart';
import 'package:exampleapplication/bottomsheet/homepage.dart';
import 'package:exampleapplication/bottomsheet/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: onBoardingBody(),)
    );
  }
  Widget onBoardingBody() {


    //Variables
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    //Theme


    return SafeArea(child: Column(
      children: [
        SizedBox(height: h*0.1,),

        //illustration
        Container(width: w, child: Center(child: Container(
          width: w*0.8,
          height: w*0.8,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/onboarding.png')),
          ),
        ),),),

        SizedBox(height: h*0.1,),

        //Title
        Container(margin: EdgeInsets.only(left: 24, right: 24),alignment: Alignment.centerLeft ,child: Text('Enter your name', style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),),),

        //SubTitle
        Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 5),
              child: Text('We would love to hear your name to serve you better', style: TextStyle(color: Colors.grey, fontSize: 16, ),)),


        const SizedBox(height: 20,),

        //Name
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.person,color: Color(0xff006C67),),
              hintText: 'Name',
            ),
            keyboardType: TextInputType.name,
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
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>  Homepage()));
              showDialog(context: context, builder: (BuildContext context){

                return SuccessfulPopup();
              });
            },

            child: Text('Submit', style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff006C67)),
            ),
          ),
        ),
      ],
    ));
  }
}
class SuccessfulPopup extends StatelessWidget {
  const SuccessfulPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      child: Stack(
        children: [
          Container(
            height: h*0.5 ,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Congrats
                Center(child: Text('Congratulations!', style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  )
                ),),),

                //Sized box
                SizedBox(height: 20,),

                //SVG
                Center(child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: h*0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),),

                SizedBox(height: 20,),

                //Registered successfully
                Text('Registered successfully', style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 20),),


                //Your account has been created
                // Container(
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   child: Text('Your account has been created, start managing and collecting your fees digitally', style: GoogleFonts.inter(
                //     textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey,),),
                //     textAlign: TextAlign.center,
                //   ),
                // ),


                //Button
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  height: 60, width: w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  Homepage()));
                    },
                    child: Text('Home'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
