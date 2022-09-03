class UserModel {
  String? token;
  String? userName;
  // User? user;

  UserModel({this.token, this.userName});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    token = json['user']['name'];
    // user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user']['name'] = userName;
    // if (this.user != null) {
    //   data['user'] = this.user!.toJson();
    // }
    return data;
  }
}
