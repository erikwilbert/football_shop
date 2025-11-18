import 'package:flutter/material.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import '../screens/home_page.dart';
import '../screens/add_product_form.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Football Shop Menu',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddProductPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('Product List'),
            onTap: () {
                // Route to product list page
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                );
            },
          ),
        ],
      ),
    );
  }
}
