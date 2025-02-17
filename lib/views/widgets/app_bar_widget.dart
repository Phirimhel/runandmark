import 'package:flutter/material.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/pages/settings_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Runendmark'),
      actions: [
        IconButton(
          onPressed: () {
            //! ROUTER WITCH WE NEED
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SettingsPage();
              },
            ));
          },
          icon: Icon(Icons.settings),
        ),
      ],
      leading: IconButton(
        icon: ValueListenableBuilder(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDarkMode, child) {
            return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
          },
        ),
        onPressed: () {
          print(isDarkModeNotifier.value);
          isDarkModeNotifier.value = !isDarkModeNotifier.value;
        },
      ),
    );
  }
}
