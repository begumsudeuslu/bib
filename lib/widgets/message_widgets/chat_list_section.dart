import 'package:flutter/material.dart';
import 'package:proje_adi/widgets/message_widgets/chat_view_section.dart';

class ChatListSection extends StatelessWidget {
  final List<Map<String, dynamic>> chats;
  final Map<String, dynamic>? selectedChat;
  final Function(Map<String, dynamic>?) onChatSelected;
  final TextEditingController messageController;

  const ChatListSection ({super.key, required this.chats, required this.selectedChat, required this.onChatSelected, required this.messageController});

  @override
  Widget build(BuildContext context)  {
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
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];
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
                    onChatSelected(chat);
                  
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
                            body: ChatViewSection(chat: chat, messageController: messageController,),
                          ),
                        ),
                      );

                      // Geri dönüldüğünde sohbet seçimini kaldır
                      onChatSelected(null);
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
}