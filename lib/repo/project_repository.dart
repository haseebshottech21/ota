import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/project_model.dart';
import '../utils/app_url.dart';

class ProjectRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<ProjectListModel> fetchProjectsList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.projectsEndPoint);
      return ProjectListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Project> fetchProjectsDetail({required String projectId}) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.projectsEndPoint + '/$projectId');
      // print(response);
      return Project.fromJson(response['data']);
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  Future<dynamic> createProject(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.projectsEndPoint, data);
      // print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
