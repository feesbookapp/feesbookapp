import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exampleapplication/env/app_env.dart';
import 'package:exampleapplication/env/dev_env.dart';
import 'package:exampleapplication/views/home/sign_in.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper/utils.dart';

void main({AppEnvironment? environment}) async {
  final env = environment ?? DevEnvironment();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Widget app = MyApp();

  if (env.type != AppEnvType.prod && kDebugMode) {
    app = Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        location: BannerLocation.topStart,
        message: env.type.name,
        color: Colors.green.withOpacity(0.6),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12.0,
          letterSpacing: 1.0,
        ),
        textDirection: TextDirection.ltr,
        child: app,
      ),
    );
  }

  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool doctor = false;
  final _stream = FirebaseAuth.instance.authStateChanges();

  @override
  void initState() {
    super.initState();
    checkRole();
  }

  Future<void> checkRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    doctor = (pref.getBool('doctorRole') ?? true);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointment Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: _stream,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            log('Loading');
            return Loading();
          } else if (doctor) {
            if (userSnapshot.data != null) {
              log('Logged in');
              return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("doctors")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return Loading();
                  } else {
                    if (snapShot.hasData) {
                      return Homepage();
                    }
                    log('Has no data');
                    return Homepage();
                  }
                },
              );
            }
          } else if (!doctor) {
            if (userSnapshot.data != null) {
              log('Logged in');
              return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var data = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Loading();
                  } else {
                    if (snapshot.hasData) {
                      return Homepage();
                    }
                    log('Has no data');
                    return Homepage();
                  }
                },
              );
            }
          }
          log('UserSnapshot = null');
          return Signin();
        },
      ),
    );
  }
}
