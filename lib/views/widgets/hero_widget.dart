import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'login_screen huin',
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(10), // Optional for rounded corners
            child: Image.asset(
              'assets/images/login_Image.png',
              height: 400,
            ),
          ),
        ));
  }
}
