import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nitoons_assessment/constants/app_textstyles.dart';
import 'package:nitoons_assessment/constants/assets_name.dart';
import 'package:nitoons_assessment/constants/app_colors.dart';
import 'package:nitoons_assessment/constants/routes.dart';
import 'package:nitoons_assessment/widgets/button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 23,
                top: 14,
              ),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      appLogoBlack,
                    ),
                  ],
                ),
              ),
            ),
            const Gap(24),
            SizedBox(
              height: 318,
              child: Image.asset(
                slantImageContainers,
                height: 318,
                fit: BoxFit.fill,
              ),
            ),
            const Gap(33),
            const Text(
              'For actors, directors, and\neveryone in-between',
              style: AppTextStyles.onBoardingBodyText,
              textAlign: TextAlign.center,
            ),
            const Gap(33),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColors.divider),
                  ),
                  Gap(14),
                  Text(
                    'Start Exploring',
                    style: AppTextStyles.onBoardingGreyText,
                  ),
                  Gap(14),
                  Expanded(
                    child: Divider(color: AppColors.divider),
                  ),
                ],
              ),
            ),
            const Gap(22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Button(
                label: 'Explore as an actor',
                onPressed: () {
                  Navigator.pushNamed(context, homePage);
                },
              ),
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Button.secondary(
                label: 'Explore as a producer',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
