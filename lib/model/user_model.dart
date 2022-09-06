class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? address;
  final String? gender;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.address,
    this.gender,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      gender: json['gender'],
      avatar: json['avatar'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['token'] = token;
  //   data['user']['name'] = userName;
  //   // if (this.user != null) {
  //   //   data['user'] = this.user!.toJson();
  //   // }
  //   return data;
  // }
}
