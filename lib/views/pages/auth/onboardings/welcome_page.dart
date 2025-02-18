import 'package:flutter/material.dart';
import 'package:runandmark/views/pages/auth/login_page.dart';
import 'package:runandmark/views/pages/auth/onboardings/onboarding_page.dart';
import 'package:runandmark/views/widgets/buttons/buttons_winged.dart';
import 'package:runandmark/views/widgets/style/back_animation_widget.dart';
import 'package:runandmark/views/widgets/style/app_name_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // ✅ Allows scrolling
        child: SizedBox(
          height:
              MediaQuery.of(context).size.height, // ✅ Keeps full screen height
          child: Stack(
            children: [
              BackAnimationWidget(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppNameWidget(),
                      SizedBox(height: 16),
                      Opacity(
                        opacity: 0.9,
                        child: Column(
                          children: [
                            ButtonsListWidget.buttonType(
                              chosenButton: ChosenButton.getStarted,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return OnboardingPage();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 16),
                            ButtonsListWidget.buttonType(
                              chosenButton: ChosenButton.login,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginPage();
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
