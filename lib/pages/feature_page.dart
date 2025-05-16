import 'package:flutter/material.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Core Features'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          FeatureItem(
            title: 'Report Page',
            description: 'Quickly report any unsafe situation with detailed information.',
          ),
          FeatureItem(
            title: 'Safe Zones',
            description: 'Find and navigate to nearby verified safe areas on the map.',
          ),
          FeatureItem(
            title: 'Women Community Chat',
            description: 'Connect with other women for support, advice, and alerts.',
          ),
          FeatureItem(
            title: 'Voice Command Emergency Trigger',
            description: 'Trigger SOS alerts using your voice even when you can’t touch your phone.',
          ),
          FeatureItem(
            title: 'Live Location Tracking',
            description: 'Let trusted contacts follow your live location in real time.',
          ),
          FeatureItem(
            title: 'Red Zones Map',
            description: 'View areas flagged as unsafe and avoid them easily.',
          ),
          FeatureItem(
            title: 'Self-Defense Tips',
            description: 'Access practical tips and guides for protecting yourself in dangerous situations.',
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const FeatureItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description,
                style: const TextStyle(fontSize: 14, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
