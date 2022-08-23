import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  // String id;
  String title;
  IconData iconData;
  bool selected;

  CategoryProvider({
    required this.title,
    required this.iconData,
    required this.selected,
  });

  // factory CategoryProvider.fromJson(Map<String, dynamic> json) {
  //   return CategoryProvider(
  //     title: json['title'].toString(),
  //   );
  // }

  List projectCategories = [
    {
      CategoryProvider(
        title: 'DEVELOPMENT',
        iconData: Icons.desktop_mac_outlined,
        selected: false,
      ),
    },
    {
      CategoryProvider(
        title: 'DESIGN',
        iconData: Icons.design_services,
        selected: false,
      ),
    },
    {
      CategoryProvider(
        title: 'WORDPRESS',
        iconData: Icons.wordpress,
        selected: false,
      ),
    },
    {
      CategoryProvider(
        title: 'MOBILE APP',
        iconData: Icons.mobile_friendly_rounded,
        selected: false,
      ),
    },
    {
      CategoryProvider(
        title: 'VIDEO EDITING',
        iconData: Icons.video_camera_back_outlined,
        selected: false,
      ),
    },
  ];
}
