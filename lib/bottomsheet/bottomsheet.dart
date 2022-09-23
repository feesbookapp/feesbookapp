import 'package:exampleapplication/bottomsheet/classes.dart';
import 'package:exampleapplication/bottomsheet/homepage.dart';
import 'package:exampleapplication/bottomsheet/profile.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Bottompage extends StatefulWidget {
  Bottompage({Key? key}) : super(key: key);

  @override
  _BottompageState createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {
  int currentIndex = 0;
  final screens = [Homepage(), classes(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        backgroundColor: Colors.white70,
        selectedIndex: currentIndex,
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            activeColor: Color(0xff0D5F5A),
            inactiveColor: Colors.grey,
            title: Text('Dashboard  '),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.class_outlined,
            ),
            activeColor: Color(0xff0D5F5A),
            inactiveColor: Colors.grey,
            title: Text('classes'),
          ),
          BottomNavyBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            title: Text('Profile'),
            activeColor: Color(0xff0D5F5A),
            inactiveColor: Colors.grey,
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
