// import 'package:flutter/material.dart';
// import 'package:workout_tracker/models/workout_user.dart';
// import 'package:workout_tracker/sqflite/db_helper.dart';
// import 'package:workout_tracker/views/workou_form_page.dart';

// class WorkoutListPage extends StatefulWidget {
//   const WorkoutListPage({super.key});

//   @override
//   State<WorkoutListPage> createState() => _WorkoutListPageState();
// }

// class _WorkoutListPageState extends State<WorkoutListPage> {
//   late Future<List<Workout>> _workoutsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _refreshWorkouts();
//   }

//   void _refreshWorkouts() {
//     setState(() {
//       _workoutsFuture = DbHelper.instance.getAllWorkouts();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Workouts'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () async {
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const WorkoutFormPage()),
//               );
//               _refreshWorkouts();
//             },
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<Workout>>(
//         future: _workoutsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No workouts yet'));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final workout = snapshot.data![index];
//               return Dismissible(
//                 key: Key(workout.id.toString()),
//                 background: Container(color: Colors.red),
//                 confirmDismiss: (direction) async {
//                   return await showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text('Confirm'),
//                       content: const Text('Delete this workout?'),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context, false),
//                           child: const Text('Cancel'),
//                         ),
//                         TextButton(
//                           onPressed: () => Navigator.pop(context, true),
//                           child: const Text('Delete'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 onDismissed: (direction) async {
//                   await DbHelper.instance.deleteWorkout(workout.id!);
//                   _refreshWorkouts();
//                 },
//                 child: Card(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: ListTile(
//                     leading: _getWorkoutIcon(workout.type),
//                     title: Text(workout.name),
//                     subtitle: Text(
//                       '${workout.duration} min • ${workout.calories} cal',
//                     ),
//                     trailing: Switch(
//                       value: workout.isCompleted,
//                       onChanged: (value) async {
//                         workout.isCompleted = value;
//                         await DbHelper.instance.updateWorkout(workout);
//                         _refreshWorkouts();
//                       },
//                     ),
//                     onTap: () async {
//                       await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               WorkoutFormPage(workout: workout),
//                         ),
//                       );
//                       _refreshWorkouts();
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   Icon _getWorkoutIcon(String type) {
//     switch (type.toLowerCase()) {
//       case 'cardio':
//         return const Icon(Icons.directions_run, color: Colors.blue);
//       case 'strength':
//         return const Icon(Icons.fitness_center, color: Colors.red);
//       case 'yoga':
//         return const Icon(Icons.self_improvement, color: Colors.green);
//       default:
//         return const Icon(Icons.sports);
//     }
//   }
// }
