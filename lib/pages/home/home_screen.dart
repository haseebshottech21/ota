import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ota/pages/home/test_screen.dart';
// import 'package:ota/pages/home/test_screen.dart';
import 'package:ota/pages/profile/profile_screen.dart';
import 'package:ota/pages/projects/my_projects.dart';

import '../../utils/icons.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController myPage = PageController(initialPage: 0);
  int bottomNavBarCurrentIndex = 0;

  toggleCurrentIndex(int index) {
    bottomNavBarCurrentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'f1',
        elevation: 4.0,

        // label: const Text('Add a task'),
        onPressed: () {
          Navigator.of(context).pushNamed('/create');
        },
        backgroundColor: const Color(0xFF3c7cbc),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        color: Theme.of(context).bottomAppBarColor,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              bottomItem(
                index: 0,
                icon: bottomNavBarCurrentIndex == 0
                    ? dashboadSolid
                    : dashboadOutline,
                onPressed: () {
                  toggleCurrentIndex(0);
                  myPage.jumpToPage(0);
                },
              ),
              bottomItem(
                index: 1,
                icon: bottomNavBarCurrentIndex == 1
                    ? scheduleSolid
                    : scheduleOuline,
                onPressed: () {
                  toggleCurrentIndex(1);
                  myPage.jumpToPage(1);
                },
              ),
              const SizedBox(width: 20),
              bottomItem(
                index: 2,
                icon: searchOutline,
                onPressed: () {
                  toggleCurrentIndex(2);
                  myPage.jumpToPage(2);
                },
              ),
              bottomItem(
                index: 3,
                icon: bottomNavBarCurrentIndex == 3
                    ? profileSolid
                    : profileOutline,
                onPressed: () {
                  toggleCurrentIndex(3);
                  myPage.jumpToPage(3);
                },
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: myPage,
        onPageChanged: (int int) {
          print('Page Changes to index $int');
        },
        children: const <Widget>[
          MovieScreen(),
          MyProjects(),
          MyProjects(),
          ProfileScreen(),
        ],
        physics:
            const NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
    );
  }

  Widget bottomItem({
    required int index,
    required IconData icon,
    required dynamic onPressed,
  }) {
    return InkWell(
      onTap: () {
        onPressed;
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          border: bottomNavBarCurrentIndex == index
              ? const Border(
                  top: BorderSide(
                    width: 3.0,
                    color: Color(0xFF3c7cbc),
                  ),
                )
              : null,
        ),
        child: IconButton(
          icon: FadeInDown(
            from: bottomNavBarCurrentIndex == index ? 5 : 0,
            duration: const Duration(milliseconds: 300),
            child: Icon(
              icon,
              color: bottomNavBarCurrentIndex == index
                  ? Theme.of(context).iconTheme.color
                  : Colors.grey,
              size: bottomNavBarCurrentIndex == index ? 26 : 23,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
