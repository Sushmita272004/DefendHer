import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SOSService {
  static Future<bool> checkAndRequestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return false;
      }
    }
    return true;
  }

  static Future<Position?> getCurrentLocation() async {
    bool hasPermission = await checkAndRequestLocationPermission();
    if (!hasPermission) {
      return null;
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  static Future<void> triggerSOS(BuildContext context) async {
    Position? position = await getCurrentLocation();
    if (position == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission denied')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('SOS Activated!'),
        content: Text(
          'Your location:\nLatitude: ${position.latitude}\nLongitude: ${position.longitude}\n\nHelp is on the way!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Dismiss'),
          ),
        ],
      ),
    );
  }
}
