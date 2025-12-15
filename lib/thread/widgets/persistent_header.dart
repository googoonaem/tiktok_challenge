import 'package:flutter/material.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class PersistentHeaderBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey.shade500,
        tabs: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Threads",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Replies",
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 41;

  @override
  // TODO: implement minExtent
  double get minExtent => 41;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
