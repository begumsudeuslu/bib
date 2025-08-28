import 'package:flutter/material.dart';
import '../../pages/home/sections/BusInBr/projects_pages/project.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../pages/home/sections/BusInBr/projects_pages/project_detail_page.dart';

class ProjectCardSection extends StatelessWidget {
  final Project project;

  const ProjectCardSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProjectDetailPage(project: project),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Animasyonu için görsel
                Hero(
                  tag: 'project-image-${project.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      project.imageUrl,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 90,
                          height: 90,
                          color: Colors.blueGrey[100],
                          child: Icon(Icons.broken_image,
                              size: 40, color: Colors.blueGrey[400]),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title,
                        style: GoogleFonts.quicksand(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        project.description,
                        style: GoogleFonts.quicksand(
                            fontSize: 14, color: Colors.blueGrey[600]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6.0,
                        runSpacing: 4.0,
                        children: project.technologies
                            .map((tech) => Chip(
                                  label: Text(tech,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 12,
                                          color: Colors.blueGrey[800])),
                                  backgroundColor:
                                      Colors.blueGrey.withOpacity(0.1),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                        color: Colors.blueGrey[200]!,
                                        width: 0.5),
                                  ),
                                ))
                            .toList(),
                      ),
                      if (project.teamLeads.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Liderler: ${project.teamLeads.join(', ')}',
                            style: GoogleFonts.quicksand(
                                fontSize: 13, color: Colors.blueGrey[600]),
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 20, color: Colors.blueGrey[600]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
