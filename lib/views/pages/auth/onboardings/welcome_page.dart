import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:runandmark/data/constants.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/pages/auth/login_page.dart';
import 'package:runandmark/views/pages/auth/onboardings/onboarding_page.dart';
import 'package:runandmark/views/widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🎬 **Фоновая Lottie-анимация**
          Positioned.fill(
            child: Transform.rotate(
                angle: -1.2,
                child: Lottie.asset('assets/lotties/welcome.json',
                    fit: BoxFit.fill, height: 400.0
                    // ✅ Чтобы анимация не искажалась
                    )),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 🔹 Высота только по контенту
                children: [
                  HeroWidget(),
                  Text(
                    'RUN',
                    style: TextStyle(
                      fontSize: 60,
                      letterSpacing: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  /// 🆙 **Текст над карточкой**
                  Wrap(
                    children: [
                      Text(
                        'AND',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        'MARK',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Opacity(
                    opacity: 0.9,
                    child: Column(
                      children: [
                        /// 🔘 **Кнопка Login**
                        FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: Size(double.infinity, 40.0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  // loadingMainImageNotifier.value = true;
                                  return OnboardingPage();
                                },
                              ),
                            );
                          },
                          child: Text("Get Started"),
                        ),

                        ElevatedButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(double.infinity, 40.0),
                          ),
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
                          child: Text(
                            "login",
                            style: KtexStyle.titleTealText,
                          ),
                        ),
                      ],
                    ),

                    /// 🆗 **Текст под карточкой**
                    // Text(
                    //   'Create an account or reset password',
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Colors.white70,
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
