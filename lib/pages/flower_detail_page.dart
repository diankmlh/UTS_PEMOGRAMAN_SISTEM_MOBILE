import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/flower_text.dart';

class FlowerDetailPage extends StatelessWidget {
  final String nama;
  final int harga;

  const FlowerDetailPage({super.key, required this.nama, required this.harga});

  String formatRupiah(int harga) {
    final angka = harga.toString();
    final hasil = angka.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return 'Rp$hasil';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FlowerText(
          text: 'Detail Bunga',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          isHeading: true,
        ),
        backgroundColor: const Color(0xFF789477),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.local_florist,
                size: 100,
                color: Color(0xFFD98C9A),
              ),
              const SizedBox(height: 24),
              FlowerText(text: nama, fontSize: 24, fontWeight: FontWeight.bold),
              const SizedBox(height: 12),
              FlowerText(
                text: formatRupiah(harga),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFD17B8A),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF789477),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const FlowerText(
                    text: 'Kembali ke Daftar',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
