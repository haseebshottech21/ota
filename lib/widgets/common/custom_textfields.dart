import 'package:flutter/material.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/icons.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final double? fontSize;
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? node;
  void Function(String)? onFieldSubmitted;
  final bool passwordField;
  bool obscureText;

  CustomTextField({
    Key? key,
    this.fontSize = 15.0,
    this.obscureText = true,
    this.passwordField = false,
    this.onFieldSubmitted,
    this.node,
    required this.icon,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;

  togglePassword() {
    passwordVisible = !passwordVisible;
    widget.obscureText = !widget.obscureText;
    setState(() {});
  }

  // FocusNode node = FocusNode();

  @override
  void initState() {
    widget.node!.addListener(() {
      setState(() {});
    });

    // focusNodes.forEach((node) {

    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: theme.textTheme.subtitle1,
        obscureText: widget.passwordField ? widget.obscureText : false,
        focusNode: widget.node,
        cursorColor: MyColors.mainColor,
        // cursorWidth: 1.5,
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.inputDecorationTheme.fillColor,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(
            widget.icon,
            color: widget.node!.hasFocus
                ? MyColors.mainColor
                : theme.inputDecorationTheme.prefixIconColor,
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4.0),
          ),
          suffixIcon: widget.passwordField
              ? GestureDetector(
                  onTap: togglePassword,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      passwordVisible ? showPassword : hidePassword,
                      color: widget.node!.hasFocus
                          ? MyColors.mainColor
                          : Colors.grey[400],
                    ),
                  ),
                )
              : null,
        ),
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
