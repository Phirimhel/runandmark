import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BackAnimationWidget extends StatelessWidget {
  const BackAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRect(
        child: Transform.rotate(
          angle: -1.0,
          child: Lottie.asset(
            'assets/lotties/welcome.json',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
