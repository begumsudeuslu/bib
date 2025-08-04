import 'package:flutter/material.dart';
import 'project.dart'; // Project modelini import ettik

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          project.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Arka plan gradienti ve daireler
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
                color: const Color.fromARGB(46, 68, 138, 255),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(64, 68, 138, 255),
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
                color: const Color.fromARGB(33, 124, 77, 255),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(46, 124, 77, 255),
                    blurRadius: 60,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          // İçerik
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Animasyonu için görsel
                Center(
                  child: Hero(
                    tag: 'project-image-${project.id}', // ProjectsPage'deki tag ile aynı olmalı
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        project.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 250,
                            width: double.infinity,
                            color: Colors.grey[300],
                            child: Icon(Icons.broken_image, size: 60, color: Colors.grey[600]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 10),
                _buildInfoRow(Icons.description, 'Açıklama', project.description),
                const SizedBox(height: 15),
                _buildInfoRow(Icons.assessment, 'Durum', project.status),
                const SizedBox(height: 15),
                _buildTechnologiesSection(project.technologies),
                const SizedBox(height: 15),
                _buildTeamLeadsSection(project.teamLeads),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Detaylı bilgi için ekip liderleri ile iletişime geçebilirsiniz.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600], fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bilgi satırı için yardımcı widget
  Widget _buildInfoRow(IconData icon, String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 24, color: const Color(0xFF0D47A1)),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 34.0), // İkonun hizasına göre boşluk
          child: Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
        ),
      ],
    );
  }

  // Teknolojiler bölümü için yardımcı widget
  Widget _buildTechnologiesSection(List<String> technologies) {
    if (technologies.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.code, size: 24, color: const Color(0xFF0D47A1)),
            const SizedBox(width: 10),
            Text(
              'Kullanılan Teknolojiler',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 34.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: technologies.map((tech) => Chip(
              label: Text(tech, style: const TextStyle(fontSize: 14, color: Color(0xFF1A237E))),
              backgroundColor: const Color(0xFFBBDEFB).withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color(0xFF64B5F6), width: 0.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            )).toList(),
          ),
        ),
      ],
    );
  }

  // Proje liderleri bölümü için yardımcı widget
  Widget _buildTeamLeadsSection(List<String> teamLeads) {
    if (teamLeads.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.groups, size: 24, color: const Color(0xFF0D47A1)),
            const SizedBox(width: 10),
            Text(
              'Proje Lider(ler)i',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 34.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: teamLeads.map((leader) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                children: [
                  const Icon(Icons.person_outline, size: 18, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(leader, style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                ],
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }
}