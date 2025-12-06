import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/screens/common_widget/round_corner_button.dart';
import 'package:tiktok_challenge/screens/sign_up/interests_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _finish = false;
  bool _obscureText = true;
  String _password = "";
  final TextEditingController _passwordController = TextEditingController();
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onEyeTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _passwordVald() {
    return _password.isNotEmpty && _password.length > 8;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Center(
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Theme.of(context).primaryColor,
              size: Sizes.size28,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v36,
              Text(
                "You'll need a password",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v20,
              Text(
                "Make sure it's 8 characters or more.",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: Sizes.size16,
                ),
              ),
              Stack(
                children: [
                  TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                        _finish = _passwordVald();
                      });
                    },

                    decoration: InputDecoration(
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: _onEyeTap,
                            child: FaIcon(
                              _obscureText
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: Sizes.size24,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Gaps.h6,
                          Opacity(
                            opacity: _finish ? 1 : 0,
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              size: Sizes.size20,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                      labelText: "Password",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 120,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
              vertical: Sizes.size20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoundCornerButton(
                  checked: _finish,
                  text: "Next",
                  goto: InterestsScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
