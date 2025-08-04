class Project {
  final String id; // Benzersiz kimlik
  final String title;
  final String description;
  final String imageUrl; // Proje görseli URL'si
  final String status; // 'Aktif', 'Gelecek' gibi durumlar
  final List<String> technologies; // Kullanılan teknolojiler
  final List<String> teamLeads; // Proje liderleri/ekip üyeleri

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.status,
    this.technologies = const [],
    this.teamLeads = const [],
  });
}