class Announcement {
  final String id;
  final String title;
  final String content;
  final String category; // 'Genel', 'İK', 'Proje', 'Etkinlik', 'Teknik', 'Yönetim'
  final DateTime publishDate;
  final String author;
  final String? imageUrl; // Opsiyonel görsel
  final DateTime? endDate; // Son geçerlilik tarihi (Opsiyonel)
  final List<String> attachments; // Ek dosya URL'leri (şimdilik boş veya örnek linkler)
  final List<String> tags; // Etiketler

  const Announcement({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.publishDate,
    required this.author,
    this.imageUrl,
    this.endDate,
    this.attachments = const [],
    this.tags = const [],
  });
}