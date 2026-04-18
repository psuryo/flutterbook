import 'package:flutter/material.dart';
import 'package:my_book_app/widgets/custom_container.dart';
import 'package:my_book_app/widgets/interactive_button.dart';
import 'package:my_book_app/_pages/profil_page.dart';

class DashboardLayout extends StatefulWidget {
  final int counter;
  const DashboardLayout({super.key, this.counter = 0});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  // 1. Variabel untuk melacak menu yang dipilih
  int _selectedIndex = 0;

  // 2. Fungsi untuk mengubah index saat menu diklik
  void _onMenuTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 3. Daftar halaman (bisa diisi widget lain nanti)
    final List<Widget> pages = [
      _buildMainContent(), // Halaman Beranda (Counter Anda)
      _buildSettingsPage(), // Halaman Pengaturan
      const ProfilPage(), // Halaman Profil
    ];

    return Row(
      children: [
        // Sidebar (Menu)
        Container(
          width: 250,
          color: Colors.grey[900],
          child: Column(
            children: [
              const DrawerHeader(
                child: Text("MENU", style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              _buildMenuItem(0, Icons.home, "Beranda"),
              const Divider(color: Colors.grey),
              _buildMenuItem(1, Icons.settings, "Pengaturan"),
              _buildMenuItem(2, Icons.person, "Profil"),
            ],
          ),
        ),

        // Main Content
        Expanded(
          child: IndexedStack( // IndexedStack menyimpan status halaman
            index: _selectedIndex,
            children: pages,
          ),
        ),
      ],
    );
  }

  // Widget pembantu untuk item sidebar
  Widget _buildMenuItem(int index, IconData icon, String title) {
    return ListTile(
      selected: _selectedIndex == index,
      selectedTileColor: Colors.blueAccent.withValues(alpha: 0.3),
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () => _onMenuTap(index),
    );
  }

  // Widget pembantu untuk konten utama Beranda
  Widget _buildMainContent() {
    return CustomContainer(
      startColor: const Color.fromARGB(255, 143, 243, 153),
      endColor: const Color.fromARGB(255, 9, 111, 81),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/flutter-logo.png', height: 100),
            const SizedBox(height: 20),
            const Text('You have pushed the button this many times:',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 10),
            Text('${widget.counter}',
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 20),
            const InteractiveButton(initialText: 'Tekan Saya'),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk halaman Pengaturan
  Widget _buildSettingsPage() {
    return CustomContainer(
      startColor: const Color.fromARGB(255, 255, 200, 100),
      endColor: const Color.fromARGB(255, 200, 100, 50),
      child: const Center(
        child: Text(
          "Halaman Pengaturan",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}