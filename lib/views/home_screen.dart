import 'package:exampleapplication/views/dashboard_screen.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/classes.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/profile.dart';
import 'package:exampleapplication/widgets/app_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();

  /// initializing controller for PageView

  int currentIndex = 0;
  final tabPages = [
    const DashboardScreen(),
    ClassTile(
      batchName: 'Class 12th(6am)',
      pendingFees: 2500,
      collectedFees: 10000,
    ),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          },
          selectedItemColor: const Color(0xff0D5F5A),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
              icon: SvgAssetImage(
                imagePath: 'assets/dashboard_default.svg',
                color:
                    currentIndex == 0 ? const Color(0xff0D5F5A) : Colors.grey,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: SvgAssetImage(
                imagePath: 'assets/classes_default.svg',
                color:
                    currentIndex == 1 ? const Color(0xff0D5F5A) : Colors.grey,
              ),
              label: 'Classes',
            ),
            BottomNavigationBarItem(
              icon: SvgAssetImage(
                imagePath: 'assets/profile_default.svg',
                color:
                    currentIndex == 2 ? const Color(0xff0D5F5A) : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: tabPages,
      ),
    );
  }
}
