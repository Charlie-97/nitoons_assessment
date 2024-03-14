import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nitoons_assessment/constants/app_colors.dart';
import 'package:nitoons_assessment/constants/routes.dart';
import 'package:nitoons_assessment/widgets/loader/app_loader.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void initCheck() async {
    await Future.delayed(const Duration(seconds: 10));
    Navigator.pushReplacementNamed(context, onboarding);
  }

  @override
  void initState() {
    initCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 105,
              child: SvgPicture.asset(
                "assets/images/app_logo_icon.svg",
                width: 136,
                height: 105,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const SizedBox(
            width: 45,
            height: 45,
            child: AppLoader(
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
