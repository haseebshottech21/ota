import 'package:ota/model/user_model.dart';

class SubLeadsListModel {
  late List<User> subleads;

  SubLeadsListModel({required this.subleads});

  SubLeadsListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      subleads = <User>[];
      json['data'].forEach((v) {
        subleads.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = subleads.map((v) => v.toJson()).toList();
    return data;
  }
}
