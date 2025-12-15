import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/thread/screens/privacy_screen.dart';
import 'package:tiktok_challenge/thread/widgets/setting_tile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _privacyTap() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => PrivacyScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,

        backgroundColor: Colors.white,
        title: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Text("< Back"),
            ),
            Center(child: Text("Privacy")),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey.shade300),
        ),
      ),

      body: Column(
        children: [
          SettingTile(
            text: "Follow and invite friends",
            icon: FontAwesomeIcons.userPlus,
          ),
          SettingTile(text: "Notifications", icon: FontAwesomeIcons.bell),
          GestureDetector(
            onTap: _privacyTap,
            child: SettingTile(text: "Privacy", icon: FontAwesomeIcons.lock),
          ),
          SettingTile(text: "Account", icon: FontAwesomeIcons.circleUser),
          SettingTile(text: "Help", icon: FontAwesomeIcons.lifeRing),
          SettingTile(text: "About", icon: FontAwesomeIcons.circleInfo),
          Divider(thickness: 0.5),
          ListTile(
            title: Text("Log out"),
            textColor: Colors.blue,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  iconColor: Colors.black,
                  title: Text("Are you sure?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Yes"),
                    ),
                  ],
                ),
              );
            },
            trailing: CupertinoActivityIndicator(),
          ),
        ],
      ),
    );
  }
}
