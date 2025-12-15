import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/thread/screens/setting_screen.dart';
import 'package:tiktok_challenge/thread/widgets/button_type1.dart';
import 'package:tiktok_challenge/thread/widgets/persistent_header.dart';
import 'package:tiktok_challenge/thread/widgets/post_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  void _settingsClick() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => SettingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.black,
                    size: Sizes.size28,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FaIcon(FontAwesomeIcons.instagram, size: Sizes.size28),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _settingsClick,
                        child: FaIcon(
                          FontAwesomeIcons.equals,
                          size: Sizes.size28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jane",
                          style: TextStyle(
                            fontSize: Sizes.size24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "jane_mobbin",
                              style: TextStyle(fontSize: Sizes.size14),
                            ),
                            Gaps.h5,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.size9,
                                vertical: Sizes.size3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size20,
                                ),
                              ),
                              child: Text(
                                "threads.net",
                                style: TextStyle(
                                  fontSize: Sizes.size10,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: CircleAvatar(
                      radius: Sizes.size28,
                      child: Text("Ja"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: Sizes.size14),
                    child: Text("Plant enthusiast!"),
                  ),
                  Gaps.v14,
                  Padding(
                    padding: const EdgeInsets.only(left: Sizes.size14),
                    child: Row(
                      children: [
                        SizedBox(
                          width: Sizes.size36,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: Sizes.size10,
                                backgroundColor: Colors.indigoAccent.shade200,
                                child: Text(
                                  "11",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Positioned(
                                left: Sizes.size12,
                                child: CircleAvatar(
                                  radius: Sizes.size10,
                                  child: Text("22"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gaps.h7,
                        Text(
                          "2 followers",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ),
                  Gaps.v16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonType1(text: "Edit profile"),
                      Gaps.h10,
                      ButtonType1(text: "Share profile"),
                    ],
                  ),
                  Gaps.v5,
                ],
              ),
            ),
            SliverPersistentHeader(
              delegate: PersistentHeaderBar(),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          children: [
            ListView(
              children: [
                PostWidget(
                  username: "lowbatteryhuman",
                  content:
                      "Opened this app for one minute and somehow lost an hour.",
                  likes: 128,
                  commentCount: 14,
                  postTime: DateTime.now(),
                  verified: false,
                ),
                PostWidget(
                  username: "still_typing",
                  content:
                      "This was supposed to be a quick thought, but I kept typing without really knowing why. Somewhere along the way it stopped being meaningful and turned into one of those posts you read just because it hasn’t ended yet.",
                  likes: 19,
                  commentCount: 4,
                  postTime: DateTime.now(),
                  verified: false,
                ),
                PostWidget(
                  username: "lowbatteryhuman",
                  content:
                      "Some days feel busy without anything actually getting done, and today definitely feels like one of those days.",
                  likes: 213,
                  commentCount: 18,
                  postTime: DateTime.now().subtract(
                    const Duration(days: 1, hours: 4),
                  ),
                  verified: false,
                ),
              ],
            ),
            Center(child: Text("Page two")),
          ],
        ),
      ),
    );
  }
}
