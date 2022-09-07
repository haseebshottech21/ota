// import 'package:ota/model/category.dart';

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
  late String leadId;
  late String deadlineTime;
  late String createdAt;

  Project({
    required this.id,
    required this.projectName,
    required this.projectSummary,
    required this.leadId,
    required this.deadlineTime,
    required this.createdAt,
  });

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    projectName = json['project_name'];
    projectSummary = json['project_summary'];
    // projectFiles = json['project_files'];
    leadId = json['lead_id'].toString();
    // projectCatId = json['project_cat_id'];
    // developmentStatusId = json['development_status_id'];
    // projectPriority = json['project_priority'];
    // price = json['price'];
    // status = json['status'];
    deadlineTime = json['deadline_time'];
    // createdBy = json['created_by'] != null
    //     ?  CreatedBy.fromJson(json['created_by'])
    //     : null;
    // updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // category =
    //     json['type'] != null ? CategoryModel.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_name'] = projectName;
    data['project_summary'] = projectSummary;
    // data['project_files'] = projectFiles;
    data['lead_id'] = leadId;
    // data['project_cat_id'] = projectCatId;
    // data['development_status_id'] = developmentStatusId;
    // data['project_priority'] = projectPriority;
    // data['price'] = price;
    // data['status'] = status;
    data['deadline_time'] = deadlineTime;
    // if (createdBy != null) {
    //   data['created_by'] = createdBy!.toJson();
    // }
    // data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    // data['updated_at'] = updatedAt;
    // if (category != null) {
    //   data['type'] = category;
    // }
    return data;
  }
}
