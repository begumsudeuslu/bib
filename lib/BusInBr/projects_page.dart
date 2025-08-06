import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project.dart';
import 'project_detail_page.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  // Örnek proje verileri (Gerçek uygulamada bir API'den gelebilir)
  final List<Project> _allProjects = const [
    Project(
      id: 'p001',
      title: 'Kurumsal CRM Sistemi Geliştirme',
      description: 'Müşteri ilişkileri yönetimini dijitalleştiren, ölçeklenebilir ve entegre bir CRM çözümü.',
      imageUrl: 'https://cdn.pixabay.com/photo/2018/05/18/15/30/web-design-3411373_1280.jpg',
      status: 'Aktif',
      technologies: ['Flutter', 'Node.js', 'MongoDB', 'AWS'],
      teamLeads: ['Ali Yılmaz', 'Ayşe Demir'],
    ),
    Project(
      id: 'p002',
      title: 'Mobil Bankacılık Uygulaması',
      description: 'Kullanıcı dostu arayüzü ve güçlü güvenlik özellikleriyle mobil bankacılık deneyimi.',
      imageUrl: 'https://cdn.pixabay.com/photo/2016/11/29/05/45/phone-1867123_1280.jpg',
      status: 'Aktif',
      technologies: ['React Native', 'Java Spring', 'PostgreSQL'],
      teamLeads: ['Can Kaplan'],
    ),
    Project(
      id: 'p003',
      title: 'Yapay Zeka Destekli Veri Analiz Platformu',
      description: 'Büyük veri setlerini işleyerek anlamlı içgörüler sunan akıllı analiz platformu.',
      imageUrl: 'https://cdn.pixabay.com/photo/2020/10/30/11/48/ai-5699478_1280.jpg',
      status: 'Gelecek',
      technologies: ['Python', 'TensorFlow', 'Apache Spark', 'AWS Sagemaker'],
      teamLeads: ['Deniz Akın', 'Ebru Güneş'],
    ),
    Project(
      id: 'p004',
      title: 'Siber Güvenlik Danışmanlık Portalı',
      description: 'Kurumsal müşterilere özel siber güvenlik denetimi ve danışmanlık hizmetleri.',
      imageUrl: 'https://cdn.pixabay.com/photo/2016/11/19/11/50/data-1839218_1280.jpg',
      status: 'Aktif',
      technologies: ['ASP.NET Core', 'Vue.js', 'Azure'],
      teamLeads: ['Fatih Özkan'],
    ),
    Project(
      id: 'p005',
      title: 'IoT Destekli Akıllı Şehir Projesi',
      description: 'Sensörler ve veri analizi ile şehir yaşamını iyileştiren IoT çözümleri.',
      imageUrl: 'https://cdn.pixabay.com/photo/2019/11/04/13/21/smart-city-4599557_1280.jpg',
      status: 'Gelecek',
      technologies: ['Arduino', 'Raspberry Pi', 'Python', 'Firebase'],
      teamLeads: ['Gizem Çelik'],
    ),
    Project(
      id: 'p006',
      title: 'Blockchain Tabanlı Tedarik Zinciri Yönetimi',
      description: 'Şeffaf ve güvenli tedarik zinciri takibi için blockchain entegrasyonu.',
      imageUrl: 'https://cdn.pixabay.com/photo/2017/10/16/22/02/blockchain-2858882_1280.jpg',
      status: 'Gelecek',
      technologies: ['Solidity', 'Ethereum', 'Hyperledger Fabric'],
      teamLeads: ['Hakan Vural', 'İpek Aydın'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Projeleri arama metnine göre filtreleme
  List<Project> get _filteredProjects {
    if (_searchText.isEmpty) {
      return _allProjects;
    }
    final searchLower = _searchText.toLowerCase();
    return _allProjects.where((project) {
      return project.title.toLowerCase().contains(searchLower) ||
             project.description.toLowerCase().contains(searchLower) ||
             project.technologies.join(', ').toLowerCase().contains(searchLower) ||
             project.teamLeads.join(', ').toLowerCase().contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Project> activeProjects = _filteredProjects.where((p) => p.status == 'Aktif').toList();
    final List<Project> upcomingProjects = _filteredProjects.where((p) => p.status == 'Gelecek').toList();

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
    title: Text(
      'Projelerimiz',
      style: GoogleFonts.quicksand(
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.blueGrey[800],
    automaticallyImplyLeading: true, // Geri butonu otomatik
  ),
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
            child: Column(
              children: [
                // Başlık ve Arama
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Projelerde ara...',
                      hintStyle: GoogleFonts.quicksand(),
                      prefixIcon: Icon(Icons.search, color: Colors.blueGrey[700]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProjectCategory(
                          context,
                          ' Aktif Projeler',
                          activeProjects,
                          Icons.rocket_launch_rounded,
                          Colors.deepOrange,
                        ),
                        const SizedBox(height: 30),
                        _buildProjectCategory(
                          context,
                          ' Gelecek Projeler',
                          upcomingProjects,
                          Icons.lightbulb_outline_rounded,
                          Colors.blueGrey,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Proje kategorileri için yardımcı widget
  Widget _buildProjectCategory(
    BuildContext context,
    String title,
    List<Project> projects,
    IconData icon,
    Color iconColor,
  ) {
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
                fontSize: 16, 
                color: Colors.blueGrey[600]
              ),
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
            return _buildProjectCard(context, project);
          },
        ),
      ],
    );
  }

  // Her bir proje için kart widget'ı
  Widget _buildProjectCard(BuildContext context, Project project) {
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
                          child: Icon(
                            Icons.broken_image, 
                            size: 40, 
                            color: Colors.blueGrey[400]
                          ),
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
                          fontSize: 14, 
                          color: Colors.blueGrey[600]
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6.0,
                        runSpacing: 4.0,
                        children: project.technologies.map((tech) => Chip(
                          label: Text(
                            tech, 
                            style: GoogleFonts.quicksand(
                              fontSize: 12,
                              color: Colors.blueGrey[800]
                            )
                          ),
                          backgroundColor: Colors.blueGrey.withOpacity(0.1),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.blueGrey[200]!, width: 0.5),
                          ),
                        )).toList(),
                      ),
                      if (project.teamLeads.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Liderler: ${project.teamLeads.join(', ')}',
                            style: GoogleFonts.quicksand(
                              fontSize: 13, 
                              color: Colors.blueGrey[600]
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded, 
                  size: 20, 
                  color: Colors.blueGrey[600]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}