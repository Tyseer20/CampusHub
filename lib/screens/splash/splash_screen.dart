import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_text_styles.dart';
import '../../widgets/app_logo.dart';
import '../../core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const AppLogo(),

              const SizedBox(height: 30),

              Text("CampusHub", style: AppTextStyles.heading),

              const SizedBox(height: 10),

              Text("University Management System", style: AppTextStyles.body),

              const SizedBox(height: 40),

              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
