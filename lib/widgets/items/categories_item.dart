import 'package:flutter/material.dart';
// import 'package:ota/model/category.dart';
import 'package:ota/widgets/common/animation_list.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../view_model/categories_view_model.dart';
// import 'package:google_fonts/google_fonts.dart';

class ProjectCategoriesItem extends StatefulWidget {
  // final List<Category> category;
  // final Function onPressed;
  const ProjectCategoriesItem({
    Key? key,
    // required this.category,
    // required this.onPressed,
  }) : super(key: key);

  @override
  State<ProjectCategoriesItem> createState() => _ProjectCategoriesItemState();
}

class _ProjectCategoriesItemState extends State<ProjectCategoriesItem>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  // late Animation<double> _animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    // _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<CategoriesViewModel>(builder: (context, value, _) {
      switch (value.categoryList.status) {
        case Status.LOADING:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case Status.ERROR:
          return Center(
            child: Text(value.categoryList.message.toString()),
          );
        case Status.COMPLETE:
          final category = value.categoryList.data!.category;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                category.length,
                (index) => SlideAnimation(
                  postion: index,
                  itemcount: category.length,
                  slideDirection: SlideDirection.fromRight,
                  animationController: animationController!,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      // color: Colors.yellow,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment .center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            // onTap: () => widget.onPressed(
                            //   widget.category[index]['title'],
                            // ),
                            child: Container(
                              // margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: kElevationToShadow[1],
                                // gradient: widget.category[index]['status'] == true
                                //     ? const LinearGradient(
                                //         begin: Alignment.topLeft,
                                //         end: Alignment.bottomRight,
                                //         stops: [0.1, 0.9],
                                //         colors: [
                                //           Color(0xFF72223F),
                                //           Color(0xFFCF4C7E),
                                //         ],
                                //       )
                                //     : null,
                              ),
                              child: const Icon(
                                // widget.category[index]['icon'],
                                Icons.desktop_mac_outlined,
                                color: Colors.black87,
                                size: 26,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category[index].typeName.toString(),
                            style: TextStyle(
                              color: theme.textTheme.headline1!.color,
                              // color: Color(0xFF50182c),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        default:
      }
      return Container();
    });
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}
