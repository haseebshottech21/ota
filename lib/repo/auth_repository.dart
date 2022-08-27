import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../utils/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> logoutApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.logoutEndPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
