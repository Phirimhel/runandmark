import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
