import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/category_model.dart';
import '../utils/app_url.dart';

class CategoryRepository {
  final BaseApiServices _apiServices = NetworkApiResponse();

  Future<CategoryListModel> fetchCategoryList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.categoriesEndPoint);

      // print("CATEGORY $response");
      final jsonData = CategoryListModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}
