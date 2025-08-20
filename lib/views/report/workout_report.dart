import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout_user.dart';
import 'package:workout_tracker/sqflite/db_helper.dart';
import 'package:workout_tracker/views/report/workout_card.dart';

class WorkoutReport extends StatefulWidget {
  const WorkoutReport({super.key});
  static const id = "/dataWorkout";

  @override
  State<WorkoutReport> createState() => _DataWorkoutReport();
}

class _DataWorkoutReport extends State<WorkoutReport> {
  List<WorkoutUser> workout = [];
  @override
  void initState() {
    super.initState();
    getWorkout();
  }

  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController stageController = TextEditingController();

  Future<void> getWorkout() async {
    final dataWorkout = await DbHelper.getAllworkout();
    print(dataWorkout);
    setState(() {
      workout = dataWorkout;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 168, 240),
        title: Image.asset(
          "assets/images/workout.png",
          height: 75,
          width: 75,
          fit: BoxFit.cover,
        ),
      ),
      body: Stack(children: [buildBackground(), buildLayer()]),
    );
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Program",
                  style: TextStyle(
                    // fontFamily: "Poppins",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                height(20),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: workout.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dataworkout = workout[index];
                    return WorkoutCard(
                      data: dataworkout,
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
                      onDelete: () {
                        DbHelper.deleteworkout(dataworkout.id!);
                        getWorkout();
                      },
                    );
                    // Card(
                    //   elevation: 4,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadiusGeometry.circular(20),
                    //   ),
                    //   margin: EdgeInsets.only(bottom: 20),
                    //   child: Container(
                    //     height: 120,
                    //     width: double.infinity,
                    //     // margin: EdgeInsets.only(bottom: 12),
                    //     padding: EdgeInsets.all(16),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       gradient: LinearGradient(
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight,
                    //         colors: [AppColor.primary, AppColor.secondary],
                    //       ),
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           dataworkout.schedule,
                    //           style: TextStyle(
                    //             fontFamily: "Montserrat",
                    //             fontSize: 16,
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         height(8),
                    //         Text(
                    //           dataworkout.categories,
                    //           style: TextStyle(
                    //             fontFamily: "Montserrat",
                    //             fontSize: 14,
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         height(8),
                    //         Text(
                    //           dataworkout.stage,
                    //           style: TextStyle(
                    //             fontFamily: "Montserrat",
                    //             fontSize: 14,
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Container buildContainer() {
  //   return Container(
  //     height: 120,
  //     width: double.infinity,
  //     margin: EdgeInsets.only(bottom: 12),
  //     padding: EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [AppColor.primary, AppColor.secondary],
  //       ),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [Text(data)],
  //     ),
  //   );
  // }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);
}
