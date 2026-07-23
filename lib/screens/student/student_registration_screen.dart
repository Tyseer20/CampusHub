import 'package:flutter/material.dart';

import '../../database/database_helper.dart';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final studentIdController = TextEditingController();
  final departmentController = TextEditingController();
  final semesterController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    studentIdController.dispose();
    departmentController.dispose();
    semesterController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> saveStudent() async {
    if (!_formKey.currentState!.validate()) return;

    await DatabaseHelper.instance.insertStudent({
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "studentId": studentIdController.text.trim(),
      "department": departmentController.text.trim(),
      "semester": semesterController.text.trim(),
      "phone": phoneController.text.trim(),
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Student saved successfully!"),
        backgroundColor: Colors.green,
      ),
    );

    nameController.clear();
    emailController.clear();
    studentIdController.clear();
    departmentController.clear();
    semesterController.clear();
    phoneController.clear();
  }

  Widget buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Registration"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildField(
                controller: nameController,
                label: "Full Name",
                icon: Icons.person,
              ),
              buildField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
                type: TextInputType.emailAddress,
              ),
              buildField(
                controller: studentIdController,
                label: "Student ID",
                icon: Icons.badge,
              ),
              buildField(
                controller: departmentController,
                label: "Department",
                icon: Icons.school,
              ),
              buildField(
                controller: semesterController,
                label: "Semester",
                icon: Icons.calendar_month,
              ),
              buildField(
                controller: phoneController,
                label: "Phone Number",
                icon: Icons.phone,
                type: TextInputType.phone,
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: saveStudent,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    "Save Student",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
