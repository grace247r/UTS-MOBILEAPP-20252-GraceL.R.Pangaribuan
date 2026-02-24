import 'package:flutter/material.dart';
import 'package:products_app/profilePage.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  void _showToast(BuildContext context, String item) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text("Purchased $item"),
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF6D4C7D),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProductItem(context, "Shoe", "Comfortable shoes", "\$49.99"),
            _buildProductItem(context, "T-Shirt", "Soft cotton", "\$19.99"),
            _buildProductItem(context, "Headphones", "Noise-cancelling", "\$99.99"),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, String title, String subtitle, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF8E44AD), Color(0xFFF06292)]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 4))],
      ),
      child: ListTile(
        leading: const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.shopping_bag, color: Colors.purple)),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(price, style: const TextStyle(color: Colors.white, fontSize: 10)),
            const SizedBox(height: 4),
            InkWell(
              onTap: () => _showToast(context, title),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(color: Colors.yellow[700], borderRadius: BorderRadius.circular(12)),
                child: const Text("Buy", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

