import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(radius: 55, child: Icon(Icons.person, size: 60)),

            const SizedBox(height: 15),

            Text(
              currentStudent.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            Text(
              currentStudent.department,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.badge),
                    title: const Text("Student ID"),
                    subtitle: Text(currentStudent.rollNumber),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.school),
                    title: const Text("University"),
                    subtitle: Text(currentStudent.university),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text("Semester"),
                    subtitle: Text(currentStudent.semester),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text("CGPA"),
                    subtitle: Text(currentStudent.cgpa.toString()),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
