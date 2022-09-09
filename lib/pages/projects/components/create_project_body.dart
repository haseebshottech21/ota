import 'package:flutter/material.dart';
import 'package:ota/utils/icons.dart';
import 'package:ota/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../data/response/status.dart';
import '../../../view_model/categories_view_model.dart';
import '../../../view_model/project_view_model.dart';
import '../../../widgets/common/full_body_textfield.dart';

class CreateProjectBody extends StatelessWidget {
  const CreateProjectBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProjectViewModel>();
    return SingleChildScrollView(
      child: Column(
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
          const SizedBox(height: 5),
          Consumer<CategoriesViewModel>(builder: (context, value, _) {
            switch (value.categoryList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.ERROR:
                return Center(
                  child: Text(value.categoryList.message.toString()),
                );
              case Status.COMPLETE:
                final category = value.categoryList.data!.category;
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15.0),
                        ),
                      ),
                      builder: (context) {
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
                                  category.length,
                                  (index) {
                                    return InkWell(
                                      onTap: () {
                                        value.selectCategoryId(
                                          category[index].id,
                                          category[index].typeName,
                                        );
                                        // categoryId = category[index].id;
                                        Navigator.of(context).pop();
                                        // print('cat: ' + categoryId);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 15),
                                        child: Row(
                                          children: [
                                            Icon(Icons.desktop_mac,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                                size: 25),
                                            const SizedBox(width: 12),
                                            Text(
                                              // projectCategory[index]['title'],
                                              category[index].typeName,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            // const Spacer(),
                                            // projectCategory[index]['status']
                                            //     ? const Icon(Icons.check,
                                            //         color: Colors.green)
                                            //     : const SizedBox(),
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
                      },
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
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              value.projectCatName == ''
                                  ? 'Add project category'
                                  : value.projectCatName,
                              style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          add,
                          color: Colors.blue.shade600,
                          size: 32,
                        ),
                      ],
                    ),
                  ),
                );

              default:
            }
            return Container();
          }),
          Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          ),
          // projectSelectField(
          //   context: context,
          //   title: 'Project title*',
          //   detail: 'Add project title here',
          //   fieldHeight: 40,
          //   onTap: () {
          //     Navigator.of(context).pushNamed(RouteName.projectField);
          //   },
          // ),
          projectSelectField(
            context: context,
            title: 'Project title*',
            detail: viewModel.projectTitleController.text.isEmpty
                ? 'Add project title here'
                : viewModel.projectTitleController.text,
            color: viewModel.projectTitleController.text.isEmpty
                ? Colors.grey
                : Colors.black,
            fieldHeight: 40,
            onTap: () {
              // Navigator.of(context).pushNamed(RouteName.projectField);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectTitleField(
                    appBarTitle: 'Add project title',
                    titleController: viewModel.projectTitleController,
                  ),
                ),
              ).then((value) {
                if (value != null) {
                  viewModel.projectTitleController.text = value;
                }
              });
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
            detail: viewModel.projectDetailController.text.isEmpty
                ? 'Add project detail here'
                : viewModel.projectDetailController.text,
            color: viewModel.projectDetailController.text.isEmpty
                ? Colors.grey
                : Colors.black,
            fieldHeight: 80,
            onTap: () {
              // Navigator.of(context).pushNamed(RouteName.projectField);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetailField(
                    appBarTitle: 'Add project detail',
                    detailController: viewModel.projectDetailController,
                  ),
                ),
              ).then((value) {
                if (value != null) {
                  viewModel.projectDetailController.text = value;
                }
              });
            },
          ),
          Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          ),
          projectSelectField(
            context: context,
            title: 'Project Deadline*',
            // detail: 'Select deadline date',
            // detail: viewModel.formattedDate,
            detail: viewModel.formattedDate.isEmpty
                ? 'Select deadline date'
                : Utils().dateFormat(viewModel.formattedDate),
            color: viewModel.formattedDate.isEmpty ? Colors.grey : Colors.black,
            fieldHeight: 40,
            onTap: () => viewModel.selectDate(context),
          ),
          // Container(
          //   height: 0.5,
          //   width: MediaQuery.of(context).size.width,
          //   color: Colors.black12,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 8,
          //     bottom: 12,
          //     left: 12,
          //     right: 12,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Add Image*',
          //         style: TextStyle(
          //           color: Theme.of(context).textTheme.bodyText1!.color,
          //           fontSize: 15,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       const SizedBox(height: 8),
          //       Container(
          //         height: 150,
          //         color: Colors.white,
          //         child: DashedRect(
          //           text: 'ADD YOUR IMAGE',
          //           icons: Icons.add_photo_alternate,
          //           color: Colors.black38,
          //           strokeWidth: 1.5,
          //           gap: 2.5,
          //           onSelectImage: () {
          //             // disputeViewModel.selectImages();
          //             // selectImages();
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget projectSelectField({
    required BuildContext context,
    required String title,
    required String detail,
    required double fieldHeight,
    required Function() onTap,
    Color? color = Colors.grey,
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
                    style: TextStyle(
                      color: color,
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
}
