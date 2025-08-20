import 'package:flutter/material.dart';
import 'package:workout_tracker/extension/navigation.dart';
import 'package:workout_tracker/preference/shared_preference.dart';
import 'package:workout_tracker/widgets/screen_before_login.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const id = "/settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<Map<String, dynamic>> settings = [
    {"title": "Locations", "icons": Icons.location_on_sharp},
    {"title": "Notifications", "icons": Icons.notifications},
    {"title": "Close Friends", "icons": Icons.star},
    {"title": "Sounds", "icons": Icons.volume_up},
    {"title": "Privacy", "icons": Icons.lock},
    {"title": "Measurement Units", "icons": Icons.monitor_heart},
    {"title": "Theme", "icons": Icons.dark_mode},
    {"title": "Language", "icons": Icons.language_sharp},
    {"title": "Backup & Restore", "icons": Icons.restore},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  // fontFamily: "Poppins",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: settings.length,
                itemBuilder: (BuildContext context, int index) {
                  final dataSettings = settings[index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(bottom: 10),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Center(
                          child: Icon(
                            dataSettings["icons"],
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      title: Text(
                        dataSettings["title"],
                        style: TextStyle(
                          // fontFamily: "Montserrat",
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    PreferenceHandler.removeLogin();
                    context.pushReplacement(Screen1());
                  },
                  child: Text(
                    "LOG OUT",
                    style: TextStyle(
                      // fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
