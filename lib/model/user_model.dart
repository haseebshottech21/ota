class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? leadCountry;
  String? leadState;
  String? leadCity;
  int? role;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.leadCountry,
    this.leadState,
    this.leadCity,
    this.role,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    leadCountry = json['lead_country'];
    leadState = json['lead_state'];
    leadCity = json['lead_city'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['lead_country'] = leadCountry;
    data['lead_state'] = leadState;
    data['lead_city'] = leadCity;
    data['role'] = role;
    return data;
  }

  // Data(
  //     {this.id,
  //     this.name,
  //     this.email,
  //     this.phone,
  //     this.address,
  //     this.leadCountry,
  //     this.leadState,
  //     this.leadCity,
  //     this.role});

  // final String id;
  // final String name;
  // final String email;
  // final String phone;
  // final String? address;
  // final String? gender;
  // final String? avatar;

  // UserModel({
  //   required this.id,
  //   required this.name,
  //   required this.email,
  //   required this.phone,
  //   this.address,
  //   this.gender,
  //   this.avatar,
  // });

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json['id'],
  //     name: json['name'],
  //     email: json['email'],
  //     phone: json['phone'],
  //     address: json['address'],
  //     gender: json['gender'],
  //     avatar: json['avatar'],
  //   );
  // }

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
