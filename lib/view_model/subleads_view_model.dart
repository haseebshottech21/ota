import 'package:flutter/material.dart';
import 'package:ota/model/leads_model.dart';
import 'package:ota/model/user_model.dart';
import 'package:ota/repo/lead_repository.dart';
import '../data/response/api_response.dart';

class LeadsViewModel with ChangeNotifier {
  final _leadRepo = LeadRepository();

  ApiResponse<SubLeadsListModel> subLeadsList = ApiResponse.loading();
  ApiResponse<User> subLeadDetail = ApiResponse.loading();

  // ALL SUB LEADS
  setSubLeadsList(ApiResponse<SubLeadsListModel> response) {
    subLeadsList = response;
    // print(projectList.data!.project!.length);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> fetchSubLeadsListApi() async {
    setSubLeadsList(ApiResponse.loading());
    _leadRepo.fetchSubLeadList().then((value) {
      setSubLeadsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSubLeadsList(ApiResponse.error(error.toString()));
    });
  }

  // SHOW SUB LEADS
  setSubLeadDetail(ApiResponse<User> response) {
    subLeadDetail = response;
    // print(projectList.data!.project!.length);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> fetchSubLeadDetailApi({
    required String leadId,
  }) async {
    setSubLeadDetail(ApiResponse.loading());
    _leadRepo.fetchSubLeadDetail(leadId: leadId).then((value) {
      setSubLeadDetail(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSubLeadDetail(ApiResponse.error(error.toString()));
    });
  }
}
