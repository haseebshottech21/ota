// import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ota/utils/routes/routes_name.dart';
// import 'package:ota/widgets/common/progress_percent.dart';
// import 'package:ota/widgets/common/fade_in_widget.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

class ProjectCardItem extends StatelessWidget {
  const ProjectCardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return LiveList(
    //   showItemInterval: const Duration(milliseconds: 100),
    //   showItemDuration: const Duration(milliseconds: 300),
    //   padding: const EdgeInsets.only(top: 0, bottom: 16),
    //   physics: const BouncingScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: 4,
    //   itemBuilder: _buildAnimatedItem,
    // );
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteName.projectDetail);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.32,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // double percent = 80.0;
              final theme = Theme.of(context);
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: constraints.maxHeight,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        left: 8,
                        right: 8,
                      ),
                      // color: Colors.black,
                      decoration: BoxDecoration(
                        // boxShadow: kElevationToShadow[2],
                        color: theme.primaryColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MOBILE APP BIZHUB',
                                      style: GoogleFonts.openSans(
                                        color: const Color(0xFF3c7cbc),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Project detail...',
                                      style: GoogleFonts.openSans(
                                        // color: Colors.black87,
                                        color: Colors.grey[800],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    // color: Colors.grey.withOpacity(0.6),
                                    // borderRadius: BorderRadius.circular(50),
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      // begin: Alignment.centerLeft,
                                      // end: Alignment.centerRight,
                                      // stops: [0.1, 0.9],
                                      colors: [
                                        Color(0xFF08a7dc),
                                        Color(0xFF1393d0),
                                      ],
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.desktop_mac_outlined,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                projectDate(
                                  context: context,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  title: 'Start Date',
                                  date: '15 MAY, 2021',
                                ),
                                projectDate(
                                  context: context,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  title: 'Deadline Date',
                                  date: '15 JUL, 2021',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Container(
                          //       width: MediaQuery.of(context).size.width * 0.70,
                          //       padding: const EdgeInsets.only(left: 2),
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'In Progress',
                          //             style: TextStyle(
                          //               color: Colors.grey[600],
                          //               // color: Color(0xFF50182c),
                          //               fontSize: 12,
                          //               fontWeight: FontWeight.w400,
                          //             ),
                          //           ),
                          //           const SizedBox(height: 6),
                          //           const LinearProgressPercent(
                          //               totalpercent: 55),
                          //         ],
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(top: 12),
                          //       child: Container(
                          //         height: 32,
                          //         width: 35,
                          //         decoration: BoxDecoration(
                          //           color: Color(0xFF3c7cbc),
                          //           borderRadius: BorderRadius.circular(5),
                          //           boxShadow: kElevationToShadow[2],
                          //         ),
                          //         child: const Icon(
                          //           Icons.arrow_forward_ios,
                          //           color: Colors.white,
                          //           size: 18,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1572177812156-58036aae439c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvamVjdHxlbnwwfHwwfHw%3D&w=1000&q=80',
                      fit: BoxFit.cover,
                      height: constraints.maxHeight * 0.50,
                      width: double.infinity,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget buildAnimatedItem(
  //   BuildContext context,
  //   int index,
  //   Animation<double> animation,
  // ) =>
  //     FadeTransition(
  //       opacity: Tween<double>(
  //         begin: 0,
  //         end: 1,
  //       ).animate(animation),
  //       child: SlideTransition(
  //         position: Tween<Offset>(
  //           begin: const Offset(0, -0.1),
  //           end: Offset.zero,
  //         ).animate(animation),
  //         child: GestureDetector(
  //           onTap: () {
  //             Navigator.pushNamed(context, '/project-detail');
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.only(bottom: 15),
  //             child: Container(
  //               height: MediaQuery.of(context).size.height * 0.33,
  //               width: double.infinity,
  //               decoration:
  //                   BoxDecoration(borderRadius: BorderRadius.circular(5)),
  //               child: LayoutBuilder(
  //                 builder: (context, constraints) {
  //                   // double percent = 80.0;
  //                   final theme = Theme.of(context);
  //                   return Stack(
  //                     children: [
  //                       Align(
  //                         alignment: Alignment.bottomCenter,
  //                         child: Container(
  //                           height: constraints.maxHeight * 0.60,
  //                           width: double.infinity,
  //                           padding: const EdgeInsets.only(
  //                             bottom: 8,
  //                             left: 8,
  //                             right: 8,
  //                           ),
  //                           // color: Colors.black,
  //                           decoration: BoxDecoration(
  //                             // boxShadow: kElevationToShadow[2],
  //                             color: theme.primaryColor,
  //                             borderRadius: const BorderRadius.only(
  //                               bottomLeft: Radius.circular(5),
  //                               bottomRight: Radius.circular(5),
  //                             ),
  //                           ),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             mainAxisAlignment: MainAxisAlignment.end,
  //                             children: [
  //                               MyFadeIn(
  //                                 child: Text(
  //                                   'MOBILE APP BIZHUB',
  //                                   style: GoogleFonts.openSans(
  //                                     color: const Color(0xFF3c7cbc),
  //                                     fontSize: 18,
  //                                     fontWeight: FontWeight.w700,
  //                                   ),
  //                                 ),
  //                               ),
  //                               const SizedBox(height: 5),
  //                               Padding(
  //                                 padding:
  //                                     const EdgeInsets.symmetric(horizontal: 2),
  //                                 child: Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     projectDate(
  //                                       context: context,
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       title: 'Start Date',
  //                                       date: '15 MAY, 2021',
  //                                     ),
  //                                     projectDate(
  //                                       context: context,
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.end,
  //                                       title: 'Deadline Date',
  //                                       date: '15 JUL, 2021',
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                               const SizedBox(height: 5),
  //                               Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Container(
  //                                     width: MediaQuery.of(context).size.width *
  //                                         0.70,
  //                                     padding: const EdgeInsets.only(left: 2),
  //                                     child: Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Text(
  //                                           'In Progress',
  //                                           style: TextStyle(
  //                                             color: Colors.grey[600],
  //                                             // color: Color(0xFF50182c),
  //                                             fontSize: 12,
  //                                             fontWeight: FontWeight.w400,
  //                                           ),
  //                                         ),
  //                                         const SizedBox(height: 6),
  //                                         const LinearProgressPercent(
  //                                             totalpercent: 55),
  //                                       ],
  //                                     ),
  //                                   ),
  //                                   Padding(
  //                                     padding: const EdgeInsets.only(top: 12),
  //                                     child: Container(
  //                                       height: 32,
  //                                       width: 35,
  //                                       decoration: BoxDecoration(
  //                                         color: Color(0xFF3c7cbc),
  //                                         borderRadius:
  //                                             BorderRadius.circular(5),
  //                                         boxShadow: kElevationToShadow[2],
  //                                       ),
  //                                       child: const Icon(
  //                                         Icons.arrow_forward_ios,
  //                                         color: Colors.white,
  //                                         size: 18,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       ClipRRect(
  //                         borderRadius: const BorderRadius.only(
  //                           topLeft: Radius.circular(5),
  //                           topRight: Radius.circular(5),
  //                         ),
  //                         child: Hero(
  //                           tag: 'heroImage$index',
  //                           child: Image.network(
  //                             'https://www.rc.virginia.edu/images/accord/project.png',
  //                             fit: BoxFit.cover,
  //                             height: constraints.maxHeight * 0.48,
  //                             width: double.infinity,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );

  Column projectDate({
    required CrossAxisAlignment crossAxisAlignment,
    required String title,
    required String date,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // 'Date',
          title,
          style: TextStyle(
            color: Colors.grey[600],
            // color: Color(0xFF50182c),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          // '15 May, 2021',
          date,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline1!.color,
            // color: Color(0xFF50182c),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
