import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/flower_text.dart';

class AddFlowerPage extends StatefulWidget {
  const AddFlowerPage({super.key});

  @override
  State<AddFlowerPage> createState() => _AddFlowerPageState();
}

class _AddFlowerPageState extends State<AddFlowerPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FlowerText(
          text: 'Add Your Flowers',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          isHeading: true,
        ),
        backgroundColor: const Color(0xFF789477),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Flower Bouquet Name',
                  hintText: 'Example: Pink Rose Bouquet',
                  prefixIcon: Icon(Icons.local_florist),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Flower name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Flower Price',
                  hintText: 'Example: 85000',
                  prefixIcon: Icon(Icons.payments_outlined),
                  prefixText: 'Rp ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Flower price is required';
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
                    return 'Price must contain numbers only';
                  }

                  final harga = int.tryParse(value.trim());

                  if (harga == null || harga <= 0) {
                    return 'Price must be greater than zero';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final bunga = <String, dynamic>{
                      'nama': _namaController.text.trim(),
                      'harga': int.parse(_hargaController.text.trim()),
                    };

                    Get.back(result: bunga);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF789477),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 15,
                  ),
                ),
                child: const FlowerText(
                  text: 'Save Flower',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
