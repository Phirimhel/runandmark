import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:runandmark/data/constants.dart';
import 'package:runandmark/views/pages/auth/onboardings/welcome_page.dart';
import 'package:runandmark/views/pages/home_page.dart';
import 'package:runandmark/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:runandmark/data/notifiers.dart'; // Если selectedPageNotifier и loadingMainImageNotifier там

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
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Profile page'),
                  ElevatedButton(
                    onPressed: () {
                      selectedPageNotifier.value = 0;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            loadingMainImageNotifier.value = false;
                            return WelcomePage();
                          },
                        ),
                      );
                    },
                    child: Text('Go home page'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
