import 'package:flutter/material.dart';
import 'package:ota/model/category_model.dart';
import '../data/response/api_response.dart';
import '../repo/categories_repository.dart';

class CategoriesViewModel with ChangeNotifier {
  final _categoryRepo = CategoryRepository();
  String projectCatyId = '';
  String projectCatName = '';
  // String formattedDate = '';
  // TextEditingController projectTitleController = TextEditingController();
  // TextEditingController projectDetailController = TextEditingController();
  // DateTime selectedDate = DateTime.now();

  // selectTitleController(TextEditingController controller) {
  //   projectTitleController.text = controller.text;
  //   notifyListeners();
  // }

  // selectDetailController(TextEditingController controller) {
  //   projectDetailController.text = controller.text;
  //   notifyListeners();
  // }

  void selectCategoryId(String catId, String catName) {
    projectCatyId = catId;
    projectCatName = catName;
    notifyListeners();
  }

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     // setState(() {
  //     selectedDate = picked;
  //     formattedDate = DateFormat('dd-MM-yy').format(selectedDate);
  //     notifyListeners();
  //     // });
  //   }
  // }

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
