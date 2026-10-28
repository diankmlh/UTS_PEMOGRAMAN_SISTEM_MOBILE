import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/kantin_text.dart';
import 'add_menu_page.dart';
import 'menu_detail_page.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  final List<Map<String, dynamic>> daftarMenu = [
    {'nama': 'Brownies Cokelat', 'harga': 15000},
    {'nama': 'Donat Strawberry', 'harga': 8000},
    {'nama': 'Cookies Choco Chip', 'harga': 10000},
    {'nama': 'Cheesecake Mini', 'harga': 18000},
    {'nama': 'Waffle Sweet', 'harga': 12000},
  ];

  String formatRupiah(int harga) {
    final angka = harga.toString();
    return 'Rp${angka.replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
  }

  Future<void> tambahMenu() async {
    final hasil = await Get.to<Map<String, dynamic>>(() => const AddMenuPage());

    if (hasil != null) {
      setState(() {
        daftarMenu.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const KantinText(
          text: 'Kantin Kita',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          isHeading: true,
        ),
        backgroundColor: const Color(0xFFE88DAA),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: const KantinText(
              text: 'Menu manis hari ini',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFCA6689),
              isHeading: true,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = daftarMenu[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  color: const Color(0xFFFFFBFC),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFFFFE4EC)),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE4EC),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.cookie,
                        color: Color(0xFFCA6689),
                        size: 28,
                      ),
                    ),
                    title: KantinText(
                      text: menu['nama'] as String,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: KantinText(
                        text: formatRupiah(menu['harga'] as int),
                        fontSize: 14,
                        color: const Color(0xFFCA6689),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFE88DAA),
                    ),
                    onTap: () {
                      Get.to(
                        () => MenuDetailPage(
                          nama: menu['nama'] as String,
                          harga: menu['harga'] as int,
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
        onPressed: tambahMenu,
        backgroundColor: const Color(0xFFE88DAA),
        foregroundColor: Colors.white,
        tooltip: 'Tambah menu',
        child: const Icon(Icons.add),
      ),
    );
  }
}
