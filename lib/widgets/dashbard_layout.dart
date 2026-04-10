import 'package:flutter/material.dart';
import 'package:my_book_app/widgets/custom_container.dart';
import 'package:my_book_app/widgets/interactive_button.dart';

class DashboardLayout extends StatelessWidget {
  final int counter;
  const DashboardLayout({super.key, this.counter = 0});

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
          child: CustomContainer(
            startColor: const Color.fromARGB(255, 143, 243, 153),
            endColor: const Color.fromARGB(255, 9, 111, 81),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/flutter-logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$counter',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const InteractiveButton(initialText: 'Tekan Saya'), // Menampilkan widget penghitung kita di area konten
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}