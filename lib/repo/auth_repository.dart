import 'dart:convert';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../utils/app_url.dart';
import '../utils/shared_prefrence.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();
  final prefrences = Prefrences();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      print(response);
      // final responseLoaded = json.decode(response);
      setCrediential(response['data']);
      // yDBV5yP8
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      // print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> logoutApi() async {
    try {
      dynamic response =
          // final reesponse =
          await _apiServices.getLogoutApiResponse(AppUrl.logoutEndPoint);
      // print('res:  $reesponse');
      await removeCrediential();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setCrediential(dynamic loadedData) async {
    await prefrences.setSharedPreferenceValue('token', loadedData['token']);
  }

  Future<void> removeCrediential() async {
    await prefrences.removeSharedPreferenceValue('token');
  }
}
