import 'package:flutter/material.dart';
import 'package:ota/model/project_model.dart';
import 'package:ota/repo/project_repository.dart';
import '../data/response/api_response.dart';

class ProjectViewModel with ChangeNotifier {
  final _projectRepo = ProjectRepository();

  ApiResponse<ProjectListModel> projectList = ApiResponse.loading();
  ApiResponse<Project> projectDetail = ApiResponse.loading();
  // Project get selectProject => _selectProject;

  // ALL PROJECTS
  setProjectList(ApiResponse<ProjectListModel> response) {
    projectList = response;
    // print(projectList.data!.project!.length);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> fetchProjectsListApi() async {
    setProjectList(ApiResponse.loading());
    _projectRepo.fetchProjectsList().then((value) {
      setProjectList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProjectList(ApiResponse.error(error.toString()));
    });
  }

  // SHOW PROJECT DETAIL
  setProjectDetail(ApiResponse<Project> response) {
    projectDetail = response;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
    // print('detail :  ' + projectDetail.data!.projectName);
  }

  Future<void> fetchProjectDetailApi({
    required String projectId,
  }) async {
    // setLoad(true);
    // var response = await _projectRepo.fetchProjectsDetail(projectId: projectId);
    // print(response);
    // setProjectDetail(response);

    setProjectDetail(ApiResponse.loading());
    _projectRepo.fetchProjectsDetail(projectId: projectId).then((value) {
      setProjectDetail(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProjectDetail(ApiResponse.error(error.toString()));
    });
  }
}
