import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/kantin_text.dart';

class MenuDetailPage extends StatelessWidget {
  final String nama;
  final int harga;

  const MenuDetailPage({super.key, required this.nama, required this.harga});

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
        title: const KantinText(
          text: 'Detail Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          isHeading: true,
        ),
        backgroundColor: const Color(0xFFE88DAA),
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE4EC),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Icon(
                  Icons.cookie,
                  size: 95,
                  color: Color(0xFFCA6689),
                ),
              ),
              const SizedBox(height: 24),
              const KantinText(
                text: 'Menu Pilihan',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFFCA6689),
              ),
              const SizedBox(height: 8),
              KantinText(
                text: nama,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                isHeading: true,
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE4EC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: KantinText(
                  text: formatRupiah(harga),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFCA6689),
                ),
              ),
              const SizedBox(height: 20),
              const KantinText(
                text: 'Temukan camilan manis favoritmu di Kantin Kita!',
                fontSize: 14,
                color: Color(0xFF8D5267),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE88DAA),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  label: const KantinText(
                    text: 'Kembali ke Daftar Menu',
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
