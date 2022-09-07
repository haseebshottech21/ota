import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ota/widgets/common/cached_image.dart';
import 'package:ota/widgets/common/progress_percent.dart';

class ProjectDetail extends StatelessWidget {
  const ProjectDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://www.rc.virginia.edu/images/accord/project.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'MOBILE APP BIZHUB',
                      // project.projectDetail.data!.projectName.toString(),

                      style: GoogleFonts.openSans(
                        color: const Color(0xFF3c7cbc),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
                          const CircularProgressPercent(totalpercent: 55),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    projectDetail(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      title: 'Description',
                      desc:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                      context: context,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Assign Project',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline1!.color,
                        // color: Color(0xFF50182c),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    assignDetail(
                      name: 'Abdul Rafay',
                      designation: 'Sr. Wordpress Developer',
                      context: context,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
