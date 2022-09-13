import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ota/model/leads_model.dart';
import 'package:ota/model/user_model.dart';
import 'package:ota/repo/lead_repository.dart';
import '../data/response/api_response.dart';
import '../utils/utils.dart';

class LeadsViewModel with ChangeNotifier {
  final _leadRepo = LeadRepository();

  ApiResponse<SubLeadsListModel> subLeadsList = ApiResponse.loading();
  ApiResponse<User> subLeadDetail = ApiResponse.loading();

  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    _loading = status;
    notifyListeners();
  }

  // CREATE SUB LEADS
  Future<void> createSubLeadApi(
    dynamic data,
    Function clearFields,
    BuildContext context,
  ) async {
    setLoad(true);
    _leadRepo.createSubLeads(data).then((value) {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) {
          setLoad(false);
          if (kDebugMode) {
            print(value.toString());
            clearFields();
            // Navigator.of(context).push(
            //   CustomPageRouter(
            //     child: const MyHome(),
            //     direction: AxisDirection.left,
            //   ),
            // );
            Navigator.of(context).pop();
            Utils.loadingFlushBarMessage(
              'Sub Lead create Successfully!',
              context,
              color: Colors.green,
            );

            // Navigator.of(context).pushNamedAndRemoveUntil(
            //   RouteName.home,
            //   (route) => false,
            // );
          }
        },
      );
      fetchSubLeadsListApi();
    }).onError((error, stackTrace) {
      setLoad(false);
      Utils.errorFlushBarMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

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

  // DELETE SUB LEADS
  Future<void> deleteSubLeadApi({
    required String leadId,
    required BuildContext context,
  }) async {
    setLoad(true);
    _leadRepo.deletSubLead(leadId: leadId).then((value) {
      Navigator.of(context).pop();
      Future.delayed(Duration.zero).then((value) {
        setLoad(false);
        fetchSubLeadsListApi();
        Utils.loadingFlushBarMessage(
          'Sub Lead delete Successfully!',
          context,
          color: Colors.green,
        );
      });
    }).onError((error, stackTrace) {
      setLoad(false);
      Utils.errorFlushBarMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
