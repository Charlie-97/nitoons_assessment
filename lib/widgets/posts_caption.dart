import 'package:flutter/material.dart';
import 'package:nitoons_assessment/constants/app_colors.dart';

class PostCaption extends StatelessWidget {
  final String text;
  const PostCaption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final List<TextSpan> textSpans = [];

    RegExp regExp = RegExp(r'#\w+[-_]*\w+');
    Iterable<Match> matches = regExp.allMatches(text);

    int startIndex = 0;
    for (Match match in matches) {
      textSpans.add(
        TextSpan(
          text: text.substring(startIndex, match.start),
        ),
      );
      textSpans.add(
        TextSpan(
            text: match.group(0),
            style: const TextStyle(fontWeight: FontWeight.w600)),
      );
      startIndex = match.end;
    }
    if (startIndex < text.length) {
      textSpans.add(
        TextSpan(
          text: text.substring(startIndex),
        ),
      );
    }

  
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: RichText(
        text: TextSpan(
          children: textSpans,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
