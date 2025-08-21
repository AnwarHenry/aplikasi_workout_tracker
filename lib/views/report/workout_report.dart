import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout_user.dart';
import 'package:workout_tracker/sqflite/db_helper.dart';
import 'package:workout_tracker/views/report/workout_card.dart';

/// Halaman WorkoutReport
/// - Menampilkan daftar workout dari database
/// - Bisa Edit & Delete workout
/// - Delete akan menampilkan konfirmasi popup

class WorkoutReport extends StatefulWidget {
  const WorkoutReport({super.key});
  static const id = "/work_report"; // route id

  @override
  State<WorkoutReport> createState() => _DataWorkoutReport();
}

class _DataWorkoutReport extends State<WorkoutReport> {
  // List data workout dari SQLite
  List<WorkoutUser> workout = [];

  // Controller untuk input text saat Edit workout
  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController stageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getWorkout(); // ambil data workout saat halaman pertama kali dibuka
  }

  /// Fungsi untuk ambil semua data workout dari SQLite
  Future<void> getWorkout() async {
    final workoutreport = await DbHelper.getAllworkout();
    setState(() {
      workout = workoutreport;
    });
  }

  /// Fungsi untuk menampilkan dialog konfirmasi hapus
  Future<void> confirmDelete(BuildContext context, int workoutId) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Hapus"),
        content: const Text("Apakah Anda yakin ingin menghapus data ini?"),
        actions: [
          // Tombol batal
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          // Tombol hapus
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await DbHelper.deleteworkout(workoutId); // hapus data dari DB
              getWorkout(); // refresh list
              Navigator.pop(context); // tutup popup
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan logo workout
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 168, 240),
        title: Image.asset(
          "assets/images/workout.png",
          height: 75,
          width: 75,
          fit: BoxFit.cover,
        ),
      ),
      // Body: background putih + layer isi
      body: Stack(children: [buildBackground(), buildLayer()]),
    );
  }

  /// Layer utama berisi daftar workout
  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "List Program",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                height(20),

                // List Workout
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: workout.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dataworkout = workout[index];
                    return WorkoutCard(
                      data: dataworkout,

                      /// Aksi Edit workout
                      onEdit: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Edit Data"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: scheduleController
                                    ..text = dataworkout.schedule,
                                  decoration: const InputDecoration(
                                    hintText: "Schedule",
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: categoriesController
                                    ..text = dataworkout.categories,
                                  decoration: const InputDecoration(
                                    hintText: "Categories",
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  controller: stageController
                                    ..text = dataworkout.stage,
                                  decoration: const InputDecoration(
                                    hintText: "Stage",
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  final updateTrain = WorkoutUser(
                                    id: dataworkout.id!,
                                    schedule: scheduleController.text,
                                    categories: categoriesController.text,
                                    stage: stageController.text,
                                  );
                                  DbHelper.updateworkout(updateTrain);
                                  getWorkout();
                                  Navigator.pop(context);
                                },
                                child: const Text("Save"),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Back"),
                              ),
                            ],
                          ),
                        );
                      },

                      /// Aksi Delete workout → tampilkan konfirmasi popup
                      onDelete: () {
                        confirmDelete(context, dataworkout.id!);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Background putih
  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
    );
  }

  SizedBox height(double h) => SizedBox(height: h);
  SizedBox width(double w) => SizedBox(width: w);
}
