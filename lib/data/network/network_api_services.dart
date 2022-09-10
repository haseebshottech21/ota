import 'dart:convert';
import 'dart:io';
import 'package:ota/data/network/base_api_services.dart';
import 'package:ota/utils/app_url.dart';
import '../app_exceptions.dart';
import 'package:http/http.dart' as http;

class NetworkApiResponse extends BaseApiServices {
  static const int timeOutDuration = 10;

  // GET API
  @override
  Future getGetApiResponse(String url) async {
    var uri = Uri.parse(url);
    dynamic responseJson;

    try {
      final response = await http
          .get(
            uri,
            headers: await AppUrl().headerWithAuth(),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connetion! ');
    }

    return responseJson;
  }

  // POST API
  @override
  Future getPostApiResponse(String url, data) async {
    var uri = Uri.parse(url);
    dynamic responseJson;

    try {
      http.Response response = await http
          .post(
            uri,
            body: data,
            headers: await AppUrl().headerWithAuth(),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connetion ');
    }

    return responseJson;
  }

  // DELETE API
  @override
  Future getDeleteApiResponse(String url) async {
    var uri = Uri.parse(url);
    dynamic responseJson;

    try {
      final response = await http
          .delete(
            uri,
            headers: await AppUrl().headerWithAuth(),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connetion! ');
    }

    return responseJson;
  }

  // LOGOUT API
  @override
  Future getLogoutApiResponse(String url) async {
    var uri = Uri.parse(url);
    dynamic responseJson;

    try {
      final response = await http
          .get(
            uri,
            headers: await AppUrl().headerWithAuth(),
          )
          .timeout(const Duration(seconds: timeOutDuration));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connetion! ');
    }

    return responseJson;
  }

  //-------------------- ERROR STATUS CODE -------------------//

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400: // Bad Request
        throw BadRequestException(jsonDecode(response.body)['error']);
      case 401: // Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: // ForBidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 500: // Internet Server Error
      case 404: // Response Not Found
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      default:
        throw FetchDataException(
          'Something went wrong: ${response.statusCode.toString()}',
        );
    }
  }
}
