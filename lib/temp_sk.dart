import 'package:flutter/material.dart';

class SKPage extends StatelessWidget {
  const SKPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SK Sayfası'),
      ),
      body: const Center(
        child: Text('SK Sayfası İçeriği'),
      ),
    );
  }
}