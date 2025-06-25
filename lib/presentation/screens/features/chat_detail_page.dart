import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final String name;
  final String phone;

  const ChatDetailPage({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      message: 'Titik sesuai lokasi ya!',
      time: '09:25',
      isMe: false,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delivery_dining,
                color: Colors.blue.shade700,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.phone,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              // Handle phone call
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/chat_bg.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.grey.withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message.isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: message.isMe ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            message.message,
                            style: TextStyle(
                              color: message.isMe ? Colors.white : Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            message.time,
                            style: TextStyle(
                              color: message.isMe
                                  ? Colors.white.withOpacity(0.7)
                                  : Colors.grey[600],
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {
                      // Handle emoji picker
                    },
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Ketik pesan di sini ...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: () {
                      // Handle file attachment
                    },
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {
                        setState(() {
                          _messages.add(ChatMessage(
                            message: _messageController.text,
                            time: '${DateTime.now().hour}:${DateTime.now().minute}',
                            isMe: true,
                          ));
                          _messageController.clear();
                        });
                      }
                    },
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String message;
  final String time;
  final bool isMe;

  ChatMessage({
    required this.message,
    required this.time,
    required this.isMe,
  });
} 