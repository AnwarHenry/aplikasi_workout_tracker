import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/extension/navigation.dart';
import 'package:workout_tracker/widgets/logout.dart';

/// Drawer1 adalah widget yang menampilkan Drawer (navigasi samping)
/// berisi informasi user (username & email) yang disimpan di SharedPreferences.
class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // Variabel untuk menyimpan data user
  String username = '';
  String email = '';

  // Menyimpan index halaman yang dipilih di Drawer
  int _selectedIndexDrawer = 0;

  // Daftar halaman yang akan ditampilkan sesuai pilihan Drawer
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text("Halaman 1")), // Misalnya dashboard
    LogOutButton(), // Halaman untuk logout
    // Bisa ditambahkan halaman lain di sini
  ];

  @override
  void initState() {
    super.initState();
    _loadUserProfile(); // Ambil data user saat pertama kali widget dibuka
  }

  /// Mengambil data username & email dari SharedPreferences
  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username') ?? 'Guest';
    final storedEmail = prefs.getString('email') ?? '';
    setState(() {
      username = storedUsername;
      email = storedEmail;
    });
  }

  /// Fungsi untuk mengganti halaman sesuai item Drawer yang dipilih
  void onItemTap(int index) {
    setState(() {
      _selectedIndexDrawer = index;
    });
    context.pop(); // Tutup Drawer setelah pilih menu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body menampilkan halaman sesuai dengan item Drawer yang dipilih
      body: Center(child: _widgetOptions[_selectedIndexDrawer]),

      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Image.asset(
          "assets/images/workout.png", // Logo di AppBar
          height: 75,
          width: 75,
          fit: BoxFit.cover,
        ),
      ),

      // Drawer di sisi kanan layar (karena pakai endDrawer)
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Bagian header dengan informasi user
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange, Colors.grey], // Warna gradasi
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.grey),
              ),
              accountName: Text(username.isNotEmpty ? username : 'Guest'),
              accountEmail: Text(email.isNotEmpty ? email : ''),
            ),

            // Menu item di dalam Drawer
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                onItemTap(0); // Tampilkan Halaman 1
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_applications),
              title: const Text("Settings"),
              onTap: () {
                onItemTap(1); // Tampilkan halaman logout
              },
            ),
            // Bisa tambah menu lain kalau perlu
          ],
        ),
      ),
    );
  }
}

/// note:
/// SharedPreferences → menyimpan username & email supaya bisa tetap ada walau aplikasi ditutup.
// UserAccountsDrawerHeader → menampilkan info profil user (nama + email + avatar).
// ListTile → item navigasi di dalam drawer.
// _selectedIndexDrawer → menentukan halaman mana yang ditampilkan di body.
// context.pop() → menutup Drawer setelah user pilih menu.
