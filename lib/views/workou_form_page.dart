// import 'package:flutter/material.dart';
// import 'package:workout_tracker/models/workout_user.dart';
// import 'package:workout_tracker/sqflite/db_helper.dart';

// class WorkoutFormPage extends StatefulWidget {
//   final Workout? workout;
//   const WorkoutFormPage({super.key, this.workout});

//   @override
//   State<WorkoutFormPage> createState() => _WorkoutFormPageState();
// }

// class _WorkoutFormPageState extends State<WorkoutFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _durationController = TextEditingController();
//   final _caloriesController = TextEditingController();
//   String _selectedType = 'Cardio';
//   DateTime _selectedDate = DateTime.now();

//   final List<String> _workoutTypes = [
//     'Cardio',
//     'Strength',
//     'Yoga',
//     'HIIT',
//     'Swimming'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     if (widget.workout != null) {
//       _nameController.text = widget.workout!.name;
//       _durationController.text = widget.workout!.duration.toString();
//       _caloriesController.text = widget.workout!.calories.toString();
//       _selectedType = widget.workout!.type;
//       _selectedDate = widget.workout!.date;
//     } else {
//       _caloriesController.text = '0';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.workout == null ? 'Add Workout' : 'Edit Workout'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Workout Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please enter a name' : null,
//               ),
//               const SizedBox(height: 16),
//               DropdownButtonFormField(
//                 value: _selectedType,
//                 decoration: const InputDecoration(
//                   labelText: 'Type',
//                   border: OutlineInputBorder(),
//                 ),
//                 items: _workoutTypes
//                     .map((type) => DropdownMenuItem(
//                           value: type,
//                           child: Text(type),
//                         ))
//                     .toList(),
//                 onChanged: (value) =>
//                     setState(() => _selectedType = value as String),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: _durationController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                         labelText: 'Duration (min)',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) => value!.isEmpty ? 'Required' : null,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: TextFormField(
//                       controller: _caloriesController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                         labelText: 'Calories',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               ListTile(
//                 title: const Text('Date'),
//                 subtitle: Text(
//                     '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
//                 trailing: const Icon(Icons.calendar_today),
//                 onTap: () => _selectDate(context),
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: _saveWorkout,
//                 child: const Text('Save Workout'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() => _selectedDate = picked);
//     }
//   }

//   Future<void> _saveWorkout() async {
//     if (_formKey.currentState!.validate()) {
//       final workout = Workout(
//         id: widget.workout?.id,
//         name: _nameController.text,
//         type: _selectedType,
//         duration: int.parse(_durationController.text),
//         date: _selectedDate,
//         calories: int.tryParse(_caloriesController.text) ?? 0,
//       );

//       if (workout.id == null) {
//         await DbHelper.instance.createWorkout(workout);
//       } else {
//         await DbHelper.instance.updateWorkout(workout);
//       }

//       if (!mounted) return;
//       Navigator.pop(context);
//     }
//   }
// }
