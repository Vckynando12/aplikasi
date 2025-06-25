import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(text: 'Dewi Sartika');
  final TextEditingController _emailController = TextEditingController(text: 'nim@student.polije.ac.id');
  final TextEditingController _phoneController = TextEditingController(text: '088885555222');
  final TextEditingController _addressController = TextEditingController(text: 'Gedung Teknologi Informasi');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.go('/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Form Fields
            const Text(
              'Nama',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                isDense: true,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Email',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                isDense: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),

            const Text(
              'Nomor Telepon',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                isDense: true,
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Alamat',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    // Handle address edit
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                isDense: true,
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save changes
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profil berhasil diperbarui'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Simpan Perubahan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}