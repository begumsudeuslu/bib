import 'package:flutter/material.dart';
import 'information/expertise_areas.dart';

class ExpertiseDetailPage extends StatelessWidget {
  const ExpertiseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(expertiseTitle),
        backgroundColor: Colors.blue[100],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Text(
            expertiseDescription,
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