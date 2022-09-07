import 'package:flutter/material.dart';
import 'package:ota/model/category_model.dart';
import '../data/response/api_response.dart';
import '../repo/categories_repository.dart';

class CategoriesViewModel with ChangeNotifier {
  final _categoryRepo = CategoryRepository();

  ApiResponse<CategoryListModel> categoryList = ApiResponse.loading();

  // GET ALL CATEGORIES
  setProjectList(ApiResponse<CategoryListModel> response) {
    categoryList = response;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> fetchCategoriesListApi() async {
    setProjectList(ApiResponse.loading());
    _categoryRepo.fetchCategoryList().then((value) {
      setProjectList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProjectList(ApiResponse.error(error.toString()));
    });
  }
}
