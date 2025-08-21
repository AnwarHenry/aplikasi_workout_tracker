import 'package:flutter/material.dart';
import 'package:workout_tracker/extension/navigation.dart';
import 'package:workout_tracker/widgets/login_page.dart';
import 'package:workout_tracker/widgets/register_page.dart';

/// note :
/// Di sini user bisa:
/// - Melihat tagline aplikasi
/// - Membuat akun baru (Create Account)
/// - Login ke akun yang sudah ada (Sign In)
/// - Atau sign-in menggunakan Google / Facebook.
/// File ini adalah welcome screen utama.

// Navigasi pakai context.push() (dari extension/navigation.dart).
// Tombol Google & Facebook masih dummy, bisa dikaitkan ke Firebase Auth kalau mau beneran.
// Background memakai gambar assets/images/background3.png.

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan Stack agar bisa taruh background + layer konten
      body: Stack(
        children: [
          buildBackground(), // Lapis bawah: background image
          buildLayer(), // Lapis atas: konten UI
        ],
      ),
    );
  }

  /// Membuat background berupa gambar full screen
  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background4.png"),
          fit: BoxFit.cover, // Agar menutupi seluruh layar
        ),
      ),
    );
  }

  // Shortcut widget untuk ukuran dinamis
  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  /// Membuat lapisan konten utama (logo, teks, tombol)
  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo / ilustrasi aplikasi
                SizedBox(height: 50),
                Image.asset(
                  'assets/images/workout.png',
                  height: 225,
                  width: 225,
                ),

                // Judul utama,
                const Text(
                  "Make Your Health",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "Better",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 3, 75, 134),
                  ),
                ),

                const SizedBox(height: 5),

                // Tombol Create Account
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 245, 102, 7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Navigasi ke halaman Register
                      context.push(const Register1());
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Tombol Sign In
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 245, 102, 7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Navigasi ke halaman Login
                      context.push(const LoginPage());
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Divider dengan tulisan "Or Sign In With"
                const Row(
                  children: <Widget>[
                    Expanded(child: Divider(color: Colors.white, thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or Sign In With',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white, thickness: 1)),
                  ],
                ),

                const SizedBox(height: 15),

                // Tombol login via Google
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Integrasi Google Sign-In
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Icon_Google.png',
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // Tombol login via Facebook
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 112, 228),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Integrasi Facebook Login
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Icon_Facebook.png',
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Facebook",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
