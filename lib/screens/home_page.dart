import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/product_card.dart';
import 'add_product_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List produk sementara
  List<Map<String, dynamic>> products = [];

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  // Fungsi untuk menambahkan produk baru
  Future<void> _navigateToAddProduct() async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductPage()),
    );

    if (newProduct != null && newProduct is Map<String, dynamic>) {
      setState(() {
        products.add(newProduct);
      });
      _showSnackbar('Produk "${newProduct['name']}" berhasil ditambahkan!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burhan Sportswear'),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: products.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _showSnackbar('Kamu telah menekan tombol All Products'),
                    icon: const Icon(Icons.list),
                    label: const Text('All Products'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(200, 50),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => _showSnackbar('Kamu telah menekan tombol My Products'),
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('My Products'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(200, 50),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _navigateToAddProduct,
                    icon: const Icon(Icons.add_box),
                    label: const Text('Tambah Produk'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(200, 50),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return ProductCard(
                  name: p['name'],
                  price: p['price'],
                  description: p['description'],
                  thumbnail: p['thumbnail'],
                  category: p['category'],
                  isFeatured: p['isFeatured'],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProduct,
        child: const Icon(Icons.add),
        tooltip: 'Tambah Produk',
      ),
    );
  }
}
