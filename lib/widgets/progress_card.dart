import 'package:flutter/material.dart';

class Progresscard extends StatelessWidget {
  // Judul progress (contoh: "Latihan Mingguan")
  final String title;

  // Subjudul progress (contoh: "5 kali")
  final String subtitle;

  const Progresscard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134, // Lebar card
      height: 134, // Tinggi card (persegi)
      margin: const EdgeInsets.only(
          right: 12), // Jarak antar card (horizontal list)
      padding: const EdgeInsets.all(12), // Padding dalam card
      decoration: BoxDecoration(
        color: Colors.white, // Background putih
        borderRadius: BorderRadius.circular(12), // Sudut membulat
        boxShadow: const [
          BoxShadow(
            color: Colors.black, // Warna bayangan
            blurRadius: 5, // Tingkat blur bayangan
            offset: Offset(2, 2), // Posisi bayangan
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Konten rata tengah secara vertikal
        children: [
          // Teks judul progress
          Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(
              // Bisa pakai font custom seperti Poppins
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8), // Jarak antar teks

          // Teks subjudul progress
          Text(
            subtitle,
            style: const TextStyle(
              // Bisa pakai font custom seperti Montserrat
              fontSize: 12,
              // Bisa pakai AppColor untuk konsistensi
            ),
          ),
        ],
      ),
    );
  }
}

/// note :
/// Progresscard adalah widget kartu ringkasan progress workout. 
/// Biasanya dipakai untuk menampilkan data singkat (statistik) di Dashboard, 
/// misalnya total latihan, durasi, atau kalori.

/// Widget custom untuk menampilkan progress latihan
/// dalam bentuk kartu kecil (square card).

/// Biasanya digunakan di halaman **Dashboard** untuk menampilkan
/// ringkasan progress, seperti:
/// - "Jumlah Latihan: 12x"
/// - "Durasi Total: 5 jam"
/// - "Kalori Terbakar: 1200 kcal"
