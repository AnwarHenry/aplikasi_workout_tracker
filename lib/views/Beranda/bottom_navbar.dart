import 'package:flutter/material.dart';
import 'package:workout_tracker/views/Beranda/dashboard_page.dart';
import 'package:workout_tracker/views/report/workout_form.dart';
import 'package:workout_tracker/views/report/workout_report.dart';
import 'package:workout_tracker/views/settings.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});
  static const id = "/BottomNavbar";

  @override
  State<BottomNavbar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    WorkoutForm(),
    WorkoutReport(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_currentIndex], // Menghapus Center yang tidak perlu
      bottomNavigationBar: _buildCircleNavBar(),
    );
  }

  Widget _buildCircleNavBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 44, 168, 240),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Diubah dari spaceAround
        children: [
          _buildNavItem(Icons.explore, "Dashboard", 0),
          _buildNavItem(
            Icons.explore,
            "Workout",
            1,
            image: 'assets/images/form-barble.png',
            assetimage: true,
          ),
          _buildNavItem(Icons.bar_chart_rounded, "Report", 2),
          // Index disesuaikan
          _buildNavItem(
              Icons.person_rounded, "Profile", 3), // Index disesuaikan
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index,
      {bool assetimage = false, String? image}) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? const Color.fromARGB(255, 148, 34, 255)
                  : Colors.transparent,
            ),
            child: assetimage
                ? Image.asset(image!)
                : Icon(
                    icon,
                    color: isSelected ? Colors.white : Colors.grey[300],
                    size: 24,
                  ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[300],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
