import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/screens/sign_up/create_account_screen.dart';

class AutnButton extends StatelessWidget {
  const AutnButton({
    super.key,
    required this.darkmode,
    required this.text,
    required this.icon,
  });

  final bool darkmode;
  final String icon;
  final String text;

  FaIcon _faIcon(String icon) {
    Map<String, IconData> iconMap = {
      "google": FontAwesomeIcons.google,
      "apple": FontAwesomeIcons.apple,
    };
    return FaIcon(iconMap[icon]);
  }

  @override
  Widget build(BuildContext context) {
    void signUpButtonTap(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            if (icon == "google") {
              return CreateAccountScreen();
            } else if (icon == "apple") {
              return CreateAccountScreen();
            } else {
              return CreateAccountScreen();
            }
          },
        ),
      );
    }

    return GestureDetector(
      onTap: () => signUpButtonTap(context),
      child: FractionallySizedBox(
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
              padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != "" ? _faIcon(icon) : SizedBox(),
                  Gaps.h10,
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                      color: darkmode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
