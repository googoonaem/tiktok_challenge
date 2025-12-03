import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/screens/sign_up/widgets/autn_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            children: [
              Gaps.v96,
              Gaps.v10,
              Gaps.v96,
              Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v96,
              Gaps.v36,
              AutnButton(
                icon: "google",
                darkmode: false,
                text: "Continue with Google",
              ),
              AutnButton(
                icon: "apple",
                darkmode: false,
                text: "Continue with Apple",
              ),
              Gaps.v20,
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey.shade300, thickness: 2),
                  ),
                  Gaps.h16,
                  Text(
                    "or",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Gaps.h16,
                  Expanded(
                    child: Divider(color: Colors.grey.shade300, thickness: 2),
                  ),
                ],
              ),
              AutnButton(darkmode: true, text: "Create account", icon: ""),
              Gaps.v20,
              Row(
                children: [
                  Text(
                    "By signing up, you agree to our ",
                    style: TextStyle(fontSize: Sizes.size16),
                  ),
                  Text(
                    "Terms",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Text(",", style: TextStyle(fontSize: Sizes.size16)),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Priviacy Policy",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Text(", and ", style: TextStyle(fontSize: Sizes.size16)),
                  Text(
                    "Cookie Use",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Text("."),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            Text(
              "    Do you haven't account? ",
              style: TextStyle(fontSize: Sizes.size16),
            ),
            GestureDetector(
              onTap: () => _onSignUpTap(context),
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
