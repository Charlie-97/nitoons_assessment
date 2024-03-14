import 'package:flutter/material.dart';
import 'package:nitoons_assessment/constants/app_colors.dart';

class AppTextStyles {
  static const TextStyle defaultBody = TextStyle();
  static const TextStyle primaryButtonText = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle posterNameText = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle secondaryButtonText = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle onBoardingBodyText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.5,
  );

  static const TextStyle onBoardingGreyText = TextStyle(
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  static const TextStyle headline = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle actionButtonText = TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}
