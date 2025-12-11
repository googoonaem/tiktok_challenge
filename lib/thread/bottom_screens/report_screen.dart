import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});

  final List<String> reasons = [
    "I just don't like it",
    "It's unlawful content under NetzDG",
    "It's spam",
    "It's abusive or harmful",
    "Hate speech or symbols",
    "Nudity or sexual activity",
    "It's misleading or deceptive",
    "It's sensitive or inappropriate",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      child: Scaffold(
        body: Column(
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
            Text(
              "Report",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w800,
              ),
            ),
            Divider(thickness: 0.5),
            Gaps.v10,
            Padding(
              padding: const EdgeInsets.only(left: Sizes.size10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Why are you reporting this thread?",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Text(
                    "Help us understand what’s wrong with this thread. Your report helps keep the community safe.",
                  ),
                ],
              ),
            ),
            Gaps.v20,
            Expanded(
              child: ListView.separated(
                itemCount: reasons.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      reasons[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    trailing: FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: Sizes.size16,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
