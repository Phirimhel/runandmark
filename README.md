# Run & Mark

> **Run with purpose. Mark every mile.**

Run & Mark is a Flutter mobile app for runners who want a calmer, more visual way to explore their movement. It pairs a focused, animated interface with a live Mapbox experience and device location tracking.

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white">
  <img alt="Dart" src="https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white">
  <img alt="Mapbox" src="https://img.shields.io/badge/Mapbox-000000?logo=mapbox&logoColor=white">
</p>

## The idea

Open the app, choose **Play like a runner!**, and the map moves with you. Run & Mark brings together a welcoming start screen, a compact profile area, and a live location-aware map in one simple flow.

| ✨ A clear start | 🗺️ Built for the road | 🎨 Made to feel alive |
| --- | --- | --- |
| Onboarding and login entry points keep the first step easy. | Mapbox powers the running view and follows the device location. | Lottie motion and a teal visual system give the app its character. |

## Highlights

- Animated welcome and authentication screens
- Home and profile navigation
- Live Mapbox map with an animated location puck
- Geolocation permission handling and position updates
- Light and dark theme support

## Getting started

### 1. Get the code

```bash
git clone https://github.com/Phirimhel/runandmark.git
cd runandmark
flutter pub get
```

### 2. Add your Mapbox access token

Create a `.env` file in the project root:

```env
MAPBOX_ACCESS_TOKEN=your_mapbox_public_token
```

The app reads this value at startup. Never commit a real token.

### 3. Run it

```bash
flutter run
```

To run the widget tests:

```bash
flutter test
```

## Project map

```text
lib/
├── data/       # Shared styles and app state
├── models/     # App data models
├── views/      # Pages, widgets, and navigation
└── main.dart   # App bootstrap and theme setup
```

## Tech stack

- [Flutter](https://flutter.dev/) and Dart
- [Mapbox Maps SDK for Flutter](https://docs.mapbox.com/flutter/maps/overview/)
- [Geolocator](https://pub.dev/packages/geolocator)
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- [Lottie](https://pub.dev/packages/lottie)

## A small note on permissions

The runner map needs location access to show and follow the current position. On a physical device, approve the operating-system location prompt when it appears. If access is denied, the app will not start location tracking.

---

Built for the feeling just before a run: **the route is open, and the next mark is yours.**
