// lib/BusInBr/messages_page.dart

import 'package:flutter/material.dart';
import '../../../../widgets/message_widgets/chat_view_section.dart';
import '../../../../widgets/message_widgets/chat_list_section.dart';

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
                ChatListSection(chats: _chats, 
                selectedChat: _selectedChat, 
                onChatSelected: (chat) {
                  setState(() {
                    _selectedChat = chat;
                  });
                },
                messageController: _messageController,),
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
              :  ChatListSection(chats: _chats, 
                selectedChat: _selectedChat, 
                onChatSelected: (chat) {
                  setState(() {
                    _selectedChat = chat;
                  });
                },
                messageController: _messageController,),
    );
  }

}