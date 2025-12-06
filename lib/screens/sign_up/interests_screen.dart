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
  final bool _screen = true;
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
  final List<String> _checkedList = ["add()로 넣으면 된다고 함"];

  void _buttonTap(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => InterestsDetailScreen()));
  }

  void _cardTap() {}

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
      body: Column(
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: Sizes.size20,
                right: Sizes.size20,
                bottom: Sizes.size72,
              ),
              child: GridView.count(
                childAspectRatio: Sizes.size80 / Sizes.size52,
                crossAxisCount: 2,
                children: List.generate(interestsList.length, (index) {
                  return GestureDetector(
                    onTap: () => _cardTap,
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(Sizes.size5),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadiusGeometry.circular(
                          Sizes.size28,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size8,
                          horizontal: Sizes.size16,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: Sizes.size5,
                              child: FaIcon(FontAwesomeIcons.solidCircleCheck),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                interestsList[index],
                                style: TextStyle(
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _finish
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
