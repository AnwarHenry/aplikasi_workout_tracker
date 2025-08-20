import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout_user.dart';
import 'package:workout_tracker/sqflite/db_helper.dart';

class WorkoutForm extends StatefulWidget {
  const WorkoutForm({super.key});

  @override
  State<WorkoutForm> createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController stageController = TextEditingController();
  bool isLoading = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 168, 240),
        title: Image.asset(
          "assets/images/workout.png",
          fit: BoxFit.cover,
          height: 75,
          width: 75,
        ),
      ),
      body: Stack(children: [buildBackground(), buildLayer()]),
    );
  }

  void registerworkout() async {
    isLoading = true;
    setState(() {});
    final schedule = scheduleController.text;
    final categories = categoriesController.text;
    final stage = stageController.text;
    if (schedule.isEmpty || categories.isEmpty || stage.isEmpty || !isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "All field must be filled and checkbox must be checked",
          ),
        ),
      );
      isLoading = false;

      return;
    }
    final train = WorkoutUser(
      schedule: schedule,
      categories: categories,
      stage: stage,
    );
    await DbHelper.registerworkout(train);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      isLoading = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Never Give Up")));
    });
    setState(() {});
    isLoading = false;
  }

  TextField buildTextField({
    String? hintText,
    String? labelText,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
    );
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  "Set Your Training Program",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                height(30),
                buildTextField(
                  controller: scheduleController,
                  labelText: "Schedule",
                  hintText: "Please set your schedule",
                ),
                height(10),
                buildTextField(
                  controller: categoriesController,
                  labelText: "Categories",
                  hintText: "Select the category you want",
                ),
                height(10),
                buildTextField(
                  controller: stageController,
                  labelText: "Stage",
                  hintText: "Select the stage you want",
                ),
                height(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    const SizedBox(width: 15),
                    Text(
                      isChecked ? "Keep Your Spirit" : "Are You Sure?",
                      style: const TextStyle(
                        // fontFamily: "Montserrat",
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                height(15),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        isLoading ? null : registerworkout();
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Save Data",
                              style: TextStyle(
                                // fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
