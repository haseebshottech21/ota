import 'package:flutter/material.dart';

Widget topbar(BuildContext context, String text) {
  final theme = Theme.of(context);
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: theme.elevatedButtonTheme.style,
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: theme.iconTheme.color,
              size: 18,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 50, width: 50)
        ],
      ),
    ),
  );
}
