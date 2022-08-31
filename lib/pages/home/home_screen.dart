import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ota/pages/home/test_screen.dart';
import 'package:ota/pages/profile/profile_screen.dart';
import 'package:ota/pages/projects/my_projects.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import '../../utils/icons.dart';
import '../../view_model/bottom_view_model.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'f1',
        elevation: 4.0,
        // label: const Text('Add a task'),
        onPressed: () {
          Navigator.of(context).pushNamed(RouteName.createProject);
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
                icon: provider.currentIndex == 0
                    ? dashboadSolid
                    : dashboadOutline,
                onPressed: () {
                  provider.toggleCurrentIndex(0);
                  myPage.jumpToPage(0);
                },
              ),
              bottomItem(
                index: 1,
                icon:
                    provider.currentIndex == 1 ? scheduleSolid : scheduleOuline,
                onPressed: () {
                  provider.toggleCurrentIndex(1);
                  myPage.jumpToPage(1);
                },
              ),
              const SizedBox(width: 20),
              bottomItem(
                index: 2,
                icon: searchOutline,
                onPressed: () {
                  provider.toggleCurrentIndex(2);
                  myPage.jumpToPage(2);
                },
              ),
              bottomItem(
                index: 3,
                icon:
                    provider.currentIndex == 3 ? profileSolid : profileOutline,
                onPressed: () {
                  provider.toggleCurrentIndex(3);
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
    var provider = Provider.of<BottomViewModel>(context);
    return InkWell(
      onTap: () {
        onPressed;
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          border: provider.currentIndex == index
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
            from: provider.currentIndex == index ? 5 : 0,
            duration: const Duration(milliseconds: 300),
            child: Icon(
              icon,
              color: provider.currentIndex == index
                  ? Theme.of(context).iconTheme.color
                  : Colors.grey,
              size: provider.currentIndex == index ? 26 : 23,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
