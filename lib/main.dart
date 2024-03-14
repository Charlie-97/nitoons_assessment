import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nitoons_assessment/constants/models/post_model.dart';
import 'package:nitoons_assessment/constants/routes.dart';
import 'package:nitoons_assessment/pages/add_page.dart';
import 'package:nitoons_assessment/pages/home_page/home_page.dart';
import 'package:nitoons_assessment/pages/loading_page.dart';
import 'package:nitoons_assessment/pages/onboarding_page.dart';
import 'package:nitoons_assessment/provider/post_provider.dart';

final postStateProvider =
    StateNotifierProvider.family<PostStateNotifier, Post, int>(
  (ref, index) => PostStateNotifier(),
);

void main() {
  runApp(
    const ProviderScope(
      child: AssessmentApp(),
    ),
  );
}

class AssessmentApp extends StatelessWidget {
  const AssessmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        initialRoute: (context) => const LoadingPage(),
        onboarding: (context) => const OnboardingPage(),
        homePage: (context) => const HomePage(),
        addPage: (context) => const AddPage(),
      },
      initialRoute: initialRoute,
    );
  }
}
