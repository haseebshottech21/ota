import 'package:flutter/material.dart';

enum SlideDirection { fromTop, fromLeft, fromRight, fromBottom }

class SlideAnimation extends StatefulWidget {
  final int postion;
  final int itemcount;
  final Widget child;
  final SlideDirection slideDirection;
  final AnimationController animationController;
  const SlideAnimation({
    required this.postion,
    required this.itemcount,
    required this.child,
    required this.slideDirection,
    required this.animationController,
    Key? key,
  }) : super(key: key);

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> {
  @override
  Widget build(BuildContext context) {
    var _xTranslation = 0.0, _yTranslation = 0.0;
    var _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval((1 / widget.itemcount) * widget.postion, 1.0,
            curve: Curves.fastOutSlowIn),
      ),
    );

    widget.animationController.forward();
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        if (widget.slideDirection == SlideDirection.fromTop) {
          // this will animate items from top with fade transition
          _yTranslation = -50 * (1.0 - _animation.value);
        } else if (widget.slideDirection == SlideDirection.fromBottom) {
          // this will animate items from bottom with fade transition
          _yTranslation = 50 * (1.0 - _animation.value);
        } else if (widget.slideDirection == SlideDirection.fromRight) {
          // this will animate items from right with fade transition
          _xTranslation = 100 * (1.0 - _animation.value);
        } else {
          // this will animate items from left with fade transition
          _xTranslation = -100 * (1.0 - _animation.value);
        }

        return FadeTransition(
          opacity: _animation,
          child: Transform(
            child: widget.child,
            transform:
                Matrix4.translationValues(_xTranslation, _yTranslation, 0.0),
          ),
        );
      },
    );
  }
}
