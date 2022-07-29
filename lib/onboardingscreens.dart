import 'package:exampleapplication/loginpage.dart';
import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Onboardingscreens extends StatefulWidget {
  Onboardingscreens({Key? key}) : super(key: key);

  @override
  State<Onboardingscreens> createState() => _OnboardingscreensState();
}

class _OnboardingscreensState extends State<Onboardingscreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showBackButton: false,
          showNextButton: false,
          showDoneButton: false,
          showSkipButton: false,
          pages: [
            PageViewModel(
              title: 'Welcome to Feesbook',
              body:
                  'Digital fees management solution specialy build for coaching teachers',
              image: Image.asset(
                'assets/onboarding.png',
              ),
              footer: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 330,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        primary: Color(
                          0xff006C67,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginpage(),
                          ),
                        );
                      },
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: SizedBox(
                      height: 50,
                      width: 330,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        onPressed: () {
                          launch("https://wa.me/+918303823055");
                        },
                        icon: Icon(
                          Icons.whatsapp_rounded,
                          color: Colors.green,
                        ),
                        label: Text(
                          'Need help?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            PageViewModel(
              title: 'Track collected, pending fees',
              body:
                  'Keep a track of pending and collected fees of your students digitally',
              image: Image.asset(
                'assets/onboarding.png',
              ),
              footer: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 330,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        primary: Color(
                          0xff006C67,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginpage(),
                          ),
                        );
                      },
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: SizedBox(
                      height: 50,
                      width: 330,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        onPressed: () {
                          launch("https://wa.me/+918303823055");
                        },
                        icon: Icon(
                          Icons.whatsapp_rounded,
                          color: Colors.green,
                        ),
                        label: Text(
                          'Need help?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            PageViewModel(
              title: 'Send reminders to collect fees',
              body:
                  'Send reminders through whatsapp to collect fees from every students',
              image: Image.asset(
                'assets/onboarding.png',
              ),
              footer: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 330,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        primary: Color(
                          0xff006C67,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginpage(),
                          ),
                        );
                      },
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: SizedBox(
                      height: 50,
                      width: 330,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        onPressed: () {
                          launch("https://wa.me/+918303823055");
                        },
                        icon: Icon(
                          Icons.whatsapp_rounded,
                          color: Colors.green,
                        ),
                        label: Text(
                          'Need help?',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(12.0, 12.0),
            activeColor: Colors.black,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
