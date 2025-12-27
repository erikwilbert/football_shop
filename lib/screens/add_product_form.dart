import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/home_page.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  final _thumbController = TextEditingController();
  final _categoryController = TextEditingController();
  bool _isFeatured = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newProduct = {
        'name': _nameController.text.trim(),
        'price': double.parse(_priceController.text.trim()),
        'description': _descController.text.trim(),
        'thumbnail': _thumbController.text.trim(),
        'category': _categoryController.text.trim(),
        'isFeatured': _isFeatured,
      };

      // Return data ke HomePage
      Navigator.pop(context, newProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Produk Baru')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama Produk', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Nama produk tidak boleh kosong';
                  if (value.length < 3) return 'Nama produk minimal 3 karakter';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Harga Produk', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Harga tidak boleh kosong';
                  final price = double.tryParse(value);
                  if (price == null) return 'Harga harus berupa angka';
                  if (price <= 0) return 'Harga harus lebih dari 0';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Deskripsi Produk', border: OutlineInputBorder()),
                minLines: 2,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Deskripsi tidak boleh kosong';
                  if (value.length < 10) return 'Deskripsi minimal 10 karakter';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _thumbController,
                decoration: const InputDecoration(labelText: 'Thumbnail URL', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'URL thumbnail tidak boleh kosong';
                  final pattern = RegExp(r'^(http|https):\/\/[^\s]+$');
                  if (!pattern.hasMatch(value)) return 'Masukkan URL yang valid (http/https)';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Kategori Produk', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Kategori tidak boleh kosong';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              SwitchListTile(
                title: const Text('Featured Product?'),
                value: _isFeatured,
                onChanged: (bool value) => setState(() => _isFeatured = value),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final response = await request.postJson(
                    "http://erik-wilbert-burhansportswear.pbp.cs.ui.ac.id/create-flutter/",
                    jsonEncode({
                      "name": _nameController.text.trim(),
                      "price": double.parse(_priceController.text.trim()),
                      "description": _descController.text.trim(),
                      "thumbnail": _thumbController.text.trim(),
                      "category": _categoryController.text.trim(),
                      "is_featured": _isFeatured,
                    }),
                  );

                  if (context.mounted) {
                    if (response['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Product successfully saved!")),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Something went wrong, please try again.")),
                      );
                    }
                  }
                }
              },
                icon: const Icon(Icons.save),
                label: const Text('Save'),
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
