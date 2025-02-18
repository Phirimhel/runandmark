class Zone {
  final String id;
  final double latitude;
  final double longitude;
  final double radius;
  double balance;
  final double tokenRatePer30Seconds;
  bool isActive;

  Zone({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.balance,
    required this.tokenRatePer30Seconds,
  }) : isActive = true;
}
