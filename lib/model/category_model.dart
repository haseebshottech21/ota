// class CategoryModel {
//   final String categoryId;
//   final String categoryName;

//   CategoryModel({
//     required this.categoryId,
//     required this.categoryName,
//   });

//   factory CategoryModel.fromJson(Map<String, dynamic> json) {
//     return CategoryModel(
//       categoryId: json['id'],
//       categoryName: json['type_name'],
//     );
//   }
// }

// class CategoryListModel {
//   List<Category>? category;
//   String? message;
//   int? statusCode;
//   bool? status;

//   CategoryListModel({
//     this.category,
//     this.message,
//     this.statusCode,
//     this.status,
//   });

//   CategoryListModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       category = <Category>[];
//       json['data'].forEach((v) {
//         category!.add(Category.fromJson(v));
//       });
//     }
//     message = json['message'];
//     statusCode = json['status_code'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (category != null) {
//       data['data'] = category!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = message;
//     data['status_code'] = statusCode;
//     data['status'] = status;
//     return data;
//   }
// }

// class Category {
//   int? id;
//   String? typeName;
//   int? status;
//   String? createdAt;
//   String? updatedAt;

//   Category({
//     this.id,
//     this.typeName,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     typeName = json['type_name'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['type_name'] = typeName;
//     data['status'] = status;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

class CategoryListModel {
  late List<Category> category;

  CategoryListModel({required this.category});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      category = <Category>[];
      json['data'].forEach((v) {
        category.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = category.map((v) => v.toJson()).toList();
    return data;
  }
}

class Category {
  late String id;
  late String typeName;
  // late String status;
  // late String createdAt;
  // late String updatedAt;

  Category({
    required this.id,
    required this.typeName,
    // required this.status,
    // required this.createdAt,
    // required this.updatedAt,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    typeName = json['type_name'];
    // status = json['status'];
    // createdAt = json['created_at'].toString();
    // updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type_name'] = typeName;
    // data['status'] = status;
    // data['created_at'] = createdAt;
    // data['updated_at'] = updatedAt;
    return data;
  }
}
