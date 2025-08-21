import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout_user.dart';
import 'package:workout_tracker/sqflite/db_helper.dart';

class WorkoutForm extends StatefulWidget {
  const WorkoutForm({super.key});

  @override
  State<WorkoutForm> createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  // Controller untuk schedule
  final TextEditingController scheduleController = TextEditingController();

  // State untuk categories dan stage
  String? selectedCategory;
  String? selectedStage;

  // List pilihan Categories
  final List<String> categoriesList = [
    "Cardio",
    "Strength Training",
    "Yoga",
    "HIIT",
    "Pilates",
    "CrossFit",
    "Cycling",
    "Running",
  ];

  // List pilihan Stage
  final List<String> stageList = [
    "Beginner",
    "Intermediate",
    "Professional",
  ];

  // Checkbox
  bool isChecked = false;
  bool isLoading = false;

  /// Fungsi pilih tanggal untuk schedule
  Future<void> pickScheduleDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        scheduleController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  /// Fungsi simpan data
  void registerworkout() async {
    setState(() => isLoading = true);

    final schedule = scheduleController.text;
    final categories = selectedCategory ?? "";
    final stage = selectedStage ?? "";

    if (schedule.isEmpty || categories.isEmpty || stage.isEmpty || !isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields must be filled")),
      );
      setState(() => isLoading = false);
      return;
    }

    final train = WorkoutUser(
      schedule: schedule,
      categories: categories,
      stage: stage,
    );

    await DbHelper.registerworkout(train);

    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Your Data is Saved!")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 168, 240),
        title: Image.asset("assets/images/workout.png",
            fit: BoxFit.cover, height: 75, width: 75),
      ),
      body: Stack(children: [buildBackground(), buildLayer()]),
    );
  }

  Container buildBackground() {
    return Container(color: Colors.white);
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              "Set Your Training",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Schedule dengan datepicker
            TextField(
              controller: scheduleController,
              readOnly: true,
              onTap: pickScheduleDate,
              decoration: InputDecoration(
                labelText: "Schedule",
                hintText: "Pick a date",
                suffixIcon: const Icon(Icons.calendar_today),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),

            // Dropdown untuk Categories
            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              items: categoriesList
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Categories",
                hintText: "Select workout category",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),

            // Dropdown untuk Stage
            DropdownButtonFormField<String>(
              initialValue: selectedStage,
              items: stageList
                  .map((st) => DropdownMenuItem(value: st, child: Text(st)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedStage = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Stage",
                hintText: "Select your stage",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (v) => setState(() => isChecked = v ?? false),
                ),
                Text(
                  isChecked ? "Keep Your Spirit" : "Are You Sure?",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Save
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading ? null : registerworkout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 3, 75, 134),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Save Data",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
