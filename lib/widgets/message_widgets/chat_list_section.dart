import 'package:flutter/material.dart';

class ChatListSection extends StatelessWidget {

  const ChatListSection ({super.key,});

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
}