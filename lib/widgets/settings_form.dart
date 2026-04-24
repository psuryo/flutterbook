import 'package:flutter/material.dart';
import 'dart:developer' as developer; // 1. Import library developer

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  bool _isDarkMode = false;
  String _selectedRole = 'Admin';
  double _sensitivity = 50.0;
  // 2. Selalu dispose controller untuk mencegah memory leak
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // 3. Menggunakan developer.log sebagai pengganti print
      developer.log(
        "Data disimpan: ${_nameController.text}",
        name: "settings_form", // Gunakan nama agar mudah difilter di konsol
        level: 0, // Level 0 biasanya untuk INFO
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil berhasil diperbarui!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Perbarui Profil",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                if (value.length < 3) {
                  return 'Nama terlalu pendek';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                // 1. Cek apakah kosong
                if (value == null || value.isEmpty) {
                  return 'Email wajib diisi';
                }

                // 2. Regex untuk memvalidasi format email
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Format email tidak valid';
                }

                return null; // Valid
              },
            ),

            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Username'),
              autovalidateMode: AutovalidateMode
                  .onUserInteraction, // Validasi berjalan saat pengguna berinteraksi
              validator: (value) {
                if (value!.length < 5) return 'Minimal 5 karakter';
                return null;
              },
            ),
            const SizedBox(height: 20),

            SwitchListTile(
              title: const Text("Aktifkan Mode Gelap"),
              value: _isDarkMode,
              onChanged: (bool value) => setState(() => _isDarkMode = value),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: _selectedRole,
              decoration: const InputDecoration(
                labelText: 'Pilih Peran Pengguna',
              ),
              items: ['Admin', 'Editor', 'Viewer'].map((role) {
                return DropdownMenuItem(value: role, child: Text(role));
              }).toList(),
              onChanged: (value) => setState(() => _selectedRole = value!),
            ),
            const SizedBox(height: 20),
            Text("Tingkat Sensitivitas: ${_sensitivity.round()}"),
            Slider(
              value: _sensitivity,
              min: 0,
              max: 100,
              divisions: 10,
              label: "${_sensitivity.round()}",
              onChanged: (double value) => setState(() => _sensitivity = value),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }
}
