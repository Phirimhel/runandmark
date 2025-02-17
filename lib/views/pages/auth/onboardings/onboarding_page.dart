import 'package:flutter/material.dart';
import 'package:runandmark/data/constants.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Onboarding page',
              style: KtexStyle.titleTealText,
            )
          ],
        ),
      ),
    );
  }
}
