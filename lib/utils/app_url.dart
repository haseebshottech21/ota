import 'package:ota/utils/shared_prefrence.dart';

class AppUrl {
  final prefrences = Prefrences();
  // static var baseUrl = 'https://reqres.in';
  static var baseUrl = 'http://10.0.0.39:125';
  static const imageBaseUrl = 'https://bizhub.ai/storage/app/public/';
  static var movieBaseUrl =
      'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io';

  static var getUserEndPoint = baseUrl + '/api/users';
  // Auth
  static var loginEndPoint = baseUrl + '/api/login';
  static var registerEndPoint = baseUrl + '/api/register';
  static var updateProfileEndPoint = baseUrl + '/api/update-user';
  static var resetPasswordEndPoint = baseUrl + '/api/reset-password';
  static var logoutEndPoint = baseUrl + '/api/logout';

  // Projects
  static var categoriesEndPoint = baseUrl + '/api/categories';
  static var moviesListEndPoint = movieBaseUrl + '/movies_list';
  static var projectsEndPoint = baseUrl + '/api/projects';

  // Leads
  static var subLeadsEndPoint = baseUrl + '/api/sub-leads';

  static const Map<String, String> header = {
    'Accept': 'application/json',
    // 'Content-Type': 'application/json'
  };

  // static Future<Map<String, String>> headerWithAuth() async {
  //   return {
  //     'Accept': 'application/json',
  //     'Authorization':
  //         'Bearer ${await prefrences.getSharedPreferenceValue('token')}'
  //   };
  // }

  Future<Map<String, String>> headerWithAuth() async {
    return {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await prefrences.getSharedPreferenceValue('token')}'
    };
  }
}
