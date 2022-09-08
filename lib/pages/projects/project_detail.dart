import 'package:flutter/material.dart';
import 'package:ota/data/response/status.dart';
import 'package:ota/pages/projects/components/project_detail_body.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getProjectDetail();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final projectViewModel = context.watch<ProjectViewModel>();
    // print(projectViewModel.projectDetail.data!.projectName.toString());

    return Consumer<ProjectViewModel>(
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
            return Scaffold(
              body: ProjectDetailBody(projectViewModel: projectViewModel),
            );
          default:
        }
        return Container();
      },
    );
  }
}
