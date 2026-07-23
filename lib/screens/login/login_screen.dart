import 'package:flutter/material.dart';

import '../../core/constants/app_text_styles.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  48,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  const AppLogo(size: 90),

                  const SizedBox(height: 25),

                  Text("CampusHub", style: AppTextStyles.heading),

                  const SizedBox(height: 8),

                  Text(
                    "University Management System",
                    style: AppTextStyles.body,
                  ),

                  const SizedBox(height: 40),

                  CustomTextField(
                    hint: "University Email",
                    icon: Icons.email_outlined,
                    controller: emailController,
                  ),

                  const SizedBox(height: 20),

                  CustomTextField(
                    hint: "Password",
                    icon: Icons.lock_outline,
                    controller: passwordController,
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  PrimaryButton(
                    text: "Login",
                    icon: Icons.login,
                    onPressed: login,
                  ),

                  const Spacer(),

                  Text("Version 1.0", style: AppTextStyles.body),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
