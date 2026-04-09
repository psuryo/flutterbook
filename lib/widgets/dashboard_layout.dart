import 'package:flutter/material.dart';
import 'package:my_book_app/widgets/interactive_button.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1. Sidebar (Lebar Tetap)
        Container(
          width: 250,
          color: Colors.grey[900],
          child: Column(
            children: const [
              DrawerHeader(
                child: Text("MENU", style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text("Beranda", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text("Pengaturan", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),

        // 2. Main Content (Mengisi sisa ruang menggunakan Expanded)
        Expanded(
          child: Container(
            color: Colors.white,
            child: const Center(
              child: InteractiveButton(initialText: 'Tekan Saya'), // Menampilkan widget penghitung kita di area konten
            ),
          ),
        ),
      ],
    );
  }
}