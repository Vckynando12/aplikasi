import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthProvider>().logout();
              context.go('/login');
            },
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildAdminCard(
            'Manage Menu',
            Icons.restaurant_menu,
            Colors.blue,
            () {},
          ),
          _buildAdminCard(
            'Orders',
            Icons.receipt_long,
            Colors.green,
            () {},
          ),
          _buildAdminCard(
            'Users',
            Icons.people,
            Colors.orange,
            () {},
          ),
          _buildAdminCard(
            'Reports',
            Icons.bar_chart,
            Colors.purple,
            () {},
          ),
          _buildAdminCard(
            'Settings',
            Icons.settings,
            Colors.grey,
            () {},
          ),
          _buildAdminCard(
            'Support',
            Icons.help,
            Colors.red,
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAdminCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32,
                color: color,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 