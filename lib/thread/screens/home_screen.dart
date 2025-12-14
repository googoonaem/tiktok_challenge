import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/constants/gaps.dart';
import 'package:tiktok_challenge/constants/sizes.dart';
import 'package:tiktok_challenge/thread/bottom_screens/write_post_screen.dart';
import 'package:tiktok_challenge/thread/screens/activity_screen.dart';
import 'package:tiktok_challenge/thread/screens/search_screen.dart';
import 'package:tiktok_challenge/thread/widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  bool showTitle = true;
  int _selectedIndex = 0;

  final screens = [
    Center(child: Text("1")),
    SearchScreen(),
    Center(child: Text("3")),
    ActivityScreen(),
    Center(child: Text("5")),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        showTitle = _scrollController.offset < 160;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _writeTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => WritePostScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 0
          ? PreferredSize(
              preferredSize: showTitle
                  ? Size.fromHeight(140)
                  : Size.fromHeight(0),
              child: AppBar(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                flexibleSpace: Opacity(
                  opacity: showTitle ? 1 : 0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: showTitle ? Sizes.size48 : 0,
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.threads,
                        size: Sizes.size32,
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
              ),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: AppBar(backgroundColor: Colors.white),
            ),
      body: _selectedIndex == 0
          ? Scrollbar(
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    PostWidget(
                      username: "pubity",
                      content: "Vine after seeing the Threads logo unveiled",
                      commentCount: 36,
                      verified: true,
                      likes: 391,
                      avatarColor: Color.fromARGB(255, 253, 222, 215),
                      imgUrl: "assets/images/donuts.png",
                      postTime: DateTime(2025, 12, 8, 16, 30, 20),
                    ),
                    PostWidget(
                      username: "thetinderblog",
                      content: "Elon alone on Twitter right now...",
                      verified: false,
                      commentCount: 210,
                      avatarColor: Color.fromARGB(255, 253, 212, 245),
                      likes: 1540,
                      postTime: DateTime(2025, 12, 5, 12, 11, 37),
                    ),
                    PostWidget(
                      username: "tropicalseductions",
                      content:
                          "In a world that moves faster every day, people often forget to slow down and appreciate the small moments that make life meaningful. Whether it’s a quiet sunrise, a short conversation with someone you care about, or a few minutes spent enjoying music, these simple experiences can bring more peace than we expect. By paying attention to them, we learn to reconnect with ourselves and create a sense of balance that lasts.",
                      commentCount: 2,
                      verified: false,
                      avatarColor: Color.fromARGB(255, 223, 222, 215),
                      likes: 4,
                      postTime: DateTime(2025, 11, 30, 22, 13, 11),
                    ),
                    PostWidget(
                      username: "shityoushouldcare",
                      verified: true,
                      content:
                          "my phone feels like a vibrator with all these notifications rn",
                      commentCount: 64,
                      likes: 631,
                      postTime: DateTime(2025, 11, 28, 20, 10, 55),
                    ),
                    PostWidget(
                      username: "_plantswithkrystal_",
                      content:
                          "If you're reading this, go water that thirsty plant. You're welcome ☺️",
                      commentCount: 8,
                      verified: true,
                      likes: 74,
                      postTime: DateTime(2025, 10, 1, 14, 46, 18),
                    ),
                    Gaps.v48,
                  ],
                ),
              ),
            )
          : screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            if (index == 2) {
              _writeTap(context);
              return;
            }
            _selectedIndex = index;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: Sizes.size28),
        unselectedIconTheme: IconThemeData(size: Sizes.size28),
        selectedItemColor: Colors.black87,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade400,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: FaIcon(FontAwesomeIcons.house),
            activeIcon: FaIcon(FontAwesomeIcons.houseChimney),
            label: "",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            activeIcon: FaIcon(FontAwesomeIcons.magnifyingGlassPlus),
            label: "",
            tooltip: "Search",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: FaIcon(FontAwesomeIcons.squareThreads),
            label: "",
            tooltip: "write",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: FaIcon(FontAwesomeIcons.heart),
            activeIcon: FaIcon(FontAwesomeIcons.solidHeart),
            label: "",
            tooltip: "heart",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: FaIcon(FontAwesomeIcons.user),
            activeIcon: FaIcon(FontAwesomeIcons.solidUser),
            label: "",
            tooltip: "user",
          ),
        ],
      ),
    );
  }
}
