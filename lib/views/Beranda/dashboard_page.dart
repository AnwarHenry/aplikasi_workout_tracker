import 'package:flutter/material.dart';
import 'package:workout_tracker/widgets/categories_page.dart';
import 'package:workout_tracker/widgets/progress_card.dart';

/// Halaman utama Dashboard setelah login
/// Menampilkan progress latihan, banner motivasi, dan daftar kategori workout.

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static const id = "/dashboard"; // untuk routing

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// AppBar dengan logo dan tombol notifikasi
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 168, 240),
        title: Image.asset(
          "assets/images/workout.png",
          height: 75,
          width: 75,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Arahkan ke halaman notifikasi
            },
            icon: const Icon(Icons.notifications_active),
            color: Colors.white,
          ),
        ],
      ),

      /// Isi utama halaman
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),

              /// Judul Progress Training
              const Text(
                "Progress Training",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              /// Scroll horizontal berisi Progress Card
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Progresscard(
                      title: "Chest Workout",
                      subtitle: "15 min remaining",
                    ),
                    Progresscard(
                      title: "Legs Workout",
                      subtitle: "23 min remaining",
                    ),
                    Progresscard(
                      title: "Abs Workout",
                      subtitle: "30 min remaining",
                    ),
                    Progresscard(
                      title: "Both Side Plank",
                      subtitle: "30 min remaining",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              /// Banner motivasi dengan tombol "Start Exercise"
              Container(
                width: double.infinity,
                height: 176,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
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
                child: Stack(
                  children: [
                    /// Teks motivasi + tombol start
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Start Set\nYour Workouts\nGoals",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),

                          /// Tombol Start Exercise
                          GestureDetector(
                            onTap: () {
                              // TODO: Arahkan ke halaman latihan
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              child: const Text(
                                "Start Exercise",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Gambar ilustrasi di sisi kanan banner
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          "assets/images/workout_men.png",
                          height: 160,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Bagian daftar kategori latihan
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// Daftar kategori workout
                  Column(
                    children: [
                      CategoriesPage(
                        leading: Image.asset("assets/images/fullbody.png"),
                        title: "Full Body Warm Up",
                        subtitle: "20 Exercise - 22 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/plank.png"),
                        title: "Strength Exercise",
                        subtitle: "12 Exercise - 14 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/bothside.png"),
                        title: "Both Side Plank",
                        subtitle: "15 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/abs.png"),
                        title: "Abs Workout",
                        subtitle: "16 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/torso.png"),
                        title: "Torso and Trap",
                        subtitle: "8 Exercise - 10 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/lowerback.png"),
                        title: "Lower Back Exercise",
                        subtitle: "14 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// note:
/// Progresscard → Menampilkan progress training dalam scroll horizontal.
/// Container Banner → Gradien dengan teks motivasi + tombol Start Exercise + gambar ilustrasi.
/// CategoriesPage → List kategori latihan (Full Body, Abs, Plank, dll).
