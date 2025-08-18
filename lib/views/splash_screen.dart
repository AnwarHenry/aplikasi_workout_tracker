import 'package:flutter/material.dart';
import 'package:workout_tracker/extension/navigation.dart';
import 'package:workout_tracker/preference/shared_preference.dart';
import 'package:workout_tracker/views/dashboard_page.dart';
import 'package:workout_tracker/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    bool? isLogin = await PreferenceHandler.getLogin();

    Future.delayed(const Duration(seconds: 3)).then((value) async {
      print(isLogin);
      if (isLogin == true) {
        context.pushReplacementNamed(DashboardPage.id);
      } else {
        context.push(const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/workout.png'),
            const SizedBox(height: 20),
            const Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
