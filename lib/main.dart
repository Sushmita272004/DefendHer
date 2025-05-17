import 'package:flutter/material.dart';

// Import your pages
import 'pages/home_page.dart';
import 'pages/report_page.dart';
import 'pages/safe_zone.dart';
import 'pages/self_defence.dart';
import 'pages/feature_page.dart';
// import 'pages/chat_page.dart'; // Uncomment if you have this

void main() {
  runApp(const DefendHerApp());
}

class DefendHerApp extends StatelessWidget {
  const DefendHerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DefendHer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFF6A1B9A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6A1B9A),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DefendHerHomePage(),
        '/report': (context) => const ReportPage(),
        '/safezones': (context) => const SafeZonePage(),
        '/selfdefence': (context) => const SelfDefencePage(),
        '/features': (context) => const FeaturesPage(),
        // '/chat': (context) => const ChatPage(), // Add if available
      },
    );
  }
}
