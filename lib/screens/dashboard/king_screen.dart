import 'package:flutter/material.dart';

class KingScreen extends StatelessWidget {
  const KingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('King'),
      ),
      body: Center(
        child: Text(
          'King Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
