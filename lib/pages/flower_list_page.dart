import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/flower_text.dart';
import 'add_flower_page.dart';
import 'flower_detail_page.dart';

class FlowerListPage extends StatefulWidget {
  const FlowerListPage({super.key});

  @override
  State<FlowerListPage> createState() => _FlowerListPageState();
}

class _FlowerListPageState extends State<FlowerListPage> {
  final List<Map<String, dynamic>> daftarBunga = [
    {'nama': 'Peony', 'harga': 200000},
    {'nama': 'Mawar Ekuador', 'harga': 100000},
    {'nama': 'Tulip Impor', 'harga': 65000},
    {'nama': 'Sunflower Bliss', 'harga': 50000},
    {'nama': 'Lily Elegance', 'harga': 95000},
  ];

  String formatRupiah(int harga) {
    final angka = harga.toString();
    final hasil = angka.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return 'Rp$hasil';
  }

  Future<void> tambahBunga() async {
    final hasil = await Get.to<Map<String, dynamic>>(
      () => const AddFlowerPage(),
    );

    if (hasil != null) {
      setState(() {
        daftarBunga.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FlowerText(
          text: 'Bloom & Petal',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          isHeading: true,
        ),
        backgroundColor: const Color(0xFF789477),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: FlowerText(
              text: 'For the moments that matter, there is a bloom for every memory.',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF526B55),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarBunga.length,
              itemBuilder: (context, index) {
                final bunga = daftarBunga[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  color: const Color(0xFFFFF9F2),
                  child: ListTile(
                    leading: const Icon(
                      Icons.local_florist,
                      color: Color(0xFFD98C9A),
                      size: 32,
                    ),
                    title: FlowerText(
                      text: bunga['nama'] as String,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: FlowerText(
                      text: formatRupiah(bunga['harga'] as int),
                      fontSize: 14,
                      color: const Color(0xFFD17B8A),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFF789477),
                    ),
                    onTap: () {
                      Get.to(
                        () => FlowerDetailPage(
                          nama: bunga['nama'] as String,
                          harga: bunga['harga'] as int,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tambahBunga,
        backgroundColor: const Color(0xFFD98C9A),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
