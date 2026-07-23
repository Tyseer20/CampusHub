import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/student.dart';

class StudentInfoCard extends StatelessWidget {
  final Student student;

  const StudentInfoCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: Icon(Icons.person, size: 40, color: AppColors.primary),
            ),

            const SizedBox(height: 15),

            Text(
              student.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text(student.department),

            const Divider(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("University"), Text(student.university)],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Semester"), Text(student.semester)],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Roll No"), Text(student.rollNumber)],
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("CGPA"), Text(student.cgpa.toString())],
            ),
          ],
        ),
      ),
    );
  }
}
