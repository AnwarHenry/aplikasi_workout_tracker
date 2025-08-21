import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  // Widget di bagian kiri (ikon, gambar, atau logo kategori)
  final Widget leading;

  // Judul kategori (contoh: "Cardio Workout")
  final String title;

  // Subjudul kategori (contoh: "Durasi 30 menit")
  final String subtitle;

  // Widget di bagian kanan (contoh: ikon panah, tombol detail, dsb.)
  final Widget trailing;

  const CategoriesPage({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71, // Tinggi card kategori
      width: double.infinity, // Lebar penuh sesuai parent
      margin: const EdgeInsets.only(bottom: 12), // Jarak bawah antar card
      padding: const EdgeInsets.all(12), // Padding dalam card
      decoration: BoxDecoration(
        color: Colors.white, // Warna background card
        borderRadius: BorderRadius.circular(12), // Sudut membulat
        boxShadow: const [
          BoxShadow(
            // Warna bayangan bisa diatur (default abu2 samar)
            blurRadius: 6, // Seberapa lembut bayangan
            offset: Offset(2, 2), // Posisi bayangan (x=2, y=2)
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Konten sejajar vertikal tengah
        children: [
          // Bagian leading (ikon/gambar di kiri)
          leading,
          const SizedBox(width: 12), // Jarak antara ikon dan teks

          // Bagian teks judul + subjudul
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
              mainAxisAlignment:
                  MainAxisAlignment.center, // Vertikal rata tengah
              children: [
                // Judul kategori
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    // Bisa pakai font family & warna custom sesuai AppColor
                  ),
                ),
                const SizedBox(height: 4), // Jarak antar teks
                // Subjudul kategori
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    // Bisa pakai font family & warna custom sesuai AppColor
                  ),
                ),
              ],
            ),
          ),

          // Bagian trailing (ikon/tombol kanan)
          trailing,
        ],
      ),
    );
  }
}

/// Note :
/// Widget custom (reusable) untuk menampilkan item kategori.
/// Biasanya dipakai untuk menampilkan daftar kategori workout,
/// misalnya "Cardio", "Strength", "Yoga", dsb.
