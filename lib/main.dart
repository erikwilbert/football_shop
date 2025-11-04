import 'package:flutter/material.dart';

void main() {
  runApp(const FootballShopApp());
}

class FootballShopApp extends StatelessWidget {
  const FootballShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Shop'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol All Products
            ElevatedButton.icon(
              onPressed: () {
                _showSnackbar(context, 'Kamu telah menekan tombol All Products');
              },
              icon: const Icon(Icons.list),
              label: const Text('All Products'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol My Products
            ElevatedButton.icon(
              onPressed: () {
                _showSnackbar(context, 'Kamu telah menekan tombol My Products');
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text('My Products'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Create Product
            ElevatedButton.icon(
              onPressed: () {
                _showSnackbar(context, 'Kamu telah menekan tombol Create Product');
              },
              icon: const Icon(Icons.add_box),
              label: const Text('Create Product'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
