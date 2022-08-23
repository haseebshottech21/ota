import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ota/category_provider.dart';
import 'package:ota/widgets/dotted_border_button.dart';
// import 'package:ota/widgets/items/categories_item.dart';
import 'package:provider/provider.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  final List<dynamic> projectCategory = [
    {
      'title': 'DEVELOPMENT',
      'status': false,
      'icon': Icons.desktop_mac_outlined,
    },
    {
      'title': 'DESIGN',
      'status': false,
      'icon': Icons.design_services,
    },
    {
      'title': 'WORDPRESS',
      'status': false,
      'icon': Icons.wordpress,
    },
    {
      'title': 'MOBILE APP',
      'status': false,
      'icon': Icons.mobile_friendly_rounded,
    },
    {
      'title': 'VIDEO EDITING',
      'status': false,
      'icon': Icons.video_camera_back_outlined,
    },
  ];

  void todo(String name) {
    print(name);
    projectCategory.forEach(
      (e) {
        // print(e['title']);
        if (name == e['title']) {
          // print(category[category.indexOf(e)]);

          projectCategory[projectCategory.indexOf(e)]['status'] = true;
        } else if (name != e['title']) {
          projectCategory[projectCategory.indexOf(e)]['status'] = false;
        }
      },
    );
    setState(() {});
  }

  Future<List<Map<String, dynamic>>> selectImages() async {
    final images = await ImagePicker().pickMultiImage();
    List<Map<String, dynamic>> imageDetails = [];
    if (images != null) {
      for (var image in images) {
        Map<String, dynamic> imageDetail = {};
        imageDetail['extension'] = image.path.split('.').last;
        imageDetail['imagePath'] = image.path;
        imageDetail['image'] =
            base64Encode(await File(image.path).readAsBytes());
        imageDetails.add(imageDetail);
      }
    }
    return imageDetails;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create a project',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.clear, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          automaticallyImplyLeading: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 15),
              child: Text(
                'Post a new project',
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // const SizedBox(height: 10),
            InkWell(
              onTap: () {
                selectCategoryBottom(
                  context,
                  projectCategory,
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 12,
                  bottom: 12,
                  right: 20,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Project category*',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Consumer<CategoryProvider>(
                        //   builder: (context, projectCategory, _) {
                        //     return
                        Text(
                          'Add project category',
                          style: TextStyle(
                            color: Colors.blue.shade800,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //   },
                        // ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.blue.shade600,
                      size: 32,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
            ),
            projectSelectField(
              context: context,
              title: 'Project title*',
              detail: 'Add project title here',
              fieldHeight: 40,
              onTap: () {
                Navigator.of(context).pushNamed('/project-field');
              },
            ),
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
            ),
            projectSelectField(
              context: context,
              title: 'Project Detail*',
              detail: 'Add project detail here',
              fieldHeight: 80,
              onTap: () {
                Navigator.of(context).pushNamed('/project-field');
              },
            ),
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 12,
                left: 12,
                right: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Image*',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 150,
                    color: Colors.white,
                    child: DashedRect(
                      text: 'ADD YOUR IMAGE',
                      icons: Icons.add_photo_alternate,
                      color: Colors.black38,
                      strokeWidth: 1.5,
                      gap: 2.5,
                      onSelectImage: () {
                        // disputeViewModel.selectImages();
                        selectImages();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          height: MediaQuery.of(context).size.height * 0.10,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF3c7cbc),
                    minimumSize: Size(MediaQuery.of(context).size.width, 40),
                  ),
                  child: const Text('Post'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> selectCategoryBottom(
    BuildContext context,
    List projectCategoty,
  ) {
    return showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        // isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 12,
                      left: 12,
                      right: 12,
                    ),
                    child: Container(
                      height: 6,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(
                      projectCategory.length,
                      (index) {
                        return InkWell(
                          onTap: () {
                            setState(
                              () {
                                todo(projectCategory[index]['title']);
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 15),
                            child: Row(
                              children: [
                                Icon(projectCategory[index]['icon'],
                                    color: Theme.of(context).iconTheme.color,
                                    size: 25),
                                const SizedBox(width: 12),
                                Text(
                                  projectCategory[index]['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                projectCategory[index]['status']
                                    ? const Icon(Icons.check,
                                        color: Colors.green)
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          });
        });
  }

  InkWell projectSelectField({
    required BuildContext context,
    required String title,
    required String detail,
    required double fieldHeight,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              height: fieldHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    detail,
                    style: const TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomModelItem({
    required IconData icon,
    required String title,
    required Function() onPressed,
    // required bool status,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).iconTheme.color, size: 25),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.check, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
