import 'package:exampleapplication/view_model/providers.dart';
import 'package:exampleapplication/views/home/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(appStateViewModelProvider).user!;
    Color nameClr = Colors.grey;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Name',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: nameClr),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        enabled: false,
                        initialValue: user.name,
                        decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff006C67),
                          ),
                          hintText: 'Name',
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),

              //Phone number
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone number',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        enabled: false,
                        initialValue: user.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xff006C67),
                          ),
                          hintText: '888-991-2344',
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50, bottom: 50),
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About us',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //About us 3 sections
                    Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //FAQ
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/faq.svg',
                                  height: 25,
                                  width: 25,
                                ),
                                Text(
                                  '  FAQ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )
                              ],
                            ),
                            onTap: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('FAQ'),
                                duration: Duration(microseconds: 200),
                              ),
                            ),
                          ),

                          //Privacy Policy
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/privacy_policy.svg',
                                  height: 25,
                                  width: 25,
                                ),
                                Text(
                                  '  Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )
                              ],
                            ),
                            onTap: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Privacy Policy'),
                                duration: Duration(microseconds: 200),
                              ),
                            ),
                          ),

                          //Contact us
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/contact_us.svg'),
                                Text(
                                  '  Contact us',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )
                              ],
                            ),
                            onTap: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Contact us'),
                                duration: Duration(microseconds: 200),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 25,
                                  color: Color(0xff006C67),
                                ),
                                Text(
                                  '  Logout',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                )
                              ],
                            ),
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Signin()),
                                (route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
