import 'package:flutter/material.dart';

class SafeZonePage extends StatelessWidget {
  const SafeZonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Safe Zones')),
      body: const Center(
        child: Text('Map or list of safe zones will go here.'),
      ),
    );
  }
}
