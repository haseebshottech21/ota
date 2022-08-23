import 'package:flutter/material.dart';

class MyFadeIn extends StatefulWidget {
  final Widget child;
  final int durationSecond;
  const MyFadeIn({
    Key? key,
    required this.child,
    this.durationSecond = 5,
  }) : super(key: key);

  @override
  State<MyFadeIn> createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: widget.durationSecond),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
