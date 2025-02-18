// Base User Model
class User {
  final String id;
  final String name;
  final String photoUrl;
  double accountBalance;
  List<Zone> visitedPoints;

  User({
    required this.id,
    required this.name,
    required this.photoUrl,
    this.accountBalance = 0.0,
    List<Zone>? visitedPoints,
  }) : visitedPoints = visitedPoints ?? [];
}

// base Zone model
class Zone {
  final String id;
  final double latitude;
  final double longitude;
  final double radius;

  // !Zone configs
  double balance;
  double secondsLifeTime;
  final double tokenRatePer30Seconds;
  bool isActive;
  List<Runner> visitedBy = [];

  Zone({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.balance,
    required this.secondsLifeTime,
    required this.tokenRatePer30Seconds,
  }) : isActive = true;
}

class Runner extends User {
  final double latitude;
  final double longitude;

  Runner(
    this.latitude,
    this.longitude, {
    required super.id,
    required super.name,
    required super.photoUrl,
  });

  void enteredZone() {
    print('$name (ID: $id) has entered the zone at [$latitude, $longitude]');
  }

  // Action when leaving the zone
  void leftZone() {
    print('$name (ID: $id) has left the zone at [$latitude, $longitude]');
  }
}
