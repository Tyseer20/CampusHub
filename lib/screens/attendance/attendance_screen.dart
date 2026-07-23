import 'package:flutter/material.dart';

import '../../data/attendance_data.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final totalClasses = attendanceList.fold(
      0,
      (sum, item) => sum + item.total,
    );

    final attendedClasses = attendanceList.fold(
      0,
      (sum, item) => sum + item.attended,
    );

    final percentage = ((attendedClasses / totalClasses) * 100).toStringAsFixed(
      1,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Attendance")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const Icon(Icons.bar_chart, size: 55),

                  const SizedBox(height: 15),

                  Text(
                    "$percentage%",
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    "Overall Attendance",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Subjects",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          ...attendanceList.map((subject) {
            return Card(
              margin: const EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          subject.subject,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        Text("${subject.percentage.toStringAsFixed(0)}%"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    LinearProgressIndicator(
                      value: subject.percentage / 100,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    const SizedBox(height: 8),

                    Text("${subject.attended}/${subject.total} Classes"),
                  ],
                ),
              ),
            );
          }),

          const SizedBox(height: 20),

          Card(
            child: ListTile(
              leading: const Icon(Icons.check_circle),
              title: const Text("Attended"),
              trailing: Text("$attendedClasses"),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text("Missed"),
              trailing: Text("${totalClasses - attendedClasses}"),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.school),
              title: const Text("Total Classes"),
              trailing: Text("$totalClasses"),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
