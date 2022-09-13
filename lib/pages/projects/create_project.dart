import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ota/pages/projects/components/create_project_body.dart';
import 'package:ota/view_model/categories_view_model.dart';
import 'package:ota/view_model/project_view_model.dart';
import 'package:ota/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({Key? key}) : super(key: key);

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  // final titleController = TextEditingController();
  // final detailController = TextEditingController();

  // clear() {
  //   final cat = Provider.of<CategoriesViewModel>(context, listen: false);
  //   cat.projectTitleController.clear();
  //   cat.projectDetailController.clear();
  // }

  // final List<dynamic> projectCategory = [
  //   {
  //     'title': 'DEVELOPMENT',
  //     'status': false,
  //     'icon': Icons.desktop_mac_outlined,
  //   },
  //   {
  //     'title': 'DESIGN',
  //     'status': false,
  //     'icon': Icons.design_services,
  //   },
  //   {
  //     'title': 'WORDPRESS',
  //     'status': false,
  //     'icon': Icons.wordpress,
  //   },
  //   {
  //     'title': 'MOBILE APP',
  //     'status': false,
  //     'icon': Icons.mobile_friendly_rounded,
  //   },
  //   {
  //     'title': 'VIDEO EDITING',
  //     'status': false,
  //     'icon': Icons.video_camera_back_outlined,
  //   },
  // ];

  // void todo(String name) {
  //   // print(name);
  //   for (var e in projectCategory) {
  //     // print(e['title']);
  //     if (name == e['title']) {
  //       // print(category[category.indexOf(e)]);

  //       projectCategory[projectCategory.indexOf(e)]['status'] = true;
  //     } else if (name != e['title']) {
  //       projectCategory[projectCategory.indexOf(e)]['status'] = false;
  //     }
  //   }
  //   setState(() {});
  // }

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
    final category = context.watch<CategoriesViewModel>();
    // final project = context.watch<ProjectViewModel>();
    return Scaffold(
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
            context.read<ProjectViewModel>().fieldsClear();
          },
        ),
        automaticallyImplyLeading: true,
      ),
      body: const CreateProjectBody(),
      bottomSheet: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 24.0),
          decoration: const BoxDecoration(
            color: MyColors.whiteColor,
            // border: Border(
            //   top: BorderSide(
            //     color: Colors.black54,
            //     width: 0.2,
            //   ),
            // ),
          ),
          child: Consumer<ProjectViewModel>(
            builder: (context, projectViewModel, _) {
              return PostButton(
                widget: projectViewModel.loading
                    ? const CupertinoActivityIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        'POST',
                        style: Constant.formButtonStyle,
                      ),
                onPressed: projectViewModel.loading
                    ? null
                    : () {
                        if (projectViewModel
                            .projectTitleController.text.isEmpty) {
                          Utils.errorFlushBarMessage(
                            'Please add project title',
                            context,
                          );
                        } else if (projectViewModel
                            .projectDetailController.text.isEmpty) {
                          Utils.errorFlushBarMessage(
                            'Please add project detail',
                            context,
                          );
                        } else {
                          Map data = {
                            "project_cat_id": category.projectCatyId,
                            "project_name":
                                projectViewModel.projectTitleController.text,
                            "project_summary":
                                projectViewModel.projectDetailController.text,
                            "deadline_time":
                                projectViewModel.selectedDate.toString(),
                          };
                          // print(data);
                          projectViewModel.createProjectApi(
                            data,
                            context,
                          );
                        }
                      },
              );
            },
            //   ),
            // ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('dispose method');
    super.dispose();
  }
}
