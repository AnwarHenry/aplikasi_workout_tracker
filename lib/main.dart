import 'package:flutter/material.dart';
import 'package:workout_tracker/views/bottom_navbar.dart';

void main() {
  // initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Tracker App',
      color: Colors.black,
      theme: ThemeData(
        datePickerTheme: DatePickerThemeData(
          backgroundColor: Colors.blue.shade100,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),

      debugShowCheckedModeBanner: false,
      // initialRoute: SplashScreen.id,
      // routes: {
      //   "/login": (context) => const Screen1(),
      //   SplashScreen.id: (context) => const SplashScreen(),
      //   BottomNavbar.id: (context) => const BottomNavbar(),
      // },
      home: const BottomNavbar(),
    );
  }
}
