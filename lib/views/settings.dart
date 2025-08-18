import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        SwitchListTile(
            value: _notif,
            onChanged: (v) => setState(() => _notif = v),
            title: const Text('Notifikasi')),
        const ListTile(
            leading: Icon(Icons.info),
            title: Text('Tentang'),
            subtitle: Text('Workout Tracker (demo)')),
      ]),
    );
  }
}
