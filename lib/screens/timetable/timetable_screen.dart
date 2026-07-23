import 'package:flutter/material.dart';

import '../../data/timetable_data.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Class Timetable"), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: timetableList.length,
        itemBuilder: (context, index) {
          final lecture = timetableList[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(child: Text(lecture.day.substring(0, 1))),
              title: Text(
                lecture.subject,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("📅 ${lecture.day}"),
                    const SizedBox(height: 4),
                    Text("🕒 ${lecture.time}"),
                    const SizedBox(height: 4),
                    Text("🏫 ${lecture.room}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
