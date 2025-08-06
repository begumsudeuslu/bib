// lib/BusInBr/utils/app_colors.dart
import 'package:flutter/material.dart';

Color getCategoryColor(String category, BuildContext context) { // context parametresi eklendi
  switch (category) {
    case 'Genel':
      return Theme.of(context).primaryColor; // Örnek kullanım
    case 'İdari':
      return Colors.green.shade800;
    case 'Teknik':
      return Colors.orange.shade800;
    case 'Etkinlik':
      return Colors.purple.shade800;
    default:
      return Colors.grey.shade600;
  }
}