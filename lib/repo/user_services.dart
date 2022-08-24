import 'dart:io';
import 'package:ota/constants.dart';
import 'package:ota/repo/app_status.dart';
// import '../data/network/base_api_services.dart';
// import '../data/network/network_api_services.dart';
import '../utils/app_url.dart';
import 'package:http/http.dart' as http;

class UserServices {
  // final BaseApiServices _apiServices = NetworkApiResponse();

  static Future<Object> getUserApi() async {
    //   try {
    //     dynamic response =
    //         await _apiServices.getGetApiResponse(AppUrl.getUserEndPoint);
    //     return response;
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    try {
      var url = Uri.parse(AppUrl.getUserEndPoint);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(response: response.body);
      }
      return Failure(
          code: userInvalidResponse, errorResponse: 'Inavlid Response');
    } on HttpException {
      return Failure(code: noInternet, errorResponse: 'No Interner');
    } on FormatException {
      return Failure(code: invalidFormat, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: unknownError, errorResponse: 'Unkown Error');
    }
  }
}
