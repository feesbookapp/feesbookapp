import 'package:exampleapplication/view_model/providers.dart';
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

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    setState(() {
      _loading = true;
    });

    await ref.read(appStateViewModelProvider.notifier).getUserInstitute();
    await ref.read(appStateViewModelProvider.notifier).getInstituteClasses();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Scaffold(body: Center(child: CircularProgressIndicator()))
        : Scaffold(
            bottomNavigationBar: Container(
              height: 70,
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
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
                      color: _currentIndex == 0
                          ? const Color(0xff0D5F5A)
                          : Colors.grey,
                    ),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgAssetImage(
                      imagePath: 'assets/classes_default.svg',
                      color: _currentIndex == 1
                          ? const Color(0xff0D5F5A)
                          : Colors.grey,
                    ),
                    label: 'Classes',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgAssetImage(
                      imagePath: 'assets/profile_default.svg',
                      color: _currentIndex == 2
                          ? const Color(0xff0D5F5A)
                          : Colors.grey,
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
                  _currentIndex = index;
                });
              },
              children: _tabPages,
            ),
          );
  }
}
