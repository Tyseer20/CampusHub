import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';

import '../../widgets/dashboard_header.dart';
import '../../widgets/dashboard_tile.dart';
import '../../widgets/stat_card.dart';

import '../attendance/attendance_screen.dart';
import '../courses/courses_screen.dart';
import '../marks/marks_screen.dart';
import '../timetable/timetable_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';
import '../student/student_registration_screen.dart';
import '../student/student_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "🌞 Good Morning";
    } else if (hour < 17) {
      return "☀️ Good Afternoon";
    } else {
      return "🌙 Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CampusHub"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getGreeting(),
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),

              const SizedBox(height: 8),

              DashboardHeader(student: currentStudent),

              const SizedBox(height: 25),

              const Row(
                children: [
                  StatCard(
                    title: "Attendance",
                    value: "95%",
                    icon: Icons.bar_chart,
                  ),
                  SizedBox(width: 15),
                  StatCard(title: "CGPA", value: "6.40", icon: Icons.school),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Quick Access",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.15,
                children: [
                  DashboardTile(
                    title: "Attendance",
                    icon: Icons.bar_chart,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AttendanceScreen(),
                        ),
                      );
                    },
                  ),

                  DashboardTile(
                    title: "Courses",
                    icon: Icons.menu_book,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CoursesScreen(),
                        ),
                      );
                    },
                  ),

                  DashboardTile(
                    title: "Marks",
                    icon: Icons.grade,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MarksScreen()),
                      );
                    },
                  ),

                  DashboardTile(
                    title: "Timetable",
                    icon: Icons.calendar_month,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TimetableScreen(),
                        ),
                      );
                    },
                  ),

                  DashboardTile(
                    title: "Profile",
                    icon: Icons.person,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),

                  DashboardTile(
                    title: "Settings",
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),

                  DashboardTile(
                    title: "Register",
                    icon: Icons.app_registration,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StudentRegistrationScreen(),
                        ),
                      );
                    },
                  ),

                  DashboardTile(
                    title: "Students",
                    icon: Icons.groups,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StudentListScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const ListTile(
                  leading: CircleAvatar(child: Icon(Icons.event)),
                  title: Text("Today's Classes"),
                  subtitle: Text(
                    "Database Systems • 10:00 AM\nFlutter Development • 2:00 PM",
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const ListTile(
                  leading: CircleAvatar(child: Icon(Icons.campaign)),
                  title: Text("Latest Notice"),
                  subtitle: Text("Mid-term examination starts next Monday."),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
