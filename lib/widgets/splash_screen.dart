import 'package:flutter/material.dart';
import 'package:workout_tracker/extension/navigation.dart';
import 'package:workout_tracker/preference/shared_preference.dart';
import 'package:workout_tracker/views/Beranda/bottom_navbar.dart';
import 'package:workout_tracker/widgets/screen_before_login.dart';

/// SplashScreen adalah halaman pertama yang muncul saat aplikasi dijalankan.
/// Halaman ini digunakan untuk:
/// 1. Menampilkan logo/gambar sebagai intro aplikasi.
/// 2. Mengecek apakah user sudah login (dengan SharedPreferences).
/// 3. Mengarahkan user ke halaman login/register atau dashboard utama.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  // Route ID agar halaman ini bisa dipanggil dengan named route
  static const id = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Saat halaman pertama kali dimuat, langsung cek status login
    isLogin();
  }

  /// Fungsi untuk mengecek apakah user sudah login atau belum
  void isLogin() async {
    // Ambil data login dari SharedPreferences (true jika sudah login)
    bool? isLogin = await PreferenceHandler.getLogin();

    // Tambahkan delay 2 detik agar splash terlihat
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      // Debug print untuk cek status login di console
      print("Status login: $isLogin");

      if (isLogin == true) {
        // Jika sudah login → arahkan ke halaman utama (BottomNavbar)
        context.pushReplacementNamed(BottomNavbar.id);
      } else {
        // Jika belum login → arahkan ke halaman login/register
        context.push(const Screen1());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background splash screen
        decoration: const BoxDecoration(
          image: DecorationImage(
            // Menampilkan gambar dari folder assets
            image: AssetImage("assets/images/workout.png"),
          ),
        ),
        child: Center(
          // Bisa tambahkan logo atau loading indicator di tengah
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 16),
              // Loading animasi kecil di bawah logo
              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
