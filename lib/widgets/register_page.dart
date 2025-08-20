// import 'package:flutter/material.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});
//   static const id = "/register";

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isVisibility = false;
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
//   }

//   void registerUser() async {
//     isLoading = true;
//     setState(() {});
//     final email = emailController.text.trim();
//     final password = passwordController.text.trim();
//     final name = nameController.text.trim();
//     if (email.isEmpty || password.isEmpty || name.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Email, Password, dan Nama tidak boleh kosong"),
//         ),
//       );
//       isLoading = false;
//       return;
//     }
//     // final user = User(email: email, password: password, name: name);
//     // await DbHelper.registerUser(user);
//     Future.delayed(const Duration(seconds: 1)).then((value) {
//       isLoading = false;
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("Registration Success")));
//     });
//     setState(() {});
//     isLoading = false;
//   }

//   SafeArea buildLayer() {
//     return SafeArea(
//         child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//                 child: Padding(
//                     padding: const EdgeInsetsGeometry.symmetric(
//                         horizontal: 16, vertical: 8),
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset('assets/images/workout.png',
//                               height: 225, width: 225),
//                           const Text(
//                             "Make Your Future Health",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               // fontFamily: " ",
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               // color: AppColor.oranye,
//                             ),
//                           ),
//                           const Text(
//                             "Better",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               // fontFamily: "Poppins",
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               // color: AppColor.birutua,
//                             ),
//                           ),
//                           Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               // crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 // const Text(
//                                 //   "Register",
//                                 //   style: TextStyle(
//                                 //       fontSize: 20,
//                                 //       fontWeight: FontWeight.bold),
//                                 // ),
//                                 height(24),
//                                 buildTitle("Email Address"),
//                                 height(12),
//                                 buildTextField(
//                                   hintText: "Enter your email",
//                                   controller: emailController,
//                                 ),
//                                 height(16),
//                                 buildTitle("Name"),
//                                 height(12),
//                                 buildTextField(
//                                   hintText: "Enter your name",
//                                   controller: nameController,
//                                 ),
//                                 height(16),
//                                 buildTitle("Password"),
//                                 height(12),
//                                 buildTextField(
//                                   hintText: "Enter your password",
//                                   isPassword: true,
//                                   controller: passwordController,
//                                 ),
//                                 // height(12),
//                                 // Align(
//                                 //   alignment: Alignment.centerRight,
//                                 //   child: TextButton(
//                                 //     onPressed: () {
//                                 //       // Navigator.push(
//                                 //       //   context,
//                                 //       //   MaterialPageRoute(builder: (context) => MeetSebelas()),
//                                 //       // );
//                                 //     },
//                                 //     child: const Text(
//                                 //       "Forgot Password?",
//                                 //       style: TextStyle(
//                                 //         fontSize: 12,
//                                 //         // color: AppColor.orange,
//                                 //         fontWeight: FontWeight.w500,
//                                 //       ),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 height(24),
//                                 SizedBox(
//                                   width: double.infinity,
//                                   height: 56,
//                                   child: ElevatedButton(
//                                     onPressed: () {
//                                       registerUser();
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: const Color.fromARGB(
//                                           255, 114, 7, 255),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(6),
//                                       ),
//                                     ),
//                                     child: isLoading
//                                         ? const CircularProgressIndicator()
//                                         : const Text(
//                                             "Register",
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                   ),
//                                 ),
//                                 // height(16),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.center,
//                                 //   children: [
//                                 //     Expanded(
//                                 //       child: Container(
//                                 //         margin: const EdgeInsets.only(right: 8),
//                                 //         height: 1,
//                                 //         color: Colors.white,
//                                 //       ),
//                                 //     ),
//                                 //     const Text(
//                                 //       "Or Sign In With",
//                                 //       // style: TextStyle(fontSize: 12, color: AppColor.gray88),
//                                 //     ),
//                                 //     Expanded(
//                                 //       child: Container(
//                                 //         margin: const EdgeInsets.only(left: 8),
//                                 //         height: 1,
//                                 //         color: Colors.white,
//                                 //       ),
//                                 //     ),
//                                 //   ],
//                                 // ),
//                                 // height(16),
//                                 // SizedBox(
//                                 //   height: 48,
//                                 //   child: ElevatedButton(
//                                 //     style: ElevatedButton.styleFrom(
//                                 //       backgroundColor: Colors.white,
//                                 //     ),
//                                 //     onPressed: () {
//                                 //       // Navigate to MeetLima screen menggunakan pushnamed
//                                 //       Navigator.pushNamed(context, "/meet_2");
//                                 //     },
//                                 //     child: Row(
//                                 //       mainAxisAlignment: MainAxisAlignment.center,
//                                 //       children: [
//                                 //         Image.asset(
//                                 //           "assets/images/icon_google.png",
//                                 //           height: 16,
//                                 //           width: 16,
//                                 //         ),
//                                 //         width(4),
//                                 //         const Text("Google"),
//                                 //       ],
//                                 //     ),
//                                 //   ),
//                                 // ),
//                                 height(16),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Text(
//                                       "Don't have an account?",
//                                       // style: TextStyle(fontSize: 12, color: AppColor.gray88),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         // Navigator.pushReplacement(
//                                         //   context,
//                                         //   MaterialPageRoute(builder: (context) => MeetEmpatA()),
//                                         // );
//                                       },
//                                       child: const Text(
//                                         "Sign Up",
//                                         style: TextStyle(
//                                           // color: AppColor.blueButton,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     )))));
//   }

//   Container buildBackground() {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       color: Colors.cyan,
//     );
//   }

//   TextField buildTextField({
//     String? hintText,
//     bool isPassword = false,
//     TextEditingController? controller,
//   }) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword ? isVisibility : false,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         hintText: hintText,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(32),
//           borderSide: BorderSide(
//             color: Colors.black.withOpacity(0.2),
//             width: 1.0,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(32),
//           borderSide: const BorderSide(color: Colors.black, width: 1.0),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(32),
//           borderSide: BorderSide(
//             color: Colors.black.withOpacity(0.2),
//             width: 1.0,
//           ),
//         ),
//         suffixIcon: isPassword
//             ? IconButton(
//                 onPressed: () {
//                   setState(() {
//                     isVisibility = !isVisibility;
//                   });
//                 },
//                 icon: Icon(
//                   isVisibility ? Icons.visibility_off : Icons.visibility,
//                   // color: AppColor.gray88,
//                 ),
//               )
//             : null,
//       ),
//     );
//   }

//   SizedBox height(double height) => SizedBox(height: height);
//   SizedBox width(double width) => SizedBox(width: width);

//   Widget buildTitle(String text) {
//     return const Row(
//       children: [
//         // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:workout_tracker/models/user.dart';
import 'package:workout_tracker/sqflite/db_helper.dart';
// import 'package:workout_tracker/utils/app_image.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});
  static const id = "/register";

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  void registerUser() async {
    isLoading = true;
    setState(() {});
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username, Email, and Password cannot be empty"),
        ),
      );
      isLoading = false;
      return;
    }
    final user = User(username: username, email: email, password: password);
    await DbHelper.registerUser(user);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      isLoading = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Successful")));
    });
    setState(() {});
    isLoading = false;
  }

  TextField buildTextField({
    String? labelText,
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? !isVisibility : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.cyan,
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/workout.png",
                    height: 220, width: 220),
                const Text(
                  "Make Your Future Health",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Better",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                height(20),
                buildTextField(
                  controller: usernameController,
                  labelText: "Username",
                  hintText: "Please input your username",
                ),
                height(10),
                buildTextField(
                  controller: emailController,
                  labelText: "Email Address",
                  hintText: "Please input your email",
                ),
                height(10),
                buildTextField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Please input your password",
                  isPassword: true,
                ),
                height(10),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      isLoading ? null : registerUser();
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Register",
                            style: TextStyle(
                              // fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          // fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
