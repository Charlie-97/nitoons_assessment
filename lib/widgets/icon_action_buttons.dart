import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nitoons_assessment/constants/app_textstyles.dart';

class IconActionButtons extends StatefulWidget {
  final String icon;
  final int actionCount;
  final Function() onPressed;
  const IconActionButtons({
    super.key,
    required this.icon,
    required this.actionCount,
    required this.onPressed,
  });

  @override
  State<IconActionButtons> createState() => _IconActionButtonsState();
}

class _IconActionButtonsState extends State<IconActionButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onPressed,
      child: Column(
        children: [
          SvgPicture.asset(widget.icon),
          const Gap(6),
          Text(
            '${widget.actionCount}',
            style: AppTextStyles.actionButtonText,
          )
        ],
      ),
    );
  }
}