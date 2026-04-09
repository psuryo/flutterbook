import 'package:flutter/material.dart';

// 1. Kelas StatefulWidget
class InteractiveButton extends StatefulWidget {
  // Properti untuk teks awal tombol
  final String initialText;

  // Constructor untuk InteractiveButton.
  // Properti initialText bersifat wajib karena tidak ada nilai default.
  const InteractiveButton({
    super.key,
    required this.initialText,
  });

  @override
  State<InteractiveButton> createState() => _InteractiveButtonState();
}

// 2. Kelas State yang terkait dengan InteractiveButton
class _InteractiveButtonState extends State<InteractiveButton> {
  // Variabel state yang akan berubah
  late String _buttonText; // Menggunakan 'late' karena diinisialisasi di initState

  @override
  void initState() {
    super.initState();
    // Inisialisasi state awal menggunakan properti dari widget
    _buttonText = widget.initialText;
  }

  // Metode yang akan dipanggil saat tombol ditekan
  void _handleButtonPressed() {
    // setState() adalah fungsi kunci untuk mengubah state
    setState(() {
      // Ubah nilai _buttonText
      _buttonText = (_buttonText == widget.initialText) ? 'Anda Klik Saya!' : widget.initialText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handleButtonPressed, // Memanggil fungsi saat tombol ditekan
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.teal, // Warna latar belakang tombol
        foregroundColor: Colors.white, // Warna teks tombol
      ),
      child: Text(_buttonText), // Menampilkan teks dari variabel state
    );
  }
}