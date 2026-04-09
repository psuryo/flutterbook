import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child; // Properti untuk menampung widget anak
  final Color startColor; // Warna awal gradasi
  final Color endColor;   // Warna akhir gradasi

  const CustomContainer({
    super.key,
    this.child,
    this.startColor = Colors.blue, // Nilai default jika tidak diberikan
    this.endColor = Colors.purple,  // Nilai default jika tidak diberikan
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child, // Menampilkan widget anak yang diberikan
    );
  }
}