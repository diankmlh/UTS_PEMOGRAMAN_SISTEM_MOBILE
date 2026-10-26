import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Playfair Display digunakan untuk judul agar terlihat anggun dan premium.
// Inter digunakan untuk teks isi agar nama bunga dan harga tetap mudah dibaca.
// Ukuran, ketebalan, warna, dan jenis font dapat diatur melalui parameter widget.
class FlowerText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final bool isHeading;

  const FlowerText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = const Color(0xFF526B55),
    this.isHeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: (isHeading
          ? GoogleFonts.playfairDisplay(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            )
          : GoogleFonts.inter(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            )),
    );
  }
}
