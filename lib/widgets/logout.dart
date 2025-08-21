import 'package:flutter/material.dart';
import 'package:workout_tracker/extension/navigation.dart'; // extension navigasi custom (ExtendedNavigator)
import 'package:workout_tracker/preference/shared_preference.dart'; // handler untuk SharedPreferences (login state)
import 'package:workout_tracker/widgets/login_page.dart'; // halaman login

/// [LogOutButton] adalah widget tombol untuk keluar (logout).
/// Saat ditekan:
/// 1. Menghapus status login dari SharedPreferences.
/// 2. Mengarahkan user kembali ke halaman [LoginPage].
class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Aksi ketika tombol logout ditekan
      onPressed: () {
        // Hapus login status yang tersimpan di SharedPreferences
        PreferenceHandler.removeLogin();

        // Arahkan user kembali ke halaman Login
        // Menggunakan extension `pushReplacementNamed`
        context.pushReplacementNamed(LoginPage.id);
      },
      // Tampilan teks tombol
      child: const Text("Keluar"),
    );
  }
}
