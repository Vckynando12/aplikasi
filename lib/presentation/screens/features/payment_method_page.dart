import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int _selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metode Pembayaran'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Metode Pembayaran Tersimpan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: RadioListTile(
              value: 0,
              groupValue: _selectedMethod,
              onChanged: (value) => setState(() => _selectedMethod = value!),
              title: const Text('Polije Pay'),
              subtitle: const Text('Saldo: Rp 25.000'),
              secondary: const Icon(Icons.account_balance_wallet),
            ),
          ),
          Card(
            child: RadioListTile(
              value: 1,
              groupValue: _selectedMethod,
              onChanged: (value) => setState(() => _selectedMethod = value!),
              title: const Text('DANA'),
              subtitle: const Text('085123456789'),
              secondary: const Icon(Icons.payment),
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {
              // Show add payment method form
              _showAddPaymentMethodDialog(context);
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('Tambah Metode Pembayaran'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Save selected payment method and return
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          child: const Text('Simpan'),
        ),
      ),
    );
  }

  Future<void> _showAddPaymentMethodDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Metode Pembayaran'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nomor Kartu',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Kadaluarsa',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nama Pemilik Kartu',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              // Save new payment method
              Navigator.pop(context);
            },
            child: const Text('Tambah'),
          ),
        ],
      ),
    );
  }
} 