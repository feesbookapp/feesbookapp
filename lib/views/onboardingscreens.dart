import 'package:exampleapplication/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: onBoardingBody(),
    ));
  }

  Widget onBoardingBody() {
    //Variables
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    final pageController = PageController(initialPage: 1);

    //Theme
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: [
        Page1(),
        Page2(),
        Page3(),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: Colors.red,
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: Colors.black,
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: Colors.blue,
    );
  }
}

class SuccessfulPopup extends StatelessWidget {
  const SuccessfulPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Container(
            height: h * 0.5,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Congrats
                Center(
                  child: Text(
                    'Congratulations!',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    )),
                  ),
                ),

                //Sized box
                SizedBox(
                  height: 20,
                ),

                //SVG
                Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: h * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //Registered successfully
                Text(
                  'Registered successfully',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 20),
                ),

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
                  height: 60,
                  width: w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text('Home'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
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
