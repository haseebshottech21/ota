import 'package:flutter/material.dart';
import '../../constants.dart';

class ButtonGradient extends StatelessWidget {
  final Widget widget;
  final VoidCallback? onPressed;
  final bool buttonEable;
  const ButtonGradient({
    Key? key,
    this.buttonEable = false,
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
                borderRadius: BorderRadius.circular(5),
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
                  primary: Colors.black,
                  onSurface: const Color(0xFFbc5590),
                ),
                child: Text(
                  'Log In',
                  style: Constant.formButtonDisableStyle,
                ),
              ),
            ),
    );
  }
}
