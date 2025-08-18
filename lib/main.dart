import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:workout_tracker/views/dashboard_page.dart';
import 'package:workout_tracker/views/login_screen.dart';
import 'package:workout_tracker/views/splash_screen.dart';

void main() {
  initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Tracker App',
      theme: ThemeData(
        datePickerTheme: DatePickerThemeData(
          backgroundColor: Colors.blue.shade100,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        "/login": (context) => const LoginScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        // DashboardPage.id: (context) => const DashboardPage(),
      },
      // home: const SplashScreen(),
    );
  }
}
