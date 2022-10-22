import 'package:exampleapplication/env/app_env.dart';
import 'package:exampleapplication/env/dev_env.dart';
import 'package:exampleapplication/views/home/sign_in.dart';
import 'package:exampleapplication/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  runApp(
    ProviderScope(child: app),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userLoggedIn = FirebaseAuth.instance.currentUser != null;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointment Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: userLoggedIn ? HomeScreen() : Signin(),
    );
  }
}
