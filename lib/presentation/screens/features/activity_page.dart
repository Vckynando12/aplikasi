import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktivitas'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Diproses'),
            Tab(text: 'Dikirim'),
            Tab(text: 'Belum Bayar'),
            Tab(text: 'Riwayat'),
          ],
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList('Diproses'),
          _buildOrderList('Dikirim'),
          _buildOrderList('Belum Bayar'),
          _buildOrderList('Riwayat'),
        ],
      ),
      // 
    );
  }

  Widget _buildOrderList(String status) {
    // Sample order data
    final orders = [
      Order(
        id: '#TRDKN2350',
        date: '2024-01-13 12:34:20',
        totalItems: 4,
        totalPrice: 21000,
        status: 'Menunggu Konfirmasi',
      ),
      Order(
        id: '#TRDKN2350',
        date: '2024-01-13 12:34:20',
        totalItems: 4,
        totalPrice: 21000,
        status: 'Menunggu Konfirmasi',
      ),
      Order(
        id: '#TRDKN2351',
        date: '2024-01-13 12:34:20',
        totalItems: 5,
        totalPrice: 50000,
        status: 'Menunggu Konfirmasi',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.receipt_outlined,
                        color: Colors.blue.shade700,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.id,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order.date,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Menu',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${order.totalItems} Menu',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Rp ${order.totalPrice}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      order.status,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Order {
  final String id;
  final String date;
  final int totalItems;
  final int totalPrice;
  final String status;

  Order({
    required this.id,
    required this.date,
    required this.totalItems,
    required this.totalPrice,
    required this.status,
  });
} 