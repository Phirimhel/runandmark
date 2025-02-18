import 'package:flutter/material.dart';
import 'package:runandmark/views/widgets/cards/login_card.dart';
import 'package:runandmark/views/widgets/style/back_animation_widget.dart';
import 'package:runandmark/views/widgets/style/app_name_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          BackAnimationWidget(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Opacity(
                opacity: 0.95,
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    AppNameWidget(),
                    SizedBox(height: 10),
                    LoginCardWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
