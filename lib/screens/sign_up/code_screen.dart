import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/screens/common_widget/round_corner_button.dart';
import 'package:tiktok_challenge/screens/sign_up/interests1_screen.dart';
import 'package:tiktok_challenge/screens/sign_up/password_screen.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  bool _finish = false;

  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onScaffoldTap(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: FaIcon(
              FontAwesomeIcons.twitter,
              color: Theme.of(context).primaryColor,
              size: Sizes.size28,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
            vertical: Sizes.size10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text("Enter it below to verify"),
              Text("Jhon.mobbin@gmail.com."),
              Gaps.v64,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 40,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter(
                          RegExp(r'[0-9]'),
                          allow: true,
                        ),
                      ],
                      controller: controllers[index],
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(counterText: ""),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (index == 5) {
                          setState(() {
                            _finish = !_finish;
                          });
                        }
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 140,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
              vertical: Sizes.size20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Didn't receive email?",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Sizes.size16,
                  ),
                ),
                RoundCornerButton(
                  checked: _finish,
                  text: "Next",
                  goto: PasswordScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
