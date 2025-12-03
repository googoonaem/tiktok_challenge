import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Stack(
          alignment: Alignment.centerLeft,
          children: [
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
        padding: EdgeInsetsGeometry.symmetric(horizontal: Sizes.size40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v36,
            Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v20,
            Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v20,
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: true,
                  ),
                ),
                Gaps.h10,
                GestureDetector(
                  onTap: () {
                    setState(() {
                      checked = !checked;
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: !checked
                              ? Colors.grey.shade400
                              : Theme.of(context).highlightColor,
                          borderRadius: BorderRadius.circular(Sizes.size32),
                        ),
                        height: Sizes.size48,
                        width: Sizes.size72,
                      ),
                      Positioned(
                        left: !checked ? Sizes.size4 : Sizes.size28,
                        top: Sizes.size4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Sizes.size32),
                          ),
                          height: Sizes.size40,
                          width: Sizes.size40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gaps.v28,
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
                Text(", and ", style: TextStyle(fontSize: Sizes.size14)),
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
              ],
            ),
            Gaps.v72,
            Gaps.v72,
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(true);
              },
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: Sizes.size6),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: checked ? Colors.black : Colors.grey,
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
                            "Next",
                            style: TextStyle(
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.bold,
                              color: checked
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
    );
  }
}
