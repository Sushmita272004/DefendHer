// Updated home_page.dart with statistics and SOS button
import 'package:flutter/material.dart';
import 'lib/services/sos_service.dart'; // Adjust the path if needed

class DefendHerHomePage extends StatelessWidget {
  const DefendHerHomePage({super.key});

  void navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF6A1B9A),
              ),
              child: Text(
                'DefendHer Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Report Page'),
              onTap: () => navigateTo(context, '/report'),
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Safe Zones'),
              onTap: () => navigateTo(context, '/safezones'),
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Community Chat'),
              onTap: () => navigateTo(context, '/chat'),
            ),
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text('Core Features'),
              onTap: () => navigateTo(context, '/features'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'DefendHer',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6A1B9A),
                  Color(0xFF4A148C),
                ],
              ),
            ),
          ),
          Positioned(
            top: -150,
            left: -100,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                height: 400,
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to DefendHer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your Safety, Our Priority',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "In a world where safety cannot be taken for granted, DefendHer empowers women with the tools they need to feel protected and in control. It's designed to react when you can’t, speak when you’re silent, and connect you with those who can help in critical moments. From emergency responses to real-time tracking, community awareness to personal empowerment—DefendHer covers every angle of your safety. Our mission is to ensure that no woman feels alone, unheard, or unprepared in the face of danger.",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _statCard('Incidents Reported', '1,248'),
                      _statCard('Safe Zones', '87'),
                      _statCard('Community Members', '4,562'),
                      _statCard('Tips Shared', '328'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          SOSService.triggerSOS(context);
          // Add SOS functionality here
        },
        label: const Text('SOS'),
        icon: const Icon(Icons.warning),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  Widget _statCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 2),
          )
        ],
      ),
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
