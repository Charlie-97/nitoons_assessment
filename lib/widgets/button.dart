import 'package:flutter/material.dart';
import 'package:nitoons_assessment/constants/app_colors.dart';
import 'package:nitoons_assessment/constants/app_textstyles.dart';

class Button extends StatelessWidget {
  final bool isSecondary;
  final String label;
  final void Function() onPressed;
  const Button({
    super.key,
    this.isSecondary = false,
    required this.label,
    required this.onPressed,
  });

  const Button.secondary({
    super.key,
    this.isSecondary = true,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSecondary ? AppColors.transparent : AppColors.black,
          border: isSecondary
              ? Border.all(width: 1, color: AppColors.black)
              : Border.all(width: 0),
        ),
        alignment: Alignment.center,
        child: Text(label,
            style: isSecondary
                ? AppTextStyles.secondaryButtonText
                : AppTextStyles.primaryButtonText),
      ),
    );
  }
}
