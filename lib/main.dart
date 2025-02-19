import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/pages/auth/onboardings/welcome_page.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

Future<void> main() async {
  await setup();
  runApp(const Runandmark());
}

Future<void> setup() async {
  await dotenv.load(
    fileName: ".env",
  );

  MapboxOptions.setAccessToken(
    dotenv.env["MAPBOX_ACCESS_TOKEN"]!,
  );
}

// 1. we need MaterialApp (Stateful widget )
// 2. we need Scaffold
// 3. we need a AppBar
// 4. we need a BottomNavigation

// ! create statefull widjet for main app
class Runandmark extends StatefulWidget {
  const Runandmark({super.key});

  @override
  State<Runandmark> createState() => _RunandmarkState();
}

class _RunandmarkState extends State<Runandmark> {
  @override
  Widget build(BuildContext context) {
    // ! return Material app
    return ValueListenableBuilder(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDarkMode, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // ! create global theme
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.teal,
                brightness: !isDarkModeNotifier.value
                    ? Brightness.dark
                    : Brightness.light,
              ),
            ),
            // ! home argument for Material app

            home: WelcomePage(),
          );
        });
  }
}
