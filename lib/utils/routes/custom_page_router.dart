import 'package:flutter/material.dart';

class CustomPageRouter extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  final int milisecond;

  CustomPageRouter({
    required this.child,
    this.direction = AxisDirection.right,
    this.milisecond = 300,
    RouteSettings? settings,
  }) : super(
          transitionDuration: Duration(milliseconds: milisecond),
          reverseTransitionDuration: Duration(milliseconds: milisecond),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBeignOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  Offset getBeignOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}
