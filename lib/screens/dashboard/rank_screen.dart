import 'package:flutter/material.dart';

class RankScreen extends StatelessWidget {
  const RankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rank'),
      ),
      body: Center(
        child: Text(
          'Rank Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
