import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class RunnerPage extends StatefulWidget {
  const RunnerPage({super.key});

  @override
  State<RunnerPage> createState() => _RunnerPageState();
}

class _RunnerPageState extends State<RunnerPage> {
  mp.MapboxMap? mapboxMapController;
  StreamSubscription? userPositionStream;

  // Custom Mapbox Style URL
  static const String customStyleUrl =
      "mapbox://styles/phirimhel/cm7ccjzed008901r4fev430oe";

  @override
  void initState() {
    super.initState();
    _setupPositionTracking();
  }

  @override
  void dispose() {
    userPositionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mp.MapWidget(
        onMapCreated: _onMapCreated,
        styleUri: customStyleUrl,
      ),
    );
  }

  void _onMapCreated(mp.MapboxMap controller) {
    setState(() {
      mapboxMapController = controller;
    });

    mapboxMapController?.setCamera(
      mp.CameraOptions(
        center: mp.Point(
          coordinates: mp.Position(0.0, 0.0),
        ),
        zoom: 0,
      ),
    );

    // Enable location tracking with pulsing effect
    mapboxMapController?.location.updateSettings(mp.LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
        puckBearingEnabled: true,
        pulsingColor: Color.fromRGBO(50, 192, 147, 1).value,
        pulsingMaxRadius: 50.0));

    // Fly to user's location after 400ms delay
    Future.delayed(
      const Duration(milliseconds: 400),
      () async {
        gl.Position? position = await gl.Geolocator.getCurrentPosition();
        if (position != null) {
          mapboxMapController?.flyTo(
            mp.CameraOptions(
              center: mp.Point(
                coordinates: mp.Position(
                  position.longitude,
                  position.latitude,
                ),
              ),
              zoom: 16, // Zoom in on user's location
              bearing: 180,
              pitch: 30, // Tilt the map
            ),
            mp.MapAnimationOptions(duration: 8000, startDelay: 0),
          );
        }
      },
    );
  }

  Future<void> _setupPositionTracking() async {
    bool serviceEnabled;
    gl.LocationPermission permission;

    serviceEnabled = await gl.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await gl.Geolocator.checkPermission();
    if (permission == gl.LocationPermission.denied) {
      permission = await gl.Geolocator.requestPermission();
      if (permission == gl.LocationPermission.denied) {
        return Future.error('Location services are disabled');
      }
    }

    if (permission == gl.LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission.');
    }

    gl.LocationSettings locationSettings = const gl.LocationSettings(
      accuracy: gl.LocationAccuracy.high,
      distanceFilter: 50,
    );

    userPositionStream?.cancel();
    userPositionStream =
        gl.Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((gl.Position? position) {
      if (position != null) {
        print(position);
      }
    });
  }
}
