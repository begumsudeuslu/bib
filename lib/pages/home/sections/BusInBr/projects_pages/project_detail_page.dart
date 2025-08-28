import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project.dart';
import '../../../../../widgets/project_widgets/project_info_card_section.dart';
import '../../../../../widgets/project_widgets/team_leads_section.dart';
import '../../../../../widgets/project_widgets/technologies_section.dart';

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
                      Expanded(
                        child: Center(
                          child: Text(
                            project.title,
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey[800],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
                              child: Icon(Icons.broken_image,
                                  size: 60, color: Colors.blueGrey[400]),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // Bilgi Kartları
                  ProjectInfoCard(
                    icon: Icons.description_rounded,
                    label: 'Açıklama',
                    content: project.description,
                  ),

                  const SizedBox(height: 15),

                  ProjectInfoCard(
                    icon: Icons.assessment_rounded,
                    label: 'Durum',
                    content: project.status,
                  ),

                  const SizedBox(height: 15),

                  TechnologiesSection(technologies: project.technologies),

                  const SizedBox(height: 15),

                  // Proje Liderleri
                  TeamLeadsSection(teamLeads:project.teamLeads),
                  const SizedBox(height: 30),

                  // Bilgilendirme Notu
                  Center(
                    child: Text(
                      'Detaylı bilgi için ekip liderleri ile iletişime geçebilirsiniz.',
                      style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: Colors.blueGrey[600],
                          fontStyle: FontStyle.italic),
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

}
