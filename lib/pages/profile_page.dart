import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: const Color(0xFF2874A6),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Foto profil
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/foto_profil.png'),
            ),
            const SizedBox(height: 20),

            // Nama dan informasi dasar
            const Text(
              'Andi Mahasiswa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2874A6),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'NPM: 23670104',
              style: TextStyle(color: Colors.black54),
            ),
            const Text(
              'Email: adamalfa@gmail.com',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 15),

            // Kartu info tambahan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Program Studi:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text('Informatika'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Semester:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text('5'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text('Aktif'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Tombol kembali
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2874A6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
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
