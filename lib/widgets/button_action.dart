import 'package:flutter/material.dart';

// Widget untuk membuat tombol action
Widget buildActionButton({
  required IconData icon,
  required String label,
  required Color color,
}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(12),
        child: Icon(icon, color: color, size: 28),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
      ),
    ],
  );
}
