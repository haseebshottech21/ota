import 'package:flutter/material.dart';
import 'package:ota/widgets/common/animation_list.dart';
// import 'package:google_fonts/google_fonts.dart';

class ProjectCategoriesItem extends StatefulWidget {
  final List category;
  final Function onPressed;
  const ProjectCategoriesItem({
    Key? key,
    required this.category,
    required this.onPressed,
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          widget.category.length,
          (index) => SlideAnimation(
            postion: index,
            itemcount: widget.category.length,
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
                      onTap: () => widget.onPressed(
                        widget.category[index]['title'],
                      ),
                      child: Container(
                        // margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(50),
                          gradient: widget.category[index]['status'] == true
                              ? const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.1, 0.9],
                                  colors: [
                                    Color(0xFF72223F),
                                    Color(0xFFCF4C7E),
                                  ],
                                )
                              : null,
                        ),
                        child: Icon(
                          widget.category[index]['icon'],
                          color: widget.category[index]['status'] == true
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.category[index]['title'],
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
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}
