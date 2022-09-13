import 'package:ota/model/user_model.dart';
// import 'package:ota/pages/leads/sub_leads.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/leads_model.dart';
import '../utils/app_url.dart';

class LeadRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<dynamic> createSubLeads(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.subLeadsEndPoint, data);
      // print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<SubLeadsListModel> fetchSubLeadList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.subLeadsEndPoint);
      return SubLeadsListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> fetchSubLeadDetail({required String leadId}) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.subLeadsEndPoint + '/$leadId');
      // print(response);
      return User.fromJson(response['data']);
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  Future<dynamic> deletSubLead({required String leadId}) async {
    try {
      dynamic response = await _apiServices
          .getDeleteApiResponse(AppUrl.subLeadsEndPoint + '/$leadId');
      print(response);
      return response;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }
}
