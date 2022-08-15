import 'package:flutter/material.dart';

// import 'package:lottie/lottie.dart';

import '../Helper/dimensions.dart';
import 'login_screen.dart';
// import 'package:glassmorphism/glassmorphism.dart';

// String? finalPhone;

var vpH, vpW;

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => SigninState();
}

class SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    vpH = getViewportHeight(context);
    vpW = getViewportWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              // Image.asset(
              //   // "images/1.jpg",
              //   // 'images/background.jpg',
              //   'images/Glassmorphism.jpg',
              //   fit: BoxFit.cover,
              //   height: double.infinity,
              //   width: double.infinity,
              //   scale: 1,
              // ),
              SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white24,
                        radius: 100,
                        // child: LottieBuilder.asset('images/healthcare.json'),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      SizedBox(
                        height: 50,
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              // side: BorderSide(
                              //   color: Colors.b,
                              //   width: 3,
                              // ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            primary: Colors.white24,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  isowner: false,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in as User',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // SizedBox(
                      //   height: 50,
                      //   width: 280,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       shape: RoundedRectangleBorder(
                      //         // side: BorderSide(
                      //         //   color: Colors.blueGrey,
                      //         //   width: 3,
                      //         // ),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       primary: Colors.white24,
                      //       onPrimary: Colors.white,
                      //     ),
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => LoginScreen(
                      //             isowner: true,
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //     child: Text(
                      //       'Sign in as Doctor',
                      //       style: TextStyle(
                      //         fontFamily: 'Montserrat',
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
