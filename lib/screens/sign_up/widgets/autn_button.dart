import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class AutnButton extends StatelessWidget {
  const AutnButton({super.key, required this.darkmode, required this.text});

  final bool darkmode;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: Sizes.size6),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: darkmode ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size28),
            border: Border.all(
              width: Sizes.size2,
              color: darkmode ? Colors.black : Colors.grey.shade300,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.bold,
                color: darkmode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
