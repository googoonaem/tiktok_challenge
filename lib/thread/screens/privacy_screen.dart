import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/thread/widgets/setting_tile.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _notification = false;
  void _notificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          SwitchListTile(
            value: _notification,
            onChanged: _notificationChanged,
            title: Row(
              children: [
                FaIcon(FontAwesomeIcons.lock),
                Gaps.h20,
                Text("Private profile"),
              ],
            ),
          ),
          SettingTile(
            text: "Mentions",
            icon: FontAwesomeIcons.threads,
            icon2: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
                Gaps.h14,
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
          SettingTile(
            text: "Muted",
            icon: FontAwesomeIcons.bellSlash,
            icon2: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade400,
            ),
          ),
          SettingTile(
            text: "Hidden Words",
            icon: FontAwesomeIcons.eyeSlash,
            icon2: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade400,
            ),
          ),
          SettingTile(
            text: "Profiles you follow",
            icon: FontAwesomeIcons.userGroup,
            icon2: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.grey.shade400,
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Other privacy settings",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size14),
            child: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: Sizes.size16,
              ),
            ),
          ),
          SettingTile(
            text: "Blocked profiles",
            icon: FontAwesomeIcons.circleXmark,
            icon2: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade400,
            ),
          ),
          SettingTile(
            text: "Hide likes",
            icon: FontAwesomeIcons.heartCrack,
            icon2: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
