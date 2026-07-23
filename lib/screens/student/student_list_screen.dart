import 'package:flutter/material.dart';

import '../../database/database_helper.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    final data = await DatabaseHelper.instance.getStudents();

    setState(() {
      students = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registered Students"),
        centerTitle: true,
      ),
      body: students.isEmpty
          ? const Center(
              child: Text(
                "No Students Registered",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(student["name"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(student["email"]),
                        Text("ID: ${student["studentId"]}"),
                        Text(student["department"]),
                        Text("Semester: ${student["semester"]}"),
                        Text(student["phone"]),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
