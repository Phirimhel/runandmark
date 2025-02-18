import 'package:flutter/material.dart';

/// 🏷 **Enum for Button Selection**
enum ChosenButton {
  playLikePointMaster,
  playLikeARunner,
  getStarted,
  login,
  settings,
  simpleButton
}

class ButtonsListWidget extends StatelessWidget {
  final ChosenButton chosenButton;
  final VoidCallback onPressed;

  /// **Factory Constructor to Choose a Button**
  const ButtonsListWidget.buttonType({
    super.key,
    required this.chosenButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: _buildButton(chosenButton),
    );
  }

  /// **🔄 Switch Case to Select Button**
  Widget _buildButton(ChosenButton buttonType) {
    switch (buttonType) {
      case ChosenButton.playLikeARunner:
        return _buildFullWidthButton(
            "Play like a runner!", Icons.arrow_forward_ios_rounded);

      case ChosenButton.playLikePointMaster:
        return _buildFullWidthButton(
            'Play like the "Point Master"!', Icons.arrow_forward_ios_rounded);

      case ChosenButton.getStarted:
        return _buildFullFilledButton("Get Started");

      case ChosenButton.login:
        return _buildFullWidthButton("Login");

      case ChosenButton.settings:
        return _buildFullWidthButton("Settings", Icons.settings);

      default:
        return const SizedBox(); // Empty widget if no match
    }
  }

  /// **🛠 Reusable Button with Custom `onPressed`**
  Widget _buildFullWidthButton(String text, [IconData? icon]) {
    print(icon);
    return ElevatedButton(
      onPressed: onPressed, // 🔹 Uses the passed function
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 50.0),
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                Icon(icon),
              ],
            )
          : Text(text),
    );
  }

  /// **🛠 Reusable Button with Custom `onPressed`**
  Widget _buildFullFilledButton(String text) {
    return FilledButton(
        onPressed: onPressed, // 🔹 Uses the passed function
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 50.0),
        ),
        child: Text(text));
  }
}
