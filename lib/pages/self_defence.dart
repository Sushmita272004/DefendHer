import 'package:flutter/material.dart';

class SelfDefencePage extends StatelessWidget {
  const SelfDefencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Self Defence Tips')),
      body: const Center(
        child: Text('Practical self-defence tips will be shown here.'),
      ),
    );
  }
}
