import 'package:flutter/material.dart';
import 'package:ota/model/project.dart';
import 'package:ota/repo/project_repository.dart';
import '../data/response/api_response.dart';

class ProjectViewModel with ChangeNotifier {
  final _projectRepo = ProjectRepository();

  ApiResponse<ProjectModel> projectList = ApiResponse.loading();
  ApiResponse<ProjectModel> projectDetail = ApiResponse.loading();

  // ALL PROJECTS
  setProjectList(ApiResponse<ProjectModel> response) {
    projectList = response;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> fetchProjectsListApi() async {
    setProjectList(ApiResponse.loading());
    _projectRepo.fetchProjects().then((value) {
      setProjectList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProjectList(ApiResponse.error(error.toString()));
    });
  }

  // SHOW PROJECT DETAIL
  setProjectDetail(ApiResponse<ProjectModel> response) {
    projectDetail = response;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> fetchProjectDetailApi() async {
    setProjectDetail(ApiResponse.loading());
    _projectRepo.fetchProjectsDetail(projectId: '1').then((value) {
      setProjectDetail(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProjectDetail(ApiResponse.error(error.toString()));
    });
  }
}
