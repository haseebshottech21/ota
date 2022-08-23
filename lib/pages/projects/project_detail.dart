import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ota/widgets/common/cached_image.dart';
import 'package:ota/widgets/common/progress_percent.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  // double myProgress = 0.0;
  // double totalpercent = 95.0;
  // bool animation = false;

  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //     const Duration(milliseconds: 200),
  //   ).then((value) {
  //     setState(() {
  //       animation = true;
  //     });
  //   });
  // }

  // bool isPinned = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Center(
      //         child: Text(
      //           'Detail',
      //           style: GoogleFonts.openSans(
      //             color: Colors.black,
      //             // color: Color(0xFF50182c),
      //             fontSize: 18,
      //             fontWeight: FontWeight.w600,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 15),
      //       ClipRRect(
      //         borderRadius: const BorderRadius.only(
      //           topLeft: Radius.circular(5),
      //           topRight: Radius.circular(5),
      //         ),
      //         child: Hero(
      //           transitionOnUserGestures: true,
      //           tag: 'heroImage1',
      //           child: Image.network(
      //             'https://www.rc.virginia.edu/images/accord/project.png',
      //             fit: BoxFit.cover,
      //             height: MediaQuery.of(context).size.height * 0.25,
      //             width: double.infinity,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(height: 15),
      //       Text(
      //         'MOBILE APP BIZHUB',
      //         style: GoogleFonts.openSans(
      //           color: const Color(0xFF3c7cbc),
      //           fontSize: 18,
      //           fontWeight: FontWeight.w700,
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 2),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             projectDate(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               title: 'Start Date',
      //               date: '15 MAY, 2021',
      //             ),
      //             // const SizedBox(width: 20),
      //             projectDate(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               title: 'Deadline Date',
      //               date: '15 JUL, 2021',
      //             ),
      //             const CircularProgressPercent(totalpercent: 55),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 15),
      //       projectDetail(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         title: 'Description',
      //         desc:
      //             'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
      //       )
      //     ],
      //   ),
      // ),
      body: CustomScrollView(
        // primary: true,
        // shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            expandedHeight: 180,
            // backgroundColor: Theme.of(context).bottomAppBarColor,
            // leading: const Icon(
            //   Icons.arrow_back,
            //   // color: Theme.of(context).iconTheme.color,
            // ),
            // automaticallyImplyLeading: true,
            // leading: IconButton(
            //   icon: const Icon(Icons.arrow_back_ios),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: false,
              // title: Text('Detail'),
              // expandedTitleScale: 1,
              // stretchModes: const [
              //   StretchMode.blurBackground,
              // ],
              background: Hero(
                tag: 'heroImage1',
                child: Image.network(
                  'https://www.rc.virginia.edu/images/accord/project.png',
                  fit: BoxFit.cover,
                ),
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
                          ),
                          // const SizedBox(width: 20),
                          projectDate(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            title: 'Deadline Date',
                            date: '15 JUL, 2021',
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
                    )
                  ],
                ),
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       for (var i = 1; i < 20; i++)
          //         ListTile(
          //           leading: CircleAvatar(),
          //           title: Text(i.toString()),
          //         )
          //     ],
          //   ),
          // ),
        ],
      ),
      // bottomSheet: Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: 100,
      //   color: Colors.red,
      // ),
    );
  }

  Column projectDate({
    required CrossAxisAlignment crossAxisAlignment,
    required String title,
    required String date,
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
  }) {
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
                color: Theme.of(context).textTheme.headline1!.color,
                // color: Color(0xFF50182c),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              designation,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
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
