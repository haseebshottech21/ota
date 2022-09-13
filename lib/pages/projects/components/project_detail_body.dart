import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ota/view_model/project_view_model.dart';
import '../../../widgets/common/cached_image.dart';

class ProjectDetailBody extends StatelessWidget {
  final ProjectViewModel projectViewModel;
  const ProjectDetailBody({
    required this.projectViewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar.medium(
        //   automaticallyImplyLeading: true,
        //   title: const Text(
        //     'App Bar',
        //     // style: TextStyle(color: Colors.white),
        //   ),
        // ),
        SliverAppBar(
          pinned: true,
          // floating: true,
          // iconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
          // actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
          backgroundColor: const Color(0xFF221c49).withOpacity(0.9),
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(10),
          //     bottomRight: Radius.circular(10),
          //   ),
          // ),
          automaticallyImplyLeading: true,
          title: Container(
            padding: const EdgeInsets.all(6.0),
            // decoration: BoxDecoration(
            //     // color: Colors.black.withOpacity(0.2),
            //     // borderRadius: BorderRadius.circular(16),
            //     ),
            child: const Text(
              'Project Detail',
              // style: TextStyle(fontSize: 16.0),
            ),
          ),
          elevation: 0,
          expandedHeight: 200,
          flexibleSpace: Stack(
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              FlexibleSpaceBar(
                background: Image.network(
                  'https://images.unsplash.com/photo-1572177812156-58036aae439c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvamVjdHxlbnwwfHwwfHw%3D&w=1000&q=80',
                  fit: BoxFit.cover,
                  // height: constraints.maxHeight * 0.50,
                  // width: MediaQuery.of(context).size.width * 0.50,
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.network(
                //   'https://images.unsplash.com/photo-1572177812156-58036aae439c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvamVjdHxlbnwwfHwwfHw%3D&w=1000&q=80',
                //   fit: BoxFit.cover,
                //   // height: constraints.maxHeight * 0.50,
                //   height: MediaQuery.of(context).size.height * 0.30,
                //   width: double.infinity,
                // ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 6, top: 8),
                  child: Text(
                    // 'MOBILE APP BIZHUB',
                    projectViewModel.projectDetail.data!.projectName
                        .toString()
                        .toUpperCase(),
                    style: GoogleFonts.openSans(
                      color: const Color(0xFF3c7cbc),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: const BoxDecoration(
                    // color: const Color(0xFF3c7cbc).withOpacity(0.7),
                    // borderRadius: BorderRadius.circular(16.0),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF08a7dc),
                        Color(0xFF1393d0),
                      ],
                    ),
                  ),
                  child: Text(
                    projectViewModel.projectDetail.data!.category.typeName
                        .toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            projectDate(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              title: 'Start Date',
                              date: '15 MAY, 2021',
                              context: context,
                            ),
                            // const SizedBox(width: 20),
                            projectDate(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              title: 'Deadline Date',
                              date: '15 JUL, 2021',
                              context: context,
                            ),
                            // const CircularProgressPercent(totalpercent: 55),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      projectDetail(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        title: 'Description',
                        // desc:
                        //     'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                        desc: projectViewModel
                            .projectDetail.data!.projectSummary
                            .toString(),
                        context: context,
                      ),
                      // const SizedBox(height: 25),
                      // Text(
                      //   'Assign Project',
                      //   style: TextStyle(
                      //     color: Theme.of(context).textTheme.headline1!.color,
                      //     // color: Color(0xFF50182c),
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      // const SizedBox(height: 15),
                      // assignDetail(
                      //   name: 'Abdul Rafay',
                      //   designation: 'Sr. Wordpress Developer',
                      //   context: context,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

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
          // 'Start Date',
          title,
          style: TextStyle(
            color: Colors.grey[500],
            // color: Color(0xFF50182c),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
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

  Column projectDetail({
    required CrossAxisAlignment crossAxisAlignment,
    required String title,
    required String desc,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline1!.color,
            // color: Color(0xFF50182c),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          desc,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline2!.color,
            // color: Color(0xFF50182c),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget assignDetail({
    required String name,
    required String designation,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CachedImageWidget(
          height: 60,
          width: 60,
          radius: 10,
          imgUrl:
              'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: theme.textTheme.headline1!.color,
                // color: Color(0xFF50182c),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              designation,
              style: TextStyle(
                color: theme.textTheme.headline1!.color,
                // color: Color(0xFF50182c),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
