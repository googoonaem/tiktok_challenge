import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/screens/sign_up/interests_detail_screen.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final bool _finish = true;
  final List<String> interestsList = [
    "Fashion & beauty",
    "Outdoors",
    "Arts & culture",
    "Animation & comics",
    "Business & finance",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming",
    "Sports",
    "Technology",
    "Health & fitness",
    "Education",
    "Science",
    "Photography",
    "Movies & TV",
    "Literature",
    "DIY & crafts",
    "Pets & animals",
  ];
  final List<String> _checkedList = [];

  void _buttonTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            InterestsDetailScreen(interestsList: _checkedList),
      ),
    );
  }

  void _cardTap(String interest) {
    setState(() {
      if (_checkedList.contains(interest)) {
        _checkedList.remove(interest);
      } else {
        _checkedList.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Theme.of(context).primaryColor,
            size: Sizes.size28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size5,
                left: Sizes.size20,
                right: Sizes.size20,
                bottom: Sizes.size5,
              ),
              child: Column(
                children: [
                  Text(
                    "What do you want to see on Twitter?",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                  ),
                ],
              ),
            ),
            Gaps.v24,
            Divider(
              color: Colors.grey.shade400,
              height: Sizes.size2,
              thickness: 0,
            ),
            Gaps.v24,
            Gaps.v12,
            SizedBox(
              height: 540,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: Sizes.size40,
                    left: Sizes.size20,
                  ),
                  child: Wrap(
                    runSpacing: Sizes.size20,
                    spacing: Sizes.size20,
                    children: [
                      for (var interest in interestsList)
                        GestureDetector(
                          onTap: () => _cardTap(interest),
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                              color: _checkedList.contains(interest)
                                  ? Theme.of(context).primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(Sizes.size24),
                              border: Border.all(
                                color: _checkedList.contains(interest)
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey.shade200,
                                width: Sizes.size2,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                              horizontal: Sizes.size10,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Text(
                                  interest,
                                  style: TextStyle(
                                    color: _checkedList.contains(interest)
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: Sizes.size20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    color: _checkedList.contains(interest)
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(height: 140),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _checkedList.length > 2
          ? Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: Sizes.size1,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Great work🥳"),
                    GestureDetector(
                      onTap: () => _buttonTap(context),
                      child: Container(
                        width: Sizes.size80,
                        height: Sizes.size48,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(Sizes.size36),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
