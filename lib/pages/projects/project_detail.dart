import 'package:flutter/material.dart';
import 'package:ota/data/response/status.dart';
import 'package:ota/pages/projects/components/project_detail_body.dart';
import 'package:ota/utils/icons.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import '../../view_model/project_view_model.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  Future<void> getProjectDetail() async {
    String projectId = ModalRoute.of(context)!.settings.arguments as String;

    final provider = Provider.of<ProjectViewModel>(context, listen: false);
    provider.fetchProjectDetailApi(projectId: projectId);
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   getProjectDetail();
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getProjectDetail();
    });
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   getProjectDetail();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final projectViewModel = context.watch<ProjectViewModel>();
    // print(projectViewModel.projectDetail.data!.projectName.toString());

    return Scaffold(
      bottomSheet: bottomWidget(context),
      body: Consumer<ProjectViewModel>(
        builder: (context, projectViewModel, _) {
          switch (projectViewModel.projectDetail.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              return Center(
                child: Text(projectViewModel.projectDetail.message.toString()),
              );
            case Status.COMPLETE:
              return ProjectDetailBody(projectViewModel: projectViewModel);
            default:
          }
          return Container();
        },
      ),
    );
  }

  Widget bottomWidget(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteName.projectComments);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 25.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
              colors: [
                Color(0xFF08a7dc),
                Color(0xFF1393d0),
              ],
              // stops: [0.1, 0.4],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'COMMENTS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(width: 15),
              Icon(
                chatSolid,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
