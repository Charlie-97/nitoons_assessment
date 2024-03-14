import 'package:flutter/material.dart';
import 'package:nitoons_assessment/constants/assets_name.dart';
import 'package:nitoons_assessment/constants/app_colors.dart';
import 'package:nitoons_assessment/constants/routes.dart';
import 'package:nitoons_assessment/pages/home_page/navigation_pages/navigation_fyp_page.dart';
import 'package:nitoons_assessment/pages/home_page/navigation_pages/navigation_home_page/navigation_home_page.dart';
import 'package:nitoons_assessment/pages/home_page/navigation_pages/navigation_messages_page.dart';
import 'package:nitoons_assessment/pages/home_page/navigation_pages/navigation_profile_page.dart';
import 'package:nitoons_assessment/widgets/nav_bar_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;
  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.pushNamed(context, addPage);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: NavBarItem(icon: homeIcon),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavBarItem(icon: fypIcon),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavBarItem(icon: addIcon),
                activeIcon: ActiveNavBarItem(
                  icon: addIcon,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavBarItem(icon: messageIcon),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: NavBarItem(icon: profileIcon),
                label: '',
              ),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: MediaQuery.of(context).size.width / 5 * _currentIndex,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 2,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: _widgetOption[_currentIndex],
    );
  }

  final List<Widget> _widgetOption = [
    const NavHomePage(),
    const NavFypPage(),
    const Placeholder(),
    const NavMessagesPage(),
    const NavProfilePage(),
  ];
}
