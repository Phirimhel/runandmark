import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BackAnimationWidget extends StatelessWidget {
  const BackAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRect(
        // 🔹 Обрезает выходящие за границы части
        child: Transform.rotate(
          angle: -1.2,
          child: Lottie.asset(
            'assets/lotties/welcome.json',
            fit: BoxFit.cover, // ✅ Чтобы анимация оставалась в границах
          ),
        ),
      ),
    );
  }
}
