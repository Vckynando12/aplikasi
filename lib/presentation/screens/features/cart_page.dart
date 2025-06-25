import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _items = [
    CartItem(
      name: 'Nasi Ayam Geprek',
      price: 10000,
      quantity: 1,
      location: 'Kantin 1',
      imageUrl: 'assets/images/nasi_ayam.jpg',
    ),
    CartItem(
      name: 'Nasi Ayam Geprek',
      price: 10000,
      quantity: 1,
      location: 'Kantin 2',
      imageUrl: 'assets/images/nasi_ayam.jpg',
    ),
  ];

  double get _totalPrice => _items.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Keranjang'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            item.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Food Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.location,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rp ${item.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.receipt_outlined,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Catatan',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Quantity Controls
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                setState(() {
                                  _items.removeAt(index);
                                });
                              },
                              color: Colors.grey,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: item.quantity > 1
                                      ? () {
                                          setState(() {
                                            item.quantity--;
                                          });
                                        }
                                      : null,
                                  color: Colors.blue,
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    '${item.quantity}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                  color: Colors.blue,
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                              ],
                            ),
                          ],
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
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Biaya Pengiriman'),
                    Text(
                      '+ Rp 2.000',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp ${_totalPrice + 2000}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/confirm-order');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Pesan Sekarang'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final int price;
  int quantity;
  final String location;
  final String imageUrl;

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.location,
    required this.imageUrl,
  });
}