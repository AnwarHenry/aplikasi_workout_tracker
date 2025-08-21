import 'package:flutter/material.dart';
import 'package:workout_tracker/views/Beranda/dashboard_page.dart';
import 'package:workout_tracker/views/report/workout_form.dart';
import 'package:workout_tracker/views/report/workout_report.dart';
import 'package:workout_tracker/views/settings.dart';

// Widget utama untuk navigasi bawah (Bottom Navigation Bar)
class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  static const id = "/BottomNavbar"; // route id agar mudah dipanggil

  @override
  State<BottomNavbar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavbar> {
  int _currentIndex = 0; // Menyimpan index menu yang aktif

  // List halaman yang bisa diakses lewat bottom navbar
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(), // Halaman dashboard
    WorkoutForm(), // Halaman form input workout
    WorkoutReport(), // Halaman laporan workout
    SettingsPage(), // Halaman drawer
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menampilkan halaman sesuai index yang dipilih
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar:
          _buildCircleNavBar(), // Memanggil method custom navbar
    );
  }

  // Membuat tampilan bottom navigation bar custom
  Widget _buildCircleNavBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 44, 168, 240), // Warna background navbar
        borderRadius: BorderRadius.only(
          topLeft:
              Radius.circular(5), // Membuat ujung atas kiri agak melengkung
          topRight:
              Radius.circular(5), // Membuat ujung atas kanan agak melengkung
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Membagi item rata
        children: [
          // Menu Dashboard
          _buildNavItem(Icons.explore, "Dashboard", 0),
          // Menu Report
          _buildNavItem(Icons.edit_document, "Form Workout", 1),
          // Menu Report
          _buildNavItem(Icons.bar_chart_rounded, "Report", 2),
          // Menu Settings
          _buildNavItem(Icons.settings_applications, "Settings", 3),

          // Menu Form Workout (pakai gambar custom asset)
          // _buildNavItem(
          //   Icons.explore,
          //   "Form Workout",
          //   2,
          //   image: 'assets/images/form-barble.png',
          //   assetimage: true,
          // ),
        ],
      ),
    );
  }

  // Membuat widget item navigasi (ikon + label)
  Widget _buildNavItem(IconData icon, String label, int index,
      {bool assetimage = false, String? image}) {
    bool isSelected = _currentIndex == index; // Cek apakah item sedang dipilih
    return GestureDetector(
      // Saat ditekan, ubah halaman sesuai index
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ikon bulat
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // Warna berubah jika item dipilih
              color: isSelected
                  ? const Color.fromARGB(255, 148, 34, 255) // Ungu jika aktif
                  : Colors.transparent, // Transparan jika tidak aktif
            ),
            // Jika pakai gambar asset
            child: assetimage
                ? Image.asset(image!)
                // Jika pakai ikon bawaan
                : Icon(
                    icon,
                    color: isSelected ? Colors.white : Colors.grey[300],
                    size: 24,
                  ),
          ),
          const SizedBox(height: 4),
          // Label di bawah ikon
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[300],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
