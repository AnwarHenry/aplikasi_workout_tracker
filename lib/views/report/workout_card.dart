import 'package:flutter/material.dart';
import 'package:workout_tracker/models/workout_user.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutUser data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const WorkoutCard({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 160,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.schedule,
                  style: const TextStyle(
                    // fontFamily: "Montserrat",
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              data.categories,
              style: const TextStyle(
                // fontFamily: "Montserrat",
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data.stage,
              style: const TextStyle(
                // fontFamily: "Montserrat",
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
