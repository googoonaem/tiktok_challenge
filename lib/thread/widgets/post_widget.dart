import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/thread/widgets/post_icon_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.username,
    required this.content,
    this.imgUrl,
    this.comments,
    this.avatarUrl,
    required this.likes,
    required this.commentCount,
    required this.postTime,
    this.avatarColor,
    required this.verified,
  });

  final String username;
  final String content;
  final String? imgUrl;
  final String? avatarUrl;
  final List<Map<String, String>>? comments;
  final int likes;
  final int commentCount;
  final Color? avatarColor;
  final DateTime postTime;
  final bool verified;

  String _timeAgo(DateTime postTime) {
    final diff = DateTime.now().difference(postTime);
    if (diff.inMinutes < 1) return "방금 전";
    if (diff.inMinutes < 60) return "${diff.inMinutes}분 전";
    if (diff.inHours < 24) return "${diff.inHours}시간 전";
    return "${diff.inDays}일 전";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
      child: Column(
        children: [
          Divider(color: Colors.grey.shade300),
          Gaps.v14,
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: avatarColor,
                      radius: Sizes.size24,
                      child: Text(username.substring(0, 2)),
                    ),
                    Gaps.v10,
                    Expanded(
                      child: Container(width: 2, color: Colors.grey.shade300),
                    ),
                    Gaps.v10,
                  ],
                ),
                Gaps.h10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Sizes.size20,
                          ),
                        ),
                        verified
                            ? Row(
                                children: [
                                  Gaps.h5,
                                  FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    size: Sizes.size14,
                                    color: Colors.lightBlue,
                                  ),
                                  Gaps.h5,
                                ],
                              )
                            : Gaps.h14,
                        Text(_timeAgo(postTime)),
                      ],
                    ),
                    SizedBox(
                      width: 310,
                      child: Text(
                        content,
                        style: TextStyle(fontSize: Sizes.size16),
                      ),
                    ),
                    Gaps.v10,
                    imgUrl?.isNotEmpty == true
                        ? Container(
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.size28),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(Sizes.size28),
                              child: Image.asset(imgUrl!),
                            ),
                          )
                        : SizedBox(),
                    Gaps.v10,
                    PostIconWidget(),
                    Gaps.v10,
                  ],
                ),
              ],
            ),
          ),
          Gaps.v10,
          Row(
            children: [
              SizedBox(
                width: Sizes.size60,
                height: Sizes.size60,
                child: Stack(
                  children: [
                    Positioned(
                      top: Sizes.size14,
                      child: CircleAvatar(
                        radius: Sizes.size10,
                        backgroundColor: avatarColor,

                        child: Text(username.substring(0, 2)),
                      ),
                    ),
                    Positioned(
                      left: Sizes.size28,
                      child: CircleAvatar(
                        radius: Sizes.size14,
                        backgroundColor: avatarColor,

                        child: Text(username.substring(0, 2)),
                      ),
                    ),
                    Positioned(
                      top: Sizes.size36,
                      left: Sizes.size24,

                      child: CircleAvatar(
                        radius: Sizes.size7,
                        backgroundColor: avatarColor,
                        child: Text(username.substring(0, 2)),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.h28,
              Text(
                "$commentCount replies • $likes likes",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: Sizes.size16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
