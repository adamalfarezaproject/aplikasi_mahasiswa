import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiMahasiswa());
}

class AplikasiMahasiswa extends StatefulWidget {
  const AplikasiMahasiswa({super.key});

  @override
  State<AplikasiMahasiswa> createState() => _AplikasiMahasiswaState();
}

class _AplikasiMahasiswaState extends State<AplikasiMahasiswa> {
  bool _isDarkTheme = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Mahasiswa',
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: LoginPage(onThemeChange: _toggleTheme, isDarkTheme: _isDarkTheme),
    );
  }
}

// ---------------------- LOGIN PAGE ----------------------

class LoginPage extends StatefulWidget {
  final Function(bool) onThemeChange;
  final bool isDarkTheme;

  const LoginPage({
    super.key,
    required this.onThemeChange,
    required this.isDarkTheme,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DashboardPage(
            onThemeChange: widget.onThemeChange,
            isDarkTheme: widget.isDarkTheme,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5DADE2), Color(0xFF2874A6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/foto_profil.png'),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Silakan login untuk melanjutkan',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      labelText: 'Email / Username',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Email tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Password tidak boleh kosong' : null,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------- DASHBOARD PAGE ----------------------

class DashboardPage extends StatelessWidget {
  final Function(bool) onThemeChange;
  final bool isDarkTheme;

  const DashboardPage({
    super.key,
    required this.onThemeChange,
    required this.isDarkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Mahasiswa'),
        backgroundColor: const Color(0xFF2874A6),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifikasi',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationsPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginPage(
                    onThemeChange: onThemeChange,
                    isDarkTheme: isDarkTheme,
                  ),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF5DADE2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Halo, Adam',
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 5),
                Text('Selamat datang kembali!',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                _menuItem(context, Icons.person, 'Profil', onThemeChange,
                    isDarkTheme),
                _menuItem(context, Icons.list, 'Data', onThemeChange,
                    isDarkTheme),
                _menuItem(context, Icons.settings, 'Pengaturan', onThemeChange,
                    isDarkTheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _menuItem(BuildContext context, IconData icon, String label,
      Function(bool) onThemeChange, bool isDarkTheme) {
    return GestureDetector(
      onTap: () {
        if (label == 'Profil') {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const ProfilePage()));
        } else if (label == 'Pengaturan') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SettingsPage(
                onThemeChange: onThemeChange,
                isDarkTheme: isDarkTheme,
              ),
            ),
          );
        } else if (label == 'Data') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Halaman Data belum dibuat')),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, color: Colors.blue, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

// ---------------------- PROFILE PAGE ----------------------

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: const Color(0xFF2874A6),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/foto_profil.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Andi Mahasiswa',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text('NPM: 23670104'),
            const Text('Email: adamalfa@gmail.com'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Prodi: Informatika'),
                SizedBox(width: 15),
                Text('Semester: 5'),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke Dashboard'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------- SETTINGS PAGE ----------------------

class SettingsPage extends StatelessWidget {
  final Function(bool) onThemeChange;
  final bool isDarkTheme;

  const SettingsPage({
    super.key,
    required this.onThemeChange,
    required this.isDarkTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: const Color(0xFF2874A6),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SwitchListTile(
            title: const Text('Tema Gelap'),
            subtitle: const Text('Aktifkan atau nonaktifkan mode gelap'),
            value: isDarkTheme,
            onChanged: onThemeChange,
            secondary: const Icon(Icons.palette),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text('Keamanan'),
            subtitle: Text('Ubah password akun'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('Tentang Aplikasi'),
            subtitle: Text('Versi 1.0.0'),
          ),
        ],
      ),
    );
  }
}

// ---------------------- NOTIFICATIONS PAGE ----------------------

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: const Color(0xFF2874A6),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Belum ada notifikasi baru 😊',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
