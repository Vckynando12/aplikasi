import 'package:flutter/material.dart';

class OrderArrivedPage extends StatelessWidget {
  const OrderArrivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian atas: background biru rounded + ilustrasi + judul
            Stack(
              children: [
                ClipPath(
                  clipper: _TopRoundedClipper(),
                  child: Container(
                    height: 230,
                    color: const Color(0xFF21A5E7),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 36),
                    Center(
                      child: Image.asset(
                        'assets/images/kurir3.png',
                        height: 140,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Pesanan tiba di Lokasi Anda',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Scan barcode ini ke kurir untuk menerima pesanan',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // QR code
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Image.asset(
                  'assets/images/barcode.png',
                  width: 160,
                  height: 160,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Card kurir
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Kurir 1',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              _circleFilledIcon(Icons.phone),
                              const SizedBox(width: 8),
                              _circleFilledIcon(Icons.chat),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Chat kurir untuk memastikan lokasimu',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Card status pesanan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildOrderCard(
                      kantin: 'Kantin 1',
                      menu: 'Nasi Ayam Geprek',
                      price: 'Rp 10.000',
                      imageUrl: 'assets/images/nasi_ayam.jpg',
                      status: 'Selesai',
                      statusColor: Colors.grey,
                      chatEnabled: false,
                    ),
                    Divider(height: 1, color: Color(0xFFEEEEEE)),
                    _buildOrderCard(
                      kantin: 'Kantin 2',
                      menu: 'Nasi Ayam Geprek',
                      price: 'Rp 10.000',
                      imageUrl: 'assets/images/nasi_ayam.jpg',
                      status: 'Selesai',
                      statusColor: Colors.grey,
                      chatEnabled: false,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static Widget _circleFilledIcon(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: Color(0xFF21A5E7),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildOrderCard({
    required String kantin,
    required String menu,
    required String price,
    required String imageUrl,
    required String status,
    required Color statusColor,
    required bool chatEnabled,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kantin,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  menu,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    const SizedBox(width: 16),
                    const Text('x1', style: TextStyle(fontSize: 15, color: Colors.black87)),
                    const Spacer(),
                    OutlinedButton.icon(
                      onPressed: chatEnabled ? () {} : null,
                      icon: Icon(Icons.chat, size: 18, color: chatEnabled ? const Color(0xFF21A5E7) : Colors.grey),
                      label: Text('Chat', style: TextStyle(color: chatEnabled ? const Color(0xFF21A5E7) : Colors.grey, fontWeight: FontWeight.w500)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: chatEnabled ? const Color(0xFF21A5E7) : Colors.grey),
                        foregroundColor: chatEnabled ? const Color(0xFF21A5E7) : Colors.grey,
                        textStyle: const TextStyle(fontSize: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        minimumSize: const Size(0, 36),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
} 