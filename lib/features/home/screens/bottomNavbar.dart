import 'package:crm_app/features/chats/screens/chatsHome.dart';
import 'package:crm_app/features/home/screens/activityScreen.dart';
import 'package:crm_app/features/home/screens/homeScreen.dart';
import 'package:crm_app/features/home/screens/profileScreen.dart';
import 'package:crm_app/features/notes/screens/notesScreen.dart';
import 'package:crm_app/features/schedule/screens/schedule.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Color> colors = [Colors.yellow, Colors.red, Colors.green, Colors.blue, Colors.pink];
  late int currentPage;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    currentPage = 0;

    tabController.addListener(() {
      setState(() {
        currentPage = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5 ? Colors.black : Colors.white;

    return Scaffold(
      body: BottomBar(
        child: TabBar(
          indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: tabController,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  color: currentPage == 0
                      ? colors[0]
                      : currentPage == 1
                      ? colors[1]
                      : currentPage == 2
                      ? colors[2]
                      : currentPage == 3
                      ? colors[3]
                      : currentPage == 4
                      ? colors[4]
                      : unselectedColor,
                  width: 4),
              insets: EdgeInsets.fromLTRB(16, 0, 16, 8)),
          tabs: [
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                  child: Icon(
                    Icons.home,
                    color: currentPage == 0 ? colors[0] : unselectedColor,
                  )),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                  child: Icon(
                    Icons.search,
                    color: currentPage == 1 ? colors[1] : unselectedColor,
                  )),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                  child: Icon(
                    Icons.add,
                    color: currentPage == 2 ? colors[2] : unselectedColor,
                  )),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                  child: Icon(
                    Icons.favorite,
                    color: currentPage == 3 ? colors[3] : unselectedColor,
                  )),
            ),
            SizedBox(
              height: 55,
              width: 40,
              child: Center(
                  child: Icon(
                    Icons.settings,
                    color: currentPage == 4 ? colors[4] : unselectedColor,
                  )),
            ),
          ],
        ),
        fit: StackFit.expand,
        icon: (width, height) => Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: null,
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: unselectedColor,
              size: width,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(500),
        duration: Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.8,
        barColor: colors[currentPage].computeLuminance() > 0.5 ? Colors.black : Colors.white,
        start: 2,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 35,
        iconWidth: 35,
        reverse: false,
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: [
            HomeScreen(),
            NotesScreen(),
            ScheduleScreen(),
            ActivityScreen(),
            ChatHome(),
            ProfileScreen(),

            SimplePage(color: Colors.blue), // Replace with another screen
            SimplePage(color: Colors.pink), // Replace with another screen
          ],
        ),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final Color color;

  SimplePage({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Page',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
