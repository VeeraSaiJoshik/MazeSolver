import 'package:flutter/material.dart';
import 'package:mindmystery/models/settings.dart';
import 'package:mindmystery/widgets/settingsWidget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  settingsPrefrences settingData = settingsPrefrences(true, false);
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: height * 0.105, 
              left: width * 0.02,
            ),
            width: width * 0.4,
            height: height * 0.06,
            child: const FittedBox(
              fit: BoxFit.fitHeight, 
              child: Text(
                "Settings", 
                style: TextStyle(
                  color: Colors.white, 
                  fontFamily: "JustSans", 
                  fontWeight: FontWeight.w800, 
                ),
              ),
            ),
          ), 
          SizedBox(
            height: height * 0.05,
          ),
          SettingsWidget("assets/images/settings/darkMode.png", "Dark Mode", true),
          SizedBox(
            height: height * 0.02,
          ),
          SettingsWidget("assets/images/settings/notification.png", "Notifications", true),
          SizedBox(
            height: height * 0.05,
          ),
          SettingsWidget("assets/images/settings/privacyPolicy.png", "Privacy Policy", false),
          SizedBox(
            height: height * 0.02,
          ),
          SettingsWidget("assets/images/settings/termsOfService.png", "Terms of Service", false),
          SizedBox(
            height: height * 0.02,
          ),
          SettingsWidget("assets/images/settings/communityGuideline.png", "Community Guidelines", false),
          
        ],
      ),
    );
  }
}