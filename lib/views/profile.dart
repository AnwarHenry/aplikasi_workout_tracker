// import 'package:flutter/material.dart';
// import 'package:workout_tracker/sqflite/db_helper.dart';
// import 'package:workout_tracker/views/login_page.dart';

// class ProfilePage extends StatefulWidget {
//   final String username;
//   const ProfilePage({super.key, required this.username});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   late Future<Map<String, dynamic>> _userData;
//   late Future<Map<String, dynamic>> _userStats;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   void _loadUserData() {
//     _userData = DbHelper.instance
//         .getUser(widget.username)
//         .then((user) => user ?? <String, dynamic>{});
//     _userStats = _userData.then((user) {
//       return DbHelper.instance.getUserStats(user['id'] ?? 0);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: _logout,
//           ),
//         ],
//       ),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: _userData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('User not found'));
//           }

//           final user = snapshot.data!;
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 // Profile Header
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.blue[100],
//                   child: Text(
//                     user['full_name']?.toString().substring(0, 1) ?? 'U',
//                     style: const TextStyle(fontSize: 40),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   user['full_name'] ?? 'No Name',
//                   style: Theme.of(context).textTheme.headlineSmall,
//                 ),
//                 Text(user['email'] ?? 'No Email'),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Member since ${DateTime.parse(user['join_date']).year}',
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//                 const SizedBox(height: 24),

//                 // Stats Cards
//                 FutureBuilder<Map<String, dynamic>>(
//                   future: _userStats,
//                   builder: (context, statsSnapshot) {
//                     if (!statsSnapshot.hasData) {
//                       return const CircularProgressIndicator();
//                     }
//                     final stats = statsSnapshot.data!;
//                     return Row(
//                       children: [
//                         _buildStatCard('Workouts', stats['total_workouts'],
//                             Icons.fitness_center),
//                         _buildStatCard(
//                             'Minutes', stats['total_minutes'], Icons.timer),
//                         _buildStatCard('Calories', stats['total_calories'],
//                             Icons.local_fire_department),
//                       ],
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 24),

//                 // Actions
//                 ListTile(
//                   leading: const Icon(Icons.edit),
//                   title: const Text('Edit Profile'),
//                   onTap: () => _showEditProfileDialog(user),
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.history),
//                   title: const Text('Workout History'),
//                   onTap: () {
//                     // Navigate to history page
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.settings),
//                   title: const Text('Settings'),
//                   onTap: () {
//                     // Navigate to settings
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildStatCard(String title, dynamic value, IconData icon) {
//     return Expanded(
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               Icon(icon, size: 30),
//               const SizedBox(height: 8),
//               Text(
//                 value.toString(),
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showEditProfileDialog(Map<String, dynamic> user) {
//     final nameController = TextEditingController(text: user['full_name']);
//     final emailController = TextEditingController(text: user['email']);

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Edit Profile'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(labelText: 'Full Name'),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () async {
//               final dialogContext = context;
//               await DbHelper.instance.updateUser(user['id'], {
//                 'full_name': nameController.text,
//                 'email': emailController.text,
//               });
//               if (!mounted) return;
//               Navigator.pop(dialogContext);
//               setState(() => _loadUserData());
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _logout() {
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => const LoginPage()),
//       (route) => false,
//     );
//   }
// }
