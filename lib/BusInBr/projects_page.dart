import 'package:flutter/material.dart';
import 'project.dart'; // Project modelini import ettik
import 'project_detail_page.dart'; // Detay sayfasını import ettik

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
      appBar: AppBar(
        title: const Text(
          'Projelerimiz',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Projelerde ara...',
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF0D47A1)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
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
                        '🚀 Aktif Projeler',
                        activeProjects,
                        Icons.rocket_launch,
                        Colors.deepOrange,
                      ),
                      const SizedBox(height: 30),
                      _buildProjectCategory(
                        context,
                        '🔮 Gelecek Projeler',
                        upcomingProjects,
                        Icons.lightbulb_outline,
                        Colors.blueGrey,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
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
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A237E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Şu anda bu kategoride proje bulunmamaktadır.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A237E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ListView.builder(
          shrinkWrap: true, // İçeriğine göre boyutlanmasını sağlar
          physics: const NeverScrollableScrollPhysics(), // Ana kaydırma ile çakışmaz
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
    return Card(
      margin: const EdgeInsets.only(bottom: 15.0),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.95),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailPage(project: project),
            ),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Animasyonu için görsel
              Hero(
                tag: 'project-image-${project.id}', // Benzersiz tag
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    project.imageUrl,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 90,
                        height: 90,
                        color: Colors.grey[300],
                        child: Icon(Icons.broken_image, size: 40, color: Colors.grey[600]),
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
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      project.description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6.0,
                      runSpacing: 4.0,
                      children: project.technologies.map((tech) => Chip(
                        label: Text(tech, style: const TextStyle(fontSize: 12)),
                        backgroundColor: const Color(0xFFBBDEFB),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      )).toList(),
                    ),
                    if (project.teamLeads.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Liderler: ${project.teamLeads.join(', ')}',
                          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                      ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}