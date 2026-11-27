import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/pages/auth/onboardings/welcome_page.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

class Runandmark extends StatelessWidget {
  const Runandmark({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: const WelcomePage(),
        );
      },
    );
  }
}
