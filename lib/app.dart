import 'package:flutter/material.dart';
import 'screens/login/login_screen.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';
import 'core/routes/app_routes.dart';
import 'screens/dashboard/dashboard_screen.dart';

class CampusHubApp extends StatelessWidget {
  const CampusHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusHub',
      theme: AppTheme.lightTheme,

      initialRoute: AppRoutes.splash,

      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.dashboard: (_) => const DashboardScreen(),
      },
    );
  }
}
