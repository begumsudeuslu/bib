import 'package:flutter/material.dart';
import 'information/affiliation_structure.dart';

class AffiliationDetailPage extends StatelessWidget {
  const AffiliationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(affiliationTitle),
        backgroundColor: Colors.blue[100],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Text(
            affiliationDescription,
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