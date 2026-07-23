import 'package:flutter/material.dart';

import '../../data/marks_data.dart';

class MarksScreen extends StatelessWidget {
  const MarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Academic Results"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Current CGPA", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Text(
                    "8.72",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          ...marksList.map((mark) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mark.subject,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Midterm"),
                        Text("${mark.midterm}/30"),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Final"),
                        Text("${mark.finalExam}/70"),
                      ],
                    ),

                    const Divider(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${mark.total}/100",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Chip(label: Text("Grade: ${mark.grade}")),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
