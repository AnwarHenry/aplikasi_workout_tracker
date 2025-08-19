import 'package:flutter/material.dart';
import 'package:workout_tracker/views/dashboard_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    Center(
        child: Text(
            "Report Page")), // Diubah dari "Halaman 2" menjadi lebih deskriptif
    Center(
        child: Text(
            "Profile Page")), // Diubah dari "Halaman 2" menjadi lebih deskriptif
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
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Diubah dari spaceAround
        children: [
          _buildNavItem(Icons.explore, "Dashboard", 0),
          _buildNavItem(
              Icons.bar_chart_rounded, "Report", 1), // Index disesuaikan
          _buildNavItem(Icons.person, "Profile", 2), // Index disesuaikan
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
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
              color: isSelected ? Colors.green : Colors.transparent,
            ),
            child: Icon(
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
