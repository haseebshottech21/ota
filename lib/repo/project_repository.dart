import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/project.dart';
import '../utils/app_url.dart';

class ProjectRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<ProjectModel> fetchProjects() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.projectsEndPoint);
      return ProjectModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ProjectModel> fetchProjectsDetail({required String projectId}) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.projectsEndPoint + '/$projectId');
      return ProjectModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
