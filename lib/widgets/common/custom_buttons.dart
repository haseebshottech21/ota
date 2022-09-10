import 'package:flutter/material.dart';
import '../../constants.dart';

class ButtonGradient extends StatelessWidget {
  final Widget widget;
  final VoidCallback? onPressed;
  final String? disbleBtnText;
  final bool buttonEable;
  const ButtonGradient({
    Key? key,
    this.buttonEable = false,
    this.disbleBtnText = '',
    required this.widget,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: buttonEable
          ? Container(
              // width: double.infinity,
              height: 50.0,
              // padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.7],
                  colors: [
                    Color(0xFFCF4C7E),
                    Color(0xFF72223F),
                  ],
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.shade500,
                //     offset: Offset(0.0, 1.5),
                //     blurRadius: 0,
                //   ),
                // ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onPressed,
                  child: Center(
                    child: widget,
                  ),
                ),
              ),
            )
          : SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  onSurface: const Color(0xFFbc5590),
                ),
                child: Text(
                  disbleBtnText!,
                  style: Constant.formButtonDisableStyle,
                ),
              ),
            ),
    );
  }
}

class PostButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback? onPressed;
  const PostButton({
    required this.widget,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: 45.0,
      // padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      decoration: BoxDecoration(
        color: const Color(0xFF3c7cbc),
        borderRadius: BorderRadius.circular(4.0),
        // gradient: const LinearGradient(
        //   // begin: Alignment.topLeft,
        //   // end: Alignment.bottomRight,
        //   // stops: [0.1, 0.7],
        //   colors: [
        //     Color(0xFF08a7dc),
        //     Color(0xFF1393d0),
        //   ],
        // ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade500,
        //     offset: Offset(0.0, 1.5),
        //     blurRadius: 0,
        //   ),
        // ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: widget,
          ),
        ),
      ),
    );
  }
}
