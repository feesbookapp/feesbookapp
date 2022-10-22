import 'package:exampleapplication/views/dashboard_screen.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/classes.dart';
import 'package:exampleapplication/views/widgets/bottomsheet/profile.dart';
import 'package:exampleapplication/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final PageController controller = PageController();
  int _currentIndex = 0;
  final _tabPages = [
    const DashboardScreen(),
    ClassTile(
      batchName: 'Class 12th(6am)',
      pendingFees: 2500,
      collectedFees: 10000,
    ),
    Profile(),
  ];

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: _changeTab,
        children: _tabPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _changeTab(index);
          controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        selectedItemColor: const Color(0xff0D5F5A),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            icon: SvgAssetImage(
              imagePath: 'assets/dashboard_default.svg',
              color: _currentIndex == 0 ? const Color(0xff0D5F5A) : Colors.grey,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: SvgAssetImage(
              imagePath: 'assets/classes_default.svg',
              color: _currentIndex == 1 ? const Color(0xff0D5F5A) : Colors.grey,
            ),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: SvgAssetImage(
              imagePath: 'assets/profile_default.svg',
              color: _currentIndex == 2 ? const Color(0xff0D5F5A) : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
