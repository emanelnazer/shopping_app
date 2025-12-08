class RegisterRequestDto {
  String? name;
  String? email;
  String? password;
  String? avatar;

  RegisterRequestDto({this.name, this.email, this.password, this.avatar});

  RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['avatar'] = avatar;
    return data;
  }
}
