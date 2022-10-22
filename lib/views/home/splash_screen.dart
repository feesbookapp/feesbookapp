import 'package:exampleapplication/view_model/providers.dart';
import 'package:exampleapplication/views/home/sign_in.dart';
import 'package:exampleapplication/views/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final userLoggedIn = FirebaseAuth.instance.currentUser != null;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    if (!userLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Signin(),
        ),
      );
      return;
    }

    await _getUser();
  }

  Future<void> _getUser() async {
    await ref.read(appStateViewModelProvider.notifier).getUserFromFirebase();

    await ref.read(appStateViewModelProvider.notifier).getUserInstitute();
    await ref.read(appStateViewModelProvider.notifier).getInstituteClasses();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Splash Screen'),
          ],
        ),
      ),
    );
  }
}
