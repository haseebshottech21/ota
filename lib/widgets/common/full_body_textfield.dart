import 'package:flutter/material.dart';
import 'package:ota/view_model/project_view_model.dart';
import 'package:provider/provider.dart';
import '../../utils/icons.dart';

class ProjectTitleField extends StatelessWidget {
  final String? appBarTitle;
  final TextEditingController titleController;
  const ProjectTitleField({
    required this.titleController,
    this.appBarTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle!,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(cancel, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Consumer<ProjectViewModel>(
            builder: (context, projectViewModel, _) {
              return TextButton(
                onPressed: () {
                  projectViewModel.selectTitleController(titleController);
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              );
            },
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: TextField(
          // expands: true,
          minLines: null,
          maxLines: null,
          controller: titleController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Add skills and requirement you\'re looking for',
            contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectDetailField extends StatelessWidget {
  final String? appBarTitle;
  final TextEditingController detailController;
  const ProjectDetailField({
    required this.detailController,
    this.appBarTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle!,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(cancel, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Consumer<ProjectViewModel>(
            builder: (context, projectViewModel, _) {
              return TextButton(
                onPressed: () {
                  projectViewModel.selectDetailController(detailController);
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              );
            },
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: TextField(
          // expands: true,
          minLines: null,
          maxLines: null,
          controller: detailController,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Add skills and requirement you\'re looking for',
            contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
