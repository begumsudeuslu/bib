import 'package:flutter/material.dart';

class Employee {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String? imageUrl;

  Employee({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    this.imageUrl,
  });
}

class EmployeeListPage extends StatelessWidget {
  // Buradaki 'const' anahtar kelimesi zaten kaldırılmıştı
  EmployeeListPage({super.key});

  final List<Employee> employees = [
    Employee(
      name: 'Ayşe Yılmaz',
      title: 'Yazılım Geliştirici',
      email: 'ayse.yilmaz@bib.com',
      phone: '+90 532 123 4567',
      imageUrl: 'https://img.freepik.com/free-photo/portrait-young-woman-with-curly-hair-glasses_23-2149187310.jpg',
    ),
    Employee(
      name: 'Mehmet Demir',
      title: 'Proje Yöneticisi',
      email: 'mehmet.demir@bib.com',
      phone: '+90 532 987 6543',
      imageUrl: 'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg',
    ),
    Employee(
      name: 'Zeynep Kara',
      title: 'İnsan Kaynakları Uzmanı',
      email: 'zeynep.kara@bib.com',
      phone: '+90 532 234 5678',
      imageUrl: 'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg',
    ),
    Employee(
      name: 'Can Mert',
      title: 'Pazarlama Uzmanı',
      email: 'can.mert@bib.com',
      phone: '+90 532 345 6789',
      imageUrl: 'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-male-student-casual-clothes-has-thoughtful-expression-holds-notepad-pen-looks-away-isolated-white-wall_273609-17559.jpg',
    ),
    Employee(
      name: 'Elif Aksoy',
      title: 'Finans Sorumlusu',
      email: 'elif.aksoy@bib.com',
      phone: '+90 532 456 7890',
      imageUrl: 'https://img.freepik.com/free-photo/portrait-beautiful-smiling-woman-brunette-dress_176420-22003.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Çalışanlarımız',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFe0e7ff),
                  Color(0xFFf8fafc),
                  Color(0xFFc7d2fe),
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // `Colors.blueAccent.withOpacity(0.18)` yerine doğrudan ARGB değeri
                color: const Color.fromARGB(46, 68, 138, 255), // Alpha 46 (0.18 * 255)
                boxShadow: [
                  BoxShadow(
                    // `Colors.blueAccent.withOpacity(0.25)` yerine doğrudan ARGB değeri
                    color: const Color.fromARGB(64, 68, 138, 255), // Alpha 64 (0.25 * 255)
                    blurRadius: 80,
                    spreadRadius: 30,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // `Colors.deepPurpleAccent.withOpacity(0.13)` yerine doğrudan ARGB değeri
                color: const Color.fromARGB(33, 124, 77, 255), // Alpha 33 (0.13 * 255)
                boxShadow: [
                  BoxShadow(
                    // `Colors.deepPurpleAccent.withOpacity(0.18)` yerine doğrudan ARGB değeri
                    color: const Color.fromARGB(46, 124, 77, 255), // Alpha 46 (0.18 * 255)
                    blurRadius: 60,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(15.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.75,
            ),
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final employee = employees[index];
              return _buildEmployeeCard(context, employee);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeCard(BuildContext context, Employee employee) {
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