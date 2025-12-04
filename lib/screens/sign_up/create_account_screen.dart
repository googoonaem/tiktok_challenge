import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/screens/sign_up/customize_screen.dart';
import 'package:tiktok_challenge/screens/sign_up/code_screen.dart';
import 'package:tiktok_challenge/screens/sign_up/widgets/text_field.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  void _onCancelTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  bool _finish = false;
  void _onNextTap(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CustomizeScreen()),
    );
    setState(() {
      _finish = result;
    });
  }

  String _username = "";
  String _email = "";
  String _date = "";
  bool _birthTap = false;

  bool _usernameValid() {
    if (_username.isNotEmpty && _username.length > 6) {
      return true;
    } else {
      return false;
    }
  }

  bool _emailValid() {
    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!regExp.hasMatch(_email)) {
      return false;
    } else {
      return true;
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Stack(
            alignment: Alignment.centerLeft,
            children: [
              GestureDetector(
                onTap: () => _onCancelTap(context),
                child: Text("Cancel", style: TextStyle(fontSize: Sizes.size20)),
              ),
              Center(
                child: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Theme.of(context).primaryColor,
                  size: Sizes.size28,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v16,
              Text(
                "Create your account",
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v40,
              Stack(
                children: [
                  TextFieldWidget(
                    hint: "Name",
                    type: "Name",
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                  ),
                  Positioned(
                    right: Sizes.size10,
                    top: Sizes.size10,
                    child: FaIcon(
                      FontAwesomeIcons.circleCheck,
                      color: _username.isEmpty
                          ? Colors.transparent
                          : _usernameValid()
                          ? Colors.green.shade400
                          : Colors.red.shade400,
                    ),
                  ),
                ],
              ),
              Gaps.v32,
              Stack(
                children: [
                  TextFieldWidget(
                    type: "Email",
                    hint: "email address",
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  Positioned(
                    right: Sizes.size10,
                    top: Sizes.size10,
                    child: FaIcon(
                      FontAwesomeIcons.circleCheck,
                      color: _email.isEmpty
                          ? Colors.transparent
                          : _emailValid()
                          ? Colors.green.shade400
                          : Colors.red.shade400,
                    ),
                  ),
                ],
              ),
              Gaps.v32,
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      _birthTap = true;
                    },
                    child: TextFieldWidget(
                      type: "Date of birth",
                      hint: "Date of birth",
                      onChanged: (value) {
                        setState(() {
                          _date = value.toString();
                        });
                      },
                    ),
                  ),
                  Positioned(
                    right: Sizes.size10,
                    top: Sizes.size10,
                    child: FaIcon(
                      FontAwesomeIcons.circleCheck,
                      color: _date == ""
                          ? Colors.transparent
                          : Colors.green.shade400,
                    ),
                  ),
                ],
              ),
              Gaps.v64,
              Gaps.v72,
              Visibility(
                visible: _finish ? true : false,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "By signing up, you agree to our ",
                          style: TextStyle(fontSize: Sizes.size14),
                        ),
                        Text(
                          "Terms",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        Text(", ", style: TextStyle(fontSize: Sizes.size14)),
                        Text(
                          "Priviacy",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Policy",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        Text(
                          ", and ",
                          style: TextStyle(fontSize: Sizes.size14),
                        ),
                        Text(
                          "Cookie Use",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        Text(". Twitter may use your"),
                      ],
                    ),
                    Text(
                      "contact information, including your email address",
                      style: TextStyle(fontSize: Sizes.size14),
                    ),
                    Text(
                      "and phone number for purposes outlined in our",
                      style: TextStyle(fontSize: Sizes.size14),
                    ),
                    Row(
                      children: [
                        Text(
                          "Privacy Policy.",
                          style: TextStyle(fontSize: Sizes.size14),
                        ),
                        Text(
                          "Learn more",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        Text(". Others will be able to"),
                      ],
                    ),
                    Text("find you by email or phone number, when provided,"),
                    Row(
                      children: [
                        Text("unless you choose otherwise "),
                        Text(
                          "here",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        Text("."),
                      ],
                    ),
                    Gaps.v20,
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(true);
                        if (_finish) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CodeScreen(),
                            ),
                          );
                        }
                      },
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            vertical: Sizes.size6,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: _finish
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(Sizes.size28),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _finish ? "Sign up" : "Next",
                                    style: TextStyle(
                                      fontSize: Sizes.size20,
                                      fontWeight: FontWeight.bold,
                                      color: _finish
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_emailValid() && _usernameValid() && _date != "") {
              return _onNextTap(context);
            }
          },
          label: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size10,
                vertical: Sizes.size1,
              ),
              child: Visibility(
                visible: _finish ? false : true,
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: _emailValid() && _usernameValid() && _date != ""
                        ? Colors.white
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: _finish
              ? Colors.transparent
              : _emailValid() && _usernameValid() && _date != ""
              ? Theme.of(context).primaryColor
              : Colors.grey,
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(Sizes.size32),
          ),
        ),
      ),
    );
  }
}
