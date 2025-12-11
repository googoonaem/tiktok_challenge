import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/thread/bottom_screens/report_screen.dart';

class PostMoreWidget extends StatelessWidget {
  const PostMoreWidget({super.key});

  void _goReport(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ReportScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Gaps.v14,
              Container(
                width: Sizes.size60,
                height: Sizes.size6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(Sizes.size10),
                ),
              ),
              Gaps.v24,
              Container(
                padding: EdgeInsets.symmetric(vertical: Sizes.size20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(Sizes.size20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Sizes.size20,
                        bottom: Sizes.size7,
                      ),
                      child: Text(
                        "Unfollow",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                    Divider(thickness: 0.5),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Sizes.size20,
                        top: Sizes.size7,
                      ),
                      child: Text(
                        "Mute",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v20,
              Container(
                padding: EdgeInsets.symmetric(vertical: Sizes.size20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(Sizes.size20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Sizes.size20,
                        bottom: Sizes.size7,
                      ),
                      child: Text(
                        "Hide",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: Sizes.size20,
                        ),
                      ),
                    ),
                    Divider(thickness: 0.5),
                    GestureDetector(
                      onTap: () => _goReport(context),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Sizes.size20,
                          top: Sizes.size7,
                        ),
                        child: Text(
                          "Report",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Sizes.size20,
                            color: Colors.red,
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
      ),
    );
  }
}
