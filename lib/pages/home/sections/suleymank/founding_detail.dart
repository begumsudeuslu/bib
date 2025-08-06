import 'package:flutter/material.dart';
import 'information/founding&history.dart';

class FoundingDetailPage extends StatelessWidget {
  const FoundingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foundingTitle),
        backgroundColor: Colors.blue[100],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Text(
            foundingDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              height: 1.7,
            ),
          ),
        ),
      ),
    );
  }
}