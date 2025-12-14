import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final _activityTabs = [
    'All',
    'Replies',
    'Mentions',
    'Likes',
    'Reposts',
    'Follows',
  ];

  final List<Map<String, dynamic>> _mentions = [
    {
      "name": "john_mobbin",
      "alarm": "Mentioned you",
      "time": "4",
      "content":
          "Here's a thread you should follow if you love botany @jane_mobbin",
      "icon": FaIcon(
        FontAwesomeIcons.threads,
        size: Sizes.size12,
        color: Colors.white,
      ),
    },
    {
      "name": "alice_smith",
      "alarm": "Followed you",
      "time": "10",
      "content": "",
      "icon": FaIcon(
        FontAwesomeIcons.userPlus,
        size: Sizes.size12,
        color: Colors.white,
      ),
    },
    {
      "name": "bob_jones",
      "alarm": "Replied to your comment",
      "time": "15",
      "content": "I totally agree with your point about climate change.",
      "icon": FaIcon(
        FontAwesomeIcons.reply,
        size: Sizes.size12,
        color: Colors.white,
      ),
    },
    {
      "name": "carol_lee",
      "alarm": "Mentioned you",
      "time": "20",
      "content": "Check out this new article I found on urban gardening.",
      "icon": FaIcon(
        FontAwesomeIcons.threads,
        size: Sizes.size12,
        color: Colors.white,
      ),
    },
    {
      "name": "david_kim",
      "alarm": "Liked your post",
      "time": "25",
      "content": "😅😅😅🚀🚀",
      "icon": FaIcon(
        FontAwesomeIcons.solidHeart,
        size: Sizes.size12,
        color: Colors.white,
      ),
    },
    {
      "name": "emma_watson",
      "alarm": "Followed you",
      "time": "30",
      "content": "",
      "icon": FaIcon(
        FontAwesomeIcons.userPlus,
        size: Sizes.size12,
        color: Colors.white,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _activityTabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
          ),
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v10,
              Text(
                "Activity",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.size28,
                ),
              ),
              Gaps.v10,
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size7),
              color: Colors.black,
            ),
            labelColor: Colors.white,
            dividerHeight: 0,
            indicatorPadding: EdgeInsets.only(
              right: Sizes.size10,
              bottom: Sizes.size2,
            ),
            labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.only(left: Sizes.size20),
            unselectedLabelColor: Colors.black,
            tabs: [
              for (var tab in _activityTabs)
                Row(
                  children: [
                    Container(
                      width: Sizes.size96,
                      height: Sizes.size40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(Sizes.size7),
                      ),
                      child: Tab(text: tab),
                    ),
                    Gaps.h10,
                  ],
                ),
            ],
          ),
        ),
        body: Column(
          children: [
            Gaps.v32,
            for (var mention in _mentions)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    leading: SizedBox(
                      width: Sizes.size52,
                      height: Sizes.size52,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            child: Text(
                              mention["name"].toString().substring(0, 2),
                            ),
                          ),
                          Positioned(
                            right: Sizes.size7,
                            bottom: Sizes.size7,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: mention["alarm"] == "Followed you"
                                    ? Colors.blue.shade100
                                    : mention["alarm"] == "Mentioned you"
                                    ? Colors.amber.shade400
                                    : const Color.fromARGB(255, 198, 114, 240),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: mention["icon"],
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              mention["name"],
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Gaps.h4,
                            Text(
                              "${mention["time"].toString()}h",
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                        Text(
                          mention["alarm"],
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        Text(
                          mention["content"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    trailing: mention["alarm"].toString() == "Followed you"
                        ? Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size14,
                              vertical: Sizes.size6,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(Sizes.size8),
                            ),
                            child: Text("Following"),
                          )
                        : SizedBox(),
                  ),
                  Container(
                    height: 1,
                    width: 350,
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
