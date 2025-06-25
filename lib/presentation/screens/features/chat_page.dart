import 'package:flutter/material.dart';
import 'chat_detail_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 5, // Example count
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatDetailPage(
                    name: 'Kurir 1',
                    phone: '08199997777',
                  ),
                ),
              );
            },
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delivery_dining,
                color: Colors.blue.shade700,
                size: 30,
              ),
            ),
            title: const Text(
              'Kurir 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text('08199997777'),
            trailing: const Text(
              '09:25',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          );
        },
      ),
    );
  }
} 