import 'package:flutter/material.dart';
import 'package:workout_tracker/views/settings.dart';
import 'package:workout_tracker/views/users_page.dart';
// import 'package:workout_tracker/widgets/button_action.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const id = "/dashboard";

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(), //index 0
    // Profile(),
    // JadwalLatihanPage(),
 
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDrawerTapped(int index) {
    Navigator.pop(context); // Tutup drawer
    setState(() {
      _selectedIndex = index;
    });
  }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Workout Tracker', style: TextStyle(fontSize: 20)),
  //       centerTitle: true,
        
  //     ),
      // drawer: Drawer(
      //   child: 
      //   SafeArea(
      //     child: Column(
      //       children: [
      //         UserAccountsDrawerHeader(accountName: const Text('User'), accountEmail: const Text('user@example.com'), currentAccountPicture: const CircleAvatar(child: Text('U'))),
      //         ListTile(
      //           leading: const Icon(Icons.schedule),
      //           title: const Text('Jadwal Latihan'), 
      //           onTap: (){}
      //           ),
      //         ListTile(
      //           leading: const Icon(Icons.notifications), 
      //           title: const Text('Notifikasi'), 
      //           onTap: (){}
      //          ),
      //         const Divider(),
      //         ListTile(
      //           leading: const Icon(Icons.settings),
      //           title: const Text('Pengaturan'),
      //           onTap: () { 
      //             Navigator.pop(context); Navigator.push(context,
      //             MaterialPageRoute(builder: (_) => const SettingsPage())); }),
      //         const Spacer(),
      //         ListTile(leading: const Icon(Icons.logout), title: const Text('Logout'), onTap: () { Navigator.pushReplacementNamed(context, '/login'); }),
      //       ],
      //     ),
      //   ),