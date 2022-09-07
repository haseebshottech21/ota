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

  // Future<Project> fetchProjectsDetail({required String projectId}) async {
  //   try {
  //     dynamic response = await _apiServices
  //         .getGetApiResponse('http://10.0.0.39:125/api/projects/$projectId');
  //     return Project.fromJson(response);
  //   } catch (e) {
  //     print(e.toString());
  //     rethrow;
  //   }
  // }
}
