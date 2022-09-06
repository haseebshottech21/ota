import 'package:ota/model/category.dart';

class ProjectModel {
  final String projectId;
  final String projectName;
  final String projectSummary;
  final String leadId;
  final String projectStatus;
  final CategoryModel? categoryModel;

  // <---Project Status--->
  // 1=brief
  // 2=propsal
  // 3=setup stage
  // 4=in progress
  // 5=initial dilevry
  // 6=testing
  // 7=final delivery

  ProjectModel({
    required this.projectId,
    required this.projectName,
    required this.projectSummary,
    required this.leadId,
    required this.projectStatus,
    this.categoryModel,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      projectId: json['id'].toString(),
      projectName: json['project_name'],
      projectSummary: json['project_summary'],
      leadId: json['lead_id'].toString(),
      projectStatus: json['status'].toString(),
      categoryModel: CategoryModel.fromJson(
        json['type'],
      ),
    );
  }
}
