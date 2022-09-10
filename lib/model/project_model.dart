import 'category_model.dart';

class ProjectListModel {
  late List<Project> project;

  ProjectListModel({required this.project});

  ProjectListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      project = <Project>[];
      json['data'].forEach((v) {
        project.add(Project.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = project.map((v) => v.toJson()).toList();
    return data;
  }
}

// class ProjectDetail {
//   late Project project;
//   String? message;
//   int? statusCode;
//   bool? status;

//   ProjectDetail({
//     required this.project,
//     this.message,
//     this.statusCode,
//     this.status,
//   });

//   ProjectDetail.fromJson(Map<String, dynamic> json) {
//     project = Project.fromJson(json['data']);
//     message = json['message'];
//     statusCode = json['status_code'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['data'] = project.toJson();
//     data['message'] = message;
//     data['status_code'] = statusCode;
//     data['status'] = status;
//     return data;
//   }
// }

class Project {
  late String id;
  late String projectName;
  late String projectSummary;
  late String createdAt;
  late String deadlineTime;
  late Category category;

  Project({
    required this.id,
    required this.projectName,
    required this.projectSummary,
    required this.createdAt,
    required this.deadlineTime,
    required this.category,
  });

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    projectName = json['project_name'];
    projectSummary = json['project_summary'];
    deadlineTime = json['deadline_time'];
    createdAt = json['created_at'];
    category = (json['type'] != null ? Category.fromJson(json['type']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_name'] = projectName;
    data['project_summary'] = projectSummary;
    data['deadline_time'] = deadlineTime;
    data['created_at'] = createdAt;
    data['type'] = category.toJson();

    return data;
  }
}
