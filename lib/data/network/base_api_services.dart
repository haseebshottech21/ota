abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future getDeleteApiResponse(String url);

  // LOGOUT
  Future getLogoutApiResponse(String url);
}
