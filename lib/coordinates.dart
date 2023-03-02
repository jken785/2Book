class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({
    required this.latitude,
    required this.longitude,
  });

  static const newYork = Coordinates(
    latitude: 40.7127753,
    longitude: -74.0059728,
  );

  static const charleston = Coordinates(
    latitude: 32.8153,
    longitude: -79.9628,
  );

  static const washington = Coordinates(
    latitude: 38.9071923,
    longitude: -77.0368707,
  );
}
