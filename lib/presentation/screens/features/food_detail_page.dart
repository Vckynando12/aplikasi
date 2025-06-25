import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final String location;

  const FoodDetailPage({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.location,
  });

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              widget.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                
                // Description
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                
                // Price and Location
                Row(
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.location,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Action Buttons
                Row(
                  children: [
                    _buildActionButton(
                      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                      label: 'Favorit',
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      color: isFavorite ? Colors.red : Colors.grey[600],
                    ),
                    const SizedBox(width: 32),
                    _buildActionButton(
                      icon: Icons.report_outlined,
                      label: 'Lapor',
                      onTap: () {},
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 32),
                    _buildActionButton(
                      icon: Icons.share_outlined,
                      label: 'Bagikan',
                      onTap: () {},
                      color: Colors.grey[600],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Tambah Pembelian',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 22,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
} 