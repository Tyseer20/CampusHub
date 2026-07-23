import 'package:flutter/material.dart';

import '../core/constants/app_text_styles.dart';
import '../models/student.dart';

class DashboardHeader extends StatelessWidget {
  final Student student;

  const DashboardHeader({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("👋 Welcome Back", style: AppTextStyles.body),
        const SizedBox(height: 8),
        Text(student.name, style: AppTextStyles.heading),
        const SizedBox(height: 8),
        Text(student.department, style: AppTextStyles.body),
        Text("Semester ${student.semester}", style: AppTextStyles.body),
      ],
    );
  }
}
