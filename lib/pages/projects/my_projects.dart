import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ota/view_model/home_view_model.dart';
import 'package:ota/widgets/common/cached_image.dart';
import 'package:ota/widgets/common/fade_in_widget.dart';
import 'package:provider/provider.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/items/categories_item.dart';
import '../../widgets/items/project_card_item.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final List category = [
    {
      'title': 'DEVELOPMENT',
      'status': true,
      'icon': Icons.desktop_mac_outlined,
    },
    {
      'title': 'DESIGN',
      'status': false,
      'icon': Icons.design_services,
    },
    {
      'title': 'WORDPRESS',
      'status': false,
      'icon': Icons.wordpress,
    },
    {
      'title': 'MOBILE APP',
      'status': false,
      'icon': Icons.mobile_friendly_rounded,
    },
    {
      'title': 'VIDEO EDITING',
      'status': false,
      'icon': Icons.video_camera_back_outlined,
    },
  ];
  void todo(String name) {
    // print(name);
    for (var e in category) {
      // print(e['title']);
      if (name == e['title']) {
        // print(category[category.indexOf(e)]);

        category[category.indexOf(e)]['status'] = true;
      } else if (name != e['title']) {
        category[category.indexOf(e)]['status'] = false;
      }
    }
    setState(() {});
  }

  // toggleCategory(int index) {
  //   category[index] = index;
  //   setState(() {});
  // }

  getData() {
    final sp = context.read<AuthViewModel>();
    sp.getDataFromSharedPrefrence();
    sp.greeting();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
  }

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = context.watch<AuthViewModel>();
    // final home = context.watch<HomeViewModel>();

    // print(home.timeNow);

    return Scaffold(
      // backgroundColor: Colors.white,
      body: MyFadeIn(
        durationSecond: 2,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hey ${auth.name}',
                            style: TextStyle(
                              color: theme.textTheme.headline1!.color,
                              // color: Color(0xFF50182c),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${auth.message} !!',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              // color: Color(0xFF50182c),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      CachedImageWidget(
                        height: 45,
                        width: 45,
                        radius: 10,
                        imgUrl: auth.imageUrl.toString(),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  subTitles(subTitile: 'Categories'),
                  const SizedBox(height: 15),
                  ProjectCategoriesItem(
                    category: category,
                    onPressed: todo,
                  ),

                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: List.generate(
                  //       category.length,
                  //       (index) => SlideAnimation(
                  //         postion: index,
                  //         itemcount: category.length,
                  //         slideDirection: SlideDirection.fromRight,
                  //         animationController: _controller,
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 0),
                  //           child: Container(
                  //             margin: const EdgeInsets.only(right: 22),
                  //             // color: Colors.yellow,
                  //             child: Column(
                  //               // mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //                 GestureDetector(
                  //                   onTap: () => {
                  //                     category[index]['title'],
                  //                   },

                  //                   // onTap: () {
                  //                   //   // print(isActive);
                  //                   //   // setState(() {
                  //                   //   //   isActive = !isActive;
                  //                   //   //   if (isActive) {
                  //                   //   //     widget.category[index]['status'] = false;
                  //                   //   //   } else if (!isActive) {
                  //                   //   //     widget.category[index]['status'] = true;
                  //                   //   //   }
                  //                   //   // });
                  //                   // },
                  //                   child: Container(
                  //                     // margin: const EdgeInsets.only(right: 20),
                  //                     padding: const EdgeInsets.symmetric(
                  //                       horizontal: 12,
                  //                       vertical: 12,
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.grey[100],
                  //                       borderRadius: BorderRadius.circular(50),
                  //                       gradient:
                  //                           category[index]['status'] == true
                  //                               ? const LinearGradient(
                  //                                   begin: Alignment.topLeft,
                  //                                   end: Alignment.bottomRight,
                  //                                   stops: [0.1, 0.9],
                  //                                   colors: [
                  //                                     Color(0xFF72223F),
                  //                                     Color(0xFFCF4C7E),
                  //                                   ],
                  //                                 )
                  //                               : null,
                  //                     ),
                  //                     child: Icon(
                  //                       category[index]['icon'],
                  //                       color: category[index]['status'] == true
                  //                           ? Colors.white
                  //                           : Colors.black87,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 const SizedBox(height: 8),
                  //                 Text(
                  //                   category[index]['title'],
                  //                   style: TextStyle(
                  //                     color: theme.textTheme.headline1!.color,
                  //                     // color: Color(0xFF50182c),
                  //                     fontSize: 10,
                  //                     fontWeight: FontWeight.w500,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {
                  //         print(isActive);
                  //         setState(() {
                  //           isActive = !isActive;
                  //           if (isActive) {
                  //             category[0]['status'] = false;
                  //           } else if (!isActive) {
                  //             category[0]['status'] = true;
                  //           }
                  //         });
                  //       },
                  //       child: Container(
                  //         color: isActive ? Colors.lightBlue : null,
                  //         child: Text(
                  //           category[0]['title'],
                  //         ),
                  //       ),
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         setState(() {
                  //           isActive = !isActive;
                  //           // ? category[1]['status'] = true
                  //           // : category[1]['status'] = false;
                  //         });
                  //         print(isActive);
                  //       },
                  //       child: Container(
                  //         color: category[1]['status'] ? Colors.lightBlue : null,
                  //         child: Text(
                  //           category[1]['title'],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 25),
                  subTitles(subTitile: 'My Projects'),
                  const SizedBox(height: 15),
                  // const ProjectCardItem(),
                  ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const ProjectCardItem();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row subTitles({
    required String subTitile,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subTitile,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline1!.color,
            // color: Color(0xFF50182c),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'VIEW ALL',
          style: GoogleFonts.openSans(
            color: const Color(0xFF0aa5db),
            // color: Color(0xFF50182c),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
