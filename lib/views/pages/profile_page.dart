import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:runandmark/data/constants.dart';
import 'package:runandmark/views/pages/profile_page.dart';
import 'package:runandmark/views/widgets/hero_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.rotate(
                angle: 5,
                child: Lottie.asset(
                  'assets/lotties/welcome.json',
                  fit: BoxFit.cover, // ✅ Чтобы анимация не искажалась
                ),
              ),
            ),
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Центрирует по вертикали
              children: [
                Container(
                  alignment: Alignment.center, // Центрирует по горизонтали
                  child: Text('YA PIDORAS'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
