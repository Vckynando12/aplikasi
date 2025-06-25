import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pilih Metode Pembayaran',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Virtual Account',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          _buildPaymentItem(
            'assets/images/briva.png',
            'BRI Virtual Account',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/mandiri.png',
            'Mandiri Virtual Account',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/bni.png',
            'BNI Virtual Account',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/bca.png',
            'BCA Virtual Account',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/bsi.png',
            'BSI Virtual Account',
            onTap: () => Navigator.pop(context),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'E-Wallet',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          _buildPaymentItem(
            'assets/images/poli.png',
            'Polije Pay',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/dana.png',
            'Dana',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/ovo.png',
            'OVO',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/gopay.png',
            'Gopay',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/shopeepay.png',
            'Shopeepay',
            onTap: () => Navigator.pop(context),
          ),
          _buildPaymentItem(
            'assets/images/qris.png',
            'QRIS',
            onTap: () => Navigator.pop(context),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Metode Pembayaran Lainnya',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          _buildPaymentItem(
            'assets/images/cash.png',
            'Tunai',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(String imagePath, String title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
} 