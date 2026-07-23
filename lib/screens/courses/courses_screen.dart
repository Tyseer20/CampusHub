import 'package:flutter/material.dart';

import '../../data/course_data.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Courses"), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          final course = courseList[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text("👨‍🏫 Instructor: ${course.instructor}"),
                  const SizedBox(height: 6),

                  Text("🎓 Credits: ${course.credits}"),
                  const SizedBox(height: 6),

                  Text(
                    "📊 Attendance: ${course.attendance.toStringAsFixed(0)}%",
                  ),

                  const SizedBox(height: 10),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: course.attendance / 100,
                      minHeight: 8,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(label: Text("${course.assignments} Assignments")),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Details"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
