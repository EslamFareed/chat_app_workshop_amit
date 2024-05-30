class UserModel {
  String? email;
  String? name;
  String? password;
  String? profile;
  String? phone;

  UserModel({this.email, this.name, this.password, this.profile, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    profile = json['profile'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['profile'] = this.profile;
    data['phone'] = this.phone;
    return data;
  }
}
