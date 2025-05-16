import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:torch_light/torch_light.dart';
import 'package:vibration/vibration.dart';

class SOSService {
  static final AudioPlayer _audioPlayer = AudioPlayer();

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

    try {
      // Play SOS alarm sound
      await _audioPlayer.play(AssetSource('sos_alarm.mp3'));

      // Start vibration if supported
      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate(duration: 1000);
      }

      // Flashlight strobe effect
      try {
        for (int i = 0; i < 5; i++) {
          await TorchLight.enableTorch();
          await Future.delayed(const Duration(milliseconds: 300));
          await TorchLight.disableTorch();
          await Future.delayed(const Duration(milliseconds: 300));
        }
      } catch (_) {
        debugPrint('Flashlight not available');
      }

      // Show alert with location
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('SOS Activated!'),
          content: Text(
            'Your location:\nLatitude: ${position.latitude}\nLongitude: ${position.longitude}\n\nHelp is on the way!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                _audioPlayer.stop();
                Navigator.of(context).pop();
              },
              child: const Text('Dismiss'),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint("SOS Error: $e");
    }
  }
}
