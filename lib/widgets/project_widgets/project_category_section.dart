import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proje_adi/widgets/project_widgets/project_card_section.dart';
import '../../pages/home/sections/BusInBr/projects_pages/project.dart';

class ProjectCategorySection extends StatelessWidget {
  final String title;
  final List<Project> projects;
  final IconData icon;
  final Color iconColor;

  const ProjectCategorySection({
    super.key,
    required this.title,
    required this.projects,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: iconColor),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: GoogleFonts.quicksand(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Şu anda bu kategoride proje bulunmamaktadır.',
              style: GoogleFonts.quicksand(
                  fontSize: 16, color: Colors.blueGrey[600]),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 28, color: iconColor),
            const SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.quicksand(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey[800],
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return ProjectCardSection(project: project);
          },
        ),
      ],
    );
  }
}
