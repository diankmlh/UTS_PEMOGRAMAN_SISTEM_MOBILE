import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/menu_list_page.dart';

void main() {
  runApp(const KantinKitaApp());
}

class KantinKitaApp extends StatelessWidget {
  const KantinKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kantin Kita',
      theme: ThemeData(
        useMaterial3: true,
        // Pink muda memberikan kesan manis dan lembut.
        scaffoldBackgroundColor: const Color(0xFFFFF5F7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE88DAA),
          primary: const Color(0xFFE88DAA),
          secondary: const Color(0xFFCA6689),
          surface: const Color(0xFFFFFBFC),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE88DAA),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE88DAA), width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE88DAA),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const MenuListPage(),
    );
  }
}
