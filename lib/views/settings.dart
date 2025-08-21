import 'package:flutter/material.dart';
import 'package:workout_tracker/extension/navigation.dart';
import 'package:workout_tracker/preference/shared_preference.dart';
import 'package:workout_tracker/widgets/screen_before_login.dart';

/// note :
/// Halaman pengaturan (SettingsPage)
/// Menyediakan berbagai opsi konfigurasi aplikasi seperti:
/// - Notifikasi
/// - Tema
/// - Bahasa
/// - Backup
/// Serta tombol untuk LOG OUT.
/// ListView.builder → membuat daftar pengaturan secara dinamis.
// ElevatedButton + ListTile → setiap setting tampil dengan ikon bulat + judul + panah.

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  // Route ID → supaya bisa dipanggil dengan navigator menggunakan nama
  static const id = "/settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  /// Data list untuk menampilkan item settings.
  /// Setiap item berisi `title` (judul) dan `icons` (ikon).
  final List<Map<String, dynamic>> settings = [
    {"title": "Locations", "icons": Icons.location_on_sharp},
    {"title": "Notifications", "icons": Icons.notifications},
    {"title": "Close Friends", "icons": Icons.star},
    {"title": "Sounds", "icons": Icons.volume_up},
    {"title": "Privacy", "icons": Icons.lock},
    {"title": "Measurement Units", "icons": Icons.monitor_heart},
    {"title": "Theme", "icons": Icons.dark_mode},
    {"title": "Language", "icons": Icons.language_sharp},
    {"title": "Backup & Restore", "icons": Icons.restore},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // warna dasar halaman
      body: SingleChildScrollView(
        // Agar halaman bisa discroll jika item terlalu banyak
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul halaman
              SizedBox(height: 25),
              Text(
                "Settings",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              // Membuat daftar pengaturan dari list `settings`
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: settings.length,
                itemBuilder: (BuildContext context, int index) {
                  final dataSettings = settings[index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(bottom: 10),
                      backgroundColor: Colors.white,
                      elevation: 0, // biar rata tanpa bayangan
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    // TODO: Tambahkan aksi sesuai kebutuhan (misalnya buka halaman baru)
                    onPressed: () {},
                    child: ListTile(
                      // Ikon di dalam lingkaran biru
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Center(
                          child: Icon(
                            dataSettings["icons"],
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      // Teks judul setting
                      title: Text(
                        dataSettings["title"],
                        style: const TextStyle(
                          // fontFamily: "Montserrat",
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // Ikon panah → menandakan bisa masuk ke detail
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              // Tombol LOG OUT
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 3, 75, 134),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Hapus status login di SharedPreferences
                    PreferenceHandler.removeLogin();
                    // Arahkan user kembali ke halaman sebelum login
                    context.pushReplacement(const Screen1());
                  },
                  child: const Text(
                    "LOG OUT",
                    style: TextStyle(
                      // fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
