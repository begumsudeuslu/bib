import 'package:flutter/material.dart';

class ChatViewSection extends StatelessWidget {
  final  Map<String, dynamic> chat;
  final TextEditingController messageController;

  const ChatViewSection({super.key, required this.chat, required this.messageController});

  @override
  Widget build(BuildContext context) {
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
                    controller: messageController,
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
                    if (messageController.text.isNotEmpty) {
                      // Mesaj gönderme mantığı buraya gelecek
                      messageController.clear();
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
