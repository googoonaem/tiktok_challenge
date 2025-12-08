import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class PostIconWidget extends StatelessWidget {
  const PostIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.heart, size: Sizes.size24),
        Gaps.h20,
        FaIcon(FontAwesomeIcons.comment, size: Sizes.size24),
        Gaps.h20,
        FaIcon(FontAwesomeIcons.share, size: Sizes.size24),
        Gaps.h20,
        FaIcon(FontAwesomeIcons.paperPlane, size: Sizes.size24),
      ],
    );
  }
}
