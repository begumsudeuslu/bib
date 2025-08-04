import 'package:flutter/material.dart';

class BIBPage extends StatelessWidget {
  const BIBPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BIB Sayfası'),
      ),
      body: const Center(
        child: Text('BIB Sayfası İçeriği'),
      ),
    );
  }
}