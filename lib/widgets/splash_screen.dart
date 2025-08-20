import 'package:flutter/material.dart';
import 'package:workout_tracker/extension/navigation.dart';
import 'package:workout_tracker/preference/shared_preference.dart';
import 'package:workout_tracker/views/Beranda/bottom_navbar.dart';
import 'package:workout_tracker/widgets/screen_before_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = "/splash";

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
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      print(isLogin);
      if (isLogin == true) {
        context.pushReplacementNamed(BottomNavbar.id);
      } else {
        context.push(const Screen1());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // fit: BoxFit.cover,
            image: AssetImage("assets/images/workout.png"),
          ),
        ),
      ),
    );
  }
}
