import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class ButtonType1 extends StatelessWidget {
  const ButtonType1({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.size8,
        horizontal: Sizes.size48,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: Sizes.size16, fontWeight: FontWeight.w700),
      ),
    );
  }
}
