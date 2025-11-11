import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notifAktif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: const Color(0xFF2874A6),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5CB8FF), Color(0xFF007BFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'Pengaturan Aplikasi',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Pengaturan mode gelap
            SwitchListTile(
              activeColor: Colors.white,
              title: const Text(
                'Mode Gelap',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Aktifkan mode gelap pada tampilan aplikasi',
                style: TextStyle(color: Colors.white70),
              ),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            const Divider(color: Colors.white70),

            // Pengaturan notifikasi
            SwitchListTile(
              activeColor: Colors.white,
              title: const Text(
                'Notifikasi',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Aktifkan pemberitahuan aplikasi',
                style: TextStyle(color: Colors.white70),
              ),
              value: _notifAktif,
              onChanged: (value) {
                setState(() {
                  _notifAktif = value;
                });
              },
            ),
            const Divider(color: Colors.white70),

            const SizedBox(height: 30),

            // Tombol kembali ke dashboard
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF2874A6),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
