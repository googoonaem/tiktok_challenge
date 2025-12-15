import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({super.key, required this.text, this.icon, this.icon2});

  final String text;
  final IconData? icon;
  final Widget? icon2;

  @override
  Widget build(BuildContext context) {
    return ListTile(leading: FaIcon(icon), title: Text(text), trailing: icon2);
  }
}
