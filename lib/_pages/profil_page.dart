import 'package:flutter/material.dart';
import 'package:my_book_app/widgets/custom_container.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      startColor: const Color.fromARGB(255, 143, 243, 153),
      endColor: const Color.fromARGB(255, 9, 111, 81),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/flutter-logo.png', height: 150),
            const SizedBox(height: 20),
            const Text(
              'Profil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
