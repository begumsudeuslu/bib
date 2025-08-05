import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Arka plan
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
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Geri butonu
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_rounded, 
                          color: Colors.blueGrey[800],
                          size: 28,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Proje Görseli
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          project.imageUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 250,
                              width: double.infinity,
                              color: Colors.blueGrey[100],
                              child: Icon(
                                Icons.broken_image, 
                                size: 60, 
                                color: Colors.blueGrey[400]
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // Proje Başlığı
                  Text(
                    project.title,
                    style: GoogleFonts.quicksand(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Bilgi Kartları
                  _buildInfoCard(
                    icon: Icons.description_rounded,
                    label: 'Açıklama',
                    content: project.description,
                  ),
                  const SizedBox(height: 15),
                  _buildInfoCard(
                    icon: Icons.assessment_rounded,
                    label: 'Durum',
                    content: project.status,
                  ),
                  const SizedBox(height: 15),

                  // Teknolojiler
                  _buildTechnologiesSection(project.technologies),
                  const SizedBox(height: 15),

                  // Proje Liderleri
                  _buildTeamLeadsSection(project.teamLeads),
                  const SizedBox(height: 30),

                  // Bilgilendirme Notu
                  Center(
                    child: Text(
                      'Detaylı bilgi için ekip liderleri ile iletişime geçebilirsiniz.',
                      style: GoogleFonts.quicksand(
                        fontSize: 14, 
                        color: Colors.blueGrey[600], 
                        fontStyle: FontStyle.italic
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            icon, 
            color: Colors.blueGrey[700], 
            size: 20,
          ),
        ),
        title: Text(
          label,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          content,
          style: GoogleFonts.quicksand(
            color: Colors.blueGrey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTechnologiesSection(List<String> technologies) {
    if (technologies.isEmpty) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            Icons.code_rounded, 
            color: Colors.blueGrey[700], 
            size: 20,
          ),
        ),
        title: Text(
          'Kullanılan Teknolojiler',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: technologies.map((tech) => Chip(
            label: Text(
              tech, 
              style: GoogleFonts.quicksand(
                fontSize: 14, 
                color: Colors.blueGrey[800]
              )
            ),
            backgroundColor: Colors.blueGrey.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.blueGrey[200]!, width: 0.5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildTeamLeadsSection(List<String> teamLeads) {
    if (teamLeads.isEmpty) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            Icons.groups_rounded, 
            color: Colors.blueGrey[700], 
            size: 20,
          ),
        ),
        title: Text(
          'Proje Lider(ler)i',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            color: Colors.blueGrey[800],
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: teamLeads.map((leader) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Icon(
                  Icons.person_outline_rounded, 
                  size: 18, 
                  color: Colors.blueGrey[600]
                ),
                const SizedBox(width: 8),
                Text(
                  leader, 
                  style: GoogleFonts.quicksand(
                    fontSize: 16, 
                    color: Colors.blueGrey[700]
                  )
                ),
              ],
            ),
          )).toList(),
        ),
      ),
    );
  }
}