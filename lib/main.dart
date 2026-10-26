import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/flower_list_page.dart';

void main() {
  runApp(const BloomPetalApp());
}

class BloomPetalApp extends StatelessWidget {
  const BloomPetalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloom & Petal',
      theme: ThemeData(
        useMaterial3: true,

        // Warna cream digunakan sebagai latar agar tampilan terasa hangat dan nyaman dilihat.
        scaffoldBackgroundColor: const Color(0xFFFFFCF8),

        colorScheme: ColorScheme.fromSeed(
          // Sage green dipilih sebagai warna utama untuk memberikan kesan natural, segar, dan elegan.
          seedColor: const Color(0xFF789477),
          primary: const Color(0xFF789477),

          // Dusty pink digunakan sebagai warna aksen untuk memberikan sentuhan lembut dan feminin yang sesuai dengan toko bunga.
          secondary: const Color(0xFFD98C9A),

          surface: const Color(0xFFFFFCF8),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF789477),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF789477), width: 2),
          ),
        ),
      ),
      home: const FlowerListPage(),
    );
  }
}
