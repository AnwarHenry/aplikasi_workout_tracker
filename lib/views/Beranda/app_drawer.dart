import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/extension/navigation.dart';
import 'package:workout_tracker/widgets/logout.dart';

class Drawer1 extends StatefulWidget {
  const Drawer1({super.key});

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  String username = '';
  String email = '';
  int _selectedIndexDrawer = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text("Halaman 1")),
    LogOutButton(),
    // Center(child: Text("Halaman 3")),
  ];

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username') ?? 'Guest';
    final storedEmail = prefs.getString('email') ?? '';
    setState(() {
      username = storedUsername;
      email = storedEmail;
    });
  }

  void onItemTap(int index) {
    setState(() {
      _selectedIndexDrawer = index;
    });
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndexDrawer]),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Image.asset(
          "assets/images/workout.png",
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.orange, Colors.grey],
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.grey),
              ),
              accountName: Text(username.isNotEmpty ? username : 'Guest'),
              accountEmail: Text(email.isNotEmpty ? email : ''),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                onItemTap(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_applications),
              title: const Text("Settings"),
              onTap: () {
                onItemTap(1);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.dashboard),
            //   title: const Text("Dashboard"),
            //   onTap: () {
            //     onItemTap(2);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
