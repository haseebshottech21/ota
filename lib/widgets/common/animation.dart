import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  final String imgUrl;
  final double imgHeight;
  final BoxFit fit;
  final int dutrationSeconds;
  const MyAnimation({
    Key? key,
    required this.imgUrl,
    required this.imgHeight,
    this.fit = BoxFit.cover,
    this.dutrationSeconds = 60,
  }) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: widget.dutrationSeconds),
  )..repeat();

  // late Animation base =
  //     CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  // late Animation inverted = Tween<double>(begin: 0.0, end: -1.0);

  // late final Animation<Offset> _animation = Tween<Offset>(
  //   begin: Offset.zero,
  //   end: const Offset(0, 0),
  // ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  // .animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
      child: Container(
        height: widget.imgHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.imgUrl),
            fit: widget.fit,
          ),
        ),
      ),
    );
  }
}
