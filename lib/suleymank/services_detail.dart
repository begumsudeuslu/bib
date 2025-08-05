import 'package:flutter/material.dart';
import 'information/services_activities.dart';

class ServicesDetailPage extends StatelessWidget {
  const ServicesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(servicesTitle),
        backgroundColor: Colors.blue[100],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Text(
            servicesDescription,
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