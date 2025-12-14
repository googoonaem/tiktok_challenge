import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final List<Map<String, dynamic>> _users = [
    {
      "name": "rjmithun",
      "subname": "Mithun",
      "followers": 26.6,
      "verified": false,
    },
    {
      "name": "vicenews",
      "subname": "VICE News",
      "followers": 301,
      "verified": true,
    },
    {
      "name": "trevornoah",
      "subname": "Trevor Noah",
      "followers": 789,
      "verified": true,
    },
    {
      "name": "condenasttraveller",
      "subname": "Conde Nast Traveller",
      "followers": 130,
      "verified": true,
    },
    {
      "name": "chef_pillai",
      "subname": "Suresh Pillai",
      "followers": 69.2,
      "verified": true,
    },
    {
      "name": "malala",
      "subname": "Malala Yousafzai",
      "followers": 237,
      "verified": true,
    },
    {
      "name": "sebin_cyriac",
      "subname": "Fishing_freaks",
      "followers": 53.2,
      "verified": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: Sizes.size96 + Sizes.size32,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v10,
            Text(
              "Search",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.size28,
              ),
            ),
            Gaps.v10,
            CupertinoSearchTextField(),
          ],
        ),
      ),
      body: ListView(
        children: [
          for (var user in _users)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(user["name"].toString().substring(0, 2)),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user["name"],
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Gaps.h6,
                          user["verified"]
                              ? FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  color: Colors.blue,
                                  size: Sizes.size14,
                                )
                              : SizedBox(),
                        ],
                      ),
                      Text(
                        user["subname"],
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gaps.v5,
                      Text(
                        "${user["followers"].toString()}K followers",
                        style: TextStyle(fontSize: Sizes.size12),
                      ),
                    ],
                  ),
                  trailing: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: Sizes.size20,
                      vertical: Sizes.size5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Text(
                      "Follow",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
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
    );
  }
}
