import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = "/splash_screen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   isLogin;
  // }
  // void isLogin() async {
  //   bool? isLogin = await PreferenceHandler.getLogin();
  //   Future.delayed(Duration(seconds: 3)).then((value) async {
  //     print(isLogin);
  //     if (isLogin == true) {
  //       context.pushReplacementNamed(newRouteName);
  //     } else {
  //       context.push(page);
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/workout.png",
            ),
          ),
        ),
      ),
    );
  }
}
