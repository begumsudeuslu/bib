// lib/BusInBr/messages_page.dart

import 'package:flutter/material.dart';
import '../../../../widgets/message_widgets/chat_view_section.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  // Örnek sohbet verileri
  final List<Map<String, dynamic>> _chats = [
    {
      'id': 'u01',
      'name': 'Ayşe Yılmaz',
      'lastMessage': 'Bugünkü toplantı gündemi hakkında konuşalım mı?',
      'lastMessageDate': DateTime.now().subtract(const Duration(minutes: 5)),
      'isRead': false,
    },
    {
      'id': 'u02',
      'name': 'Mehmet Öztürk',
      'lastMessage': 'Proje raporlarını inceledim. Teşekkürler.',
      'lastMessageDate': DateTime.now().subtract(const Duration(hours: 2)),
      'isRead': true,
    },
    {
      'id': 'u03',
      'name': 'Fatma Demir',
      'lastMessage': 'Yeni tasarımları ne zaman yollayabilirim?',
      'lastMessageDate': DateTime.now().subtract(const Duration(days: 1)),
      'isRead': false,
    },
    {
      'id': 'u04',
      'name': 'Ali Can',
      'lastMessage': 'Tamamdır, yarın görüşürüz.',
      'lastMessageDate': DateTime.now().subtract(const Duration(days: 3)),
      'isRead': true,
    },
  ];

  Map<String, dynamic>? _selectedChat;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Mobil ve tablet/masaüstü için farklı layout'lar
    final bool isWideScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mesajlar',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: isWideScreen
          ? Row(
              children: [
                _buildChatList(context),
                _selectedChat != null
                    ? ChatViewSection(
                  chat: _selectedChat!,
                  messageController: _messageController,
                )
              : Container(),
              ],
            )
          : _selectedChat != null
              ? ChatViewSection(
                  chat: _selectedChat!,
                  messageController: _messageController,)
              : _buildChatList(context),
    );
  }

  // Sohbet listesini oluşturan kısım
  Widget _buildChatList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 800 ? 300 : double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: MediaQuery.of(context).size.width > 800
            ? const Border(right: BorderSide(color: Colors.grey, width: 0.5))
            : null,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Sohbetlerde ara...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.all(8),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                final chat = _chats[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(chat['name']),
                  subtitle: Text(
                    chat['lastMessage'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: chat['isRead'] == false
                      ? const Icon(Icons.circle, size: 12, color: Colors.blue)
                      : null,
                  onTap: () async {
                    setState(() {
                      _selectedChat = chat;
                    });

                    if (MediaQuery.of(context).size.width <= 800) {
                      // Küçük ekranlarda yeni sayfaya geçer gibi davran
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: Text(chat['name']),
                              backgroundColor: const Color(0xFF0D47A1),
                              iconTheme: const IconThemeData(color: Colors.white),
                            ),
                            body: _buildChatView(context, chat),
                          ),
                        ),
                      );

                      // Geri dönüldüğünde sohbet seçimini kaldır
                      setState(() {
                        _selectedChat = null;
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Seçili sohbetin mesajlarını gösteren kısım
  Widget _buildChatView(BuildContext context, Map<String, dynamic> chat) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Örnek mesaj sayısı
              itemBuilder: (context, index) {
                // Mesaj balonu widget'ı
                return Align(
                  alignment: index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.blue.shade100 : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text('Mesaj ${index + 1}'), // Örnek mesaj metni
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Mesaj yaz...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      // Mesaj gönderme mantığı buraya gelecek
                      _messageController.clear();
                    }
                  },
                  backgroundColor: const Color(0xFF0D47A1),
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}