import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nitoons_assessment/constants/app_textstyles.dart';
import 'package:nitoons_assessment/constants/assets_name.dart';
import 'package:nitoons_assessment/data/dummy_data.dart';
import 'package:nitoons_assessment/pages/home_page/navigation_pages/navigation_home_page/post_view.dart';

class NavHomePage extends ConsumerStatefulWidget {
  const NavHomePage({super.key});

  @override
  ConsumerState<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends ConsumerState<NavHomePage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: dummyData.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return PostView(
                pageIndex: index,
              );
            },
          ),
          Positioned(
            top: 38,
            right: 14,
            left: 23,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Discover',
                  style: AppTextStyles.headline,
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    searchIcon,
                    width: 20,
                    height: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
