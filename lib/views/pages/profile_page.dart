import 'package:flutter/material.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/pages/auth/onboardings/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
          child: Text('logout'),
        ),
      ],
    ));
  }
}
