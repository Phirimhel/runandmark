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

  @override
  void initState() {
    // TODO: implement initState
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
      //appBar: AppBar(),
      body: mp.MapWidget(
        onMapCreated: _onMapCreated,
      ),
    );
  }

  void _onMapCreated(
    mp.MapboxMap controller,
  ) {
    setState(
      () {
        mapboxMapController = controller;
      },
    );
    mapboxMapController?.location.updateSettings(
      mp.LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
      ),
    );

    // Set Dark Theme
    mapboxMapController?.style.setStyleURI(mp.MapboxStyles.DARK);

    // Animate from Earth to user's location
    Future.delayed(
      Duration(milliseconds: 400),
      () async {
        gl.Position? position = await gl.Geolocator.getCurrentPosition();
        if (position.latitude != null) {
          mapboxMapController?.flyTo(
            mp.CameraOptions(
                center: mp.Point(
                    coordinates:
                        mp.Position(position.longitude, position.latitude)),
                zoom: 12,
                bearing: 180,
                pitch: 30 // Latitude (y)
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
      return Future.error('Location serbices are disabled');
    }

    permission = await gl.Geolocator.checkPermission();

    if (permission == gl.LocationPermission.denied) {
      permission = await gl.Geolocator.requestPermission();
      if (permission == gl.LocationPermission.denied) {
        return Future.error('Location serbices are disabled');
      }
    }

    if (permission == gl.LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permission =(');
    }

    gl.LocationSettings locationSettings = gl.LocationSettings(
      accuracy: gl.LocationAccuracy.high,
      distanceFilter: 50,
    );

    userPositionStream?.cancel();
    userPositionStream =
        gl.Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen(
      (
        gl.Position? position,
      ) {
        if (position != null) {
          print(position);
        }
      },
    );
  }
}
