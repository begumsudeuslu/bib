import 'package:flutter/material.dart';
import 'package:proje_adi/pages/home/sections/BusInBr/employee_list_page.dart';

class EmployeeCardSection extends StatelessWidget {
  final Employee employee;

  const EmployeeCardSection ({super.key, required this.employee});

  @override
  Widget build(BuildContext context)  {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.95), // Burası sorun değil, Color'ın değil, White'ın opasitesi
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFF0D47A1),
              backgroundImage: employee.imageUrl != null && employee.imageUrl!.isNotEmpty
                  ? NetworkImage(employee.imageUrl!)
                  : null,
              child: employee.imageUrl == null || employee.imageUrl!.isEmpty
                  ? const Icon(Icons.person, size: 50, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 10),
            Text(
              employee.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
            Text(
              employee.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${employee.email} adresine e-posta gönderme düşünülüyor.')),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email, size: 16, color: Color(0xFF0D47A1)),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      employee.email,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF0D47A1),
                          decoration: TextDecoration.underline),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${employee.phone} numarası aranıyor...')),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone, size: 16, color: Color(0xFF0D47A1)),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      employee.phone,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF0D47A1),
                          decoration: TextDecoration.underline),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}