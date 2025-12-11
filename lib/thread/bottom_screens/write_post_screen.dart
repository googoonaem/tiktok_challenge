import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';

class WritePostScreen extends StatelessWidget {
  const WritePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void stopWriting() {
      FocusScope.of(context).unfocus();
    }

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      height: size.height * 0.9,
      child: GestureDetector(
        onTap: stopWriting,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leadingWidth: Sizes.size96,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {},
              icon: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel", style: TextStyle(fontSize: Sizes.size20)),
              ),
            ),
            title: Text(
              "New thread",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Container(color: Colors.grey.shade400, height: 1),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
              vertical: Sizes.size20,
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(child: Text("ja")),
                        ),
                        Gaps.v6,
                        Container(
                          width: Sizes.size2,
                          height: Sizes.size64,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                        ),

                        Gaps.v6,
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: Sizes.size10,
                            child: Text("ja"),
                          ),
                        ),
                      ],
                    ),
                    Gaps.h20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "jane_mobbin",
                          style: TextStyle(
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          height: Sizes.size36,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Start a thread...",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            maxLines: null,
                            minLines: null,
                            textInputAction: TextInputAction.newline,
                          ),
                        ),
                        FaIcon(
                          FontAwesomeIcons.paperclip,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  width: size.width - 30,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Anyone can reply",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      Text(
                        "Post",
                        style: TextStyle(
                          color: Colors.blue.shade200,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
