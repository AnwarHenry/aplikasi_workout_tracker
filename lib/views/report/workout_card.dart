import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout_user.dart';

/// note :
/// Widget [WorkoutCard] digunakan untuk menampilkan data latihan (Workout)
/// dalam bentuk kartu dengan desain gradient dan tombol aksi (Edit, Delete).

/// Parameter yang diperlukan:
/// - [data]: objek [WorkoutUser] yang menyimpan informasi schedule, categories, dan stage.
/// - [onEdit]: callback yang dipanggil ketika tombol edit ditekan.
/// - [onDelete]: callback yang dipanggil ketika tombol delete ditekan.

class WorkoutCard extends StatelessWidget {
  final WorkoutUser data; // Data workout yang akan ditampilkan
  final VoidCallback onEdit; // Fungsi callback ketika tombol edit ditekan
  final VoidCallback onDelete; // Fungsi callback ketika tombol delete ditekan

  const WorkoutCard({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Memberikan efek bayangan (shadow) pada card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Membulatkan sudut card
      ),
      margin: const EdgeInsets.only(bottom: 20), // Jarak antar card
      child: Container(
        height: 160,
        width: double.infinity,
        padding: const EdgeInsets.all(16), // Padding isi card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // Background card berupa gradient
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFF6B35), // Orange
              Color(0xFFFF8A65), // Light Orange
              Color(0xFFFF5252), // Red-Orange
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        // Isi dari kartu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian atas card: Schedule + Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Menampilkan jadwal latihan (schedule)
                Text(
                  data.schedule,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Tombol edit dan delete
                Row(
                  children: [
                    IconButton(
                      onPressed: onEdit, // Jalankan fungsi edit
                      icon: const Icon(Icons.edit, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: onDelete, // Jalankan fungsi delete
                      icon: const Icon(Icons.delete, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Menampilkan kategori latihan
            Text(
              data.categories,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Menampilkan tahapan/stage latihan
            Text(
              data.stage,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// note tambahan:
/// Card dengan Gradient → Menampilkan data workout dengan tampilan menarik.
// Schedule → Ditampilkan di bagian atas, menunjukkan jadwal latihan.
// Categories & Stage → Ditampilkan di bawahnya, untuk jenis kategori & tahapan.
// Tombol Edit/Delete → Memberi pengguna kemampuan mengedit atau menghapus data.
