import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/kantin_text.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({super.key});

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
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
        title: const KantinText(
          text: 'Tambah Menu',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          isHeading: true,
        ),
        backgroundColor: const Color(0xFFE88DAA),
        foregroundColor: Colors.white,
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
                  labelText: 'Nama Makanan atau Minuman',
                  hintText: 'Contoh: Donat Strawberry',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama menu wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Harga Menu',
                  hintText: 'Contoh: 15000',
                  prefixText: 'Rp ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Harga menu wajib diisi';
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
                    return 'Harga harus berupa angka saja';
                  }

                  final harga = int.tryParse(value.trim());

                  if (harga == null || harga <= 0) {
                    return 'Harga harus lebih dari nol';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final menu = <String, dynamic>{
                      'nama': _namaController.text.trim(),
                      'harga': int.parse(_hargaController.text.trim()),
                    };

                    Get.back(result: menu);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE88DAA),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 15,
                  ),
                ),
                child: const KantinText(
                  text: 'Simpan Menu',
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
