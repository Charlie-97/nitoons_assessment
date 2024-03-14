import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nitoons_assessment/constants/app_colors.dart';

class NavBarItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  const NavBarItem({
    super.key,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 23,
      child: SvgPicture.asset(
        icon,
        // colorFilter: ColorFilter.mode(
        //   isSelected ? AppColors.black : AppColors.bottomNavIconColor,
        //   BlendMode.modulate,
        // ),
        fit: BoxFit.cover,
      ),
    );
  }
}

class ActiveNavBarItem extends StatelessWidget {
  final String icon;
  const ActiveNavBarItem({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 64,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 2,
            width: 53,
            decoration: BoxDecoration(
              color: AppColors.black,
              border: Border.all(
                color: AppColors.black,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Gap(14),
          Expanded(child: SvgPicture.asset(icon))
        ],
      ),
    );
  }
}
