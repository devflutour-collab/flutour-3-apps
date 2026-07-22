// lib/location_service.dart — FluTour Passenger App
// Handles GPS, permissions, fare estimation, and ETA
// TODO: Wire real-time driver location stream to Firebase Realtime DB when account is recovered

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// ── Luxor landmarks (fixed coordinates) ───────────────────────────────────
class LuxorSpots {
  static const Map<String, LatLngPoint> all = {
    'Luxor Temple':    LatLngPoint(25.6987, 32.6390),
    'Karnak Temple':   LatLngPoint(25.7188, 32.6571),
    'Nile Corniche':   LatLngPoint(25.6872, 32.6370),
    'Winter Palace':   LatLngPoint(25.6938, 32.6393),
    'Luxor Museum':    LatLngPoint(25.7010, 32.6390),
    'Luxor Airport':   LatLngPoint(25.6710, 32.7061),
    'Hatshepsut Temple': LatLngPoint(25.7379, 32.6073),
    'Valley of Kings': LatLngPoint(25.7402, 32.6014),
  };
}

class LatLngPoint {
  final double lat;
  final double lng;
  const LatLngPoint(this.lat, this.lng);
}

// ── Fare estimation ────────────────────────────────────────────────────────
class FareEstimator {
  static const double _baseFare = 5.0;       // EGP base
  static const double _perKmRate = 3.0;      // EGP per km
  static const double _surgeMutiplier = 1.0; // 1.0 = no surge

  // Haversine distance between two GPS points (km)
  static double distanceKm(double lat1, double lng1, double lat2, double lng2) {
    final distMeters = Geolocator.distanceBetween(lat1, lng1, lat2, lng2);
    return distMeters / 1000;
  }

  // Estimate fare from distance
  static FareBreakdown estimate(double distanceKm) {
    final base = _baseFare;
    final distance = distanceKm * _perKmRate;
    final subtotal = base + distance;
    final surge = subtotal * _surgeMutiplier;
    final total = double.parse(surge.toStringAsFixed(1));
    return FareBreakdown(
      baseFare: base,
      distanceFare: double.parse(distance.toStringAsFixed(1)),
      surgeMultiplier: _surgeMutiplier,
      total: total < 12.0 ? 12.0 : total, // minimum fare 12 EGP
    );
  }

  // ETA string based on distance
  static String etaString(double distanceKm) {
    final minutes = (distanceKm / 0.5).round(); // ~30 km/h in city
    if (minutes < 60) return '$minutes min';
    return '${(minutes / 60).floor()}h ${minutes % 60}min';
  }
}

class FareBreakdown {
  final double baseFare;
  final double distanceFare;
  final double surgeMultiplier;
  final double total;

  FareBreakdown({
    required this.baseFare,
    required this.distanceFare,
    required this.surgeMultiplier,
    required this.total,
  });
}

// ── Location Service ───────────────────────────────────────────────────────
class LocationService {
  static Position? _lastPosition;
  static Position? get lastPosition => _lastPosition;

  // Request location permission and get current GPS position
  static Future<LocationResult> getCurrentLocation() async {
    // Check if location services are enabled
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationResult.error(
          'Location services are disabled. Please enable GPS.');
    }

    // Check/request permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return LocationResult.error(
            'Location permission denied. Please allow location access.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return LocationResult.error(
          'Location permission permanently denied. Please enable it in Settings.');
    }

    // Get position
    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 10),
      ),
    );
    _lastPosition = position;
    return LocationResult.success(position);
  }

  // Show permission-denied dialog with settings button
  static void showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Location Required'),
        content: Text(
            'FluTour needs your location to set your pickup point. '
            'Please enable location access in Settings.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openAppSettings();
            },
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  // Stream for passenger to watch driver position (simulated)
  // TODO: Replace with FirebaseDatabase.instance.ref('drivers_location/$driverId').onValue
  static Stream<LatLngPoint> watchDriverLocation(String driverId) async* {
    // Simulate driver moving toward pickup point
    final points = [
      LatLngPoint(25.6950, 32.6380),
      LatLngPoint(25.6960, 32.6385),
      LatLngPoint(25.6970, 32.6388),
      LatLngPoint(25.6980, 32.6390),
      LatLngPoint(25.6987, 32.6390),
    ];
    for (final p in points) {
      await Future.delayed(Duration(seconds: 3));
      yield p;
    }
  }
}

class LocationResult {
  final Position? position;
  final String? errorMessage;
  bool get isSuccess => position != null;

  LocationResult.success(this.position) : errorMessage = null;
  LocationResult.error(this.errorMessage) : position = null;
}
