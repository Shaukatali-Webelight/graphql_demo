class CreateUserResModel {
  String? sTypename;
  CreateUser? createUser;

  CreateUserResModel({this.sTypename, this.createUser});

  CreateUserResModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    createUser = json['createUser'] != null ? CreateUser.fromJson(json['createUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    if (createUser != null) {
      data['createUser'] = createUser!.toJson();
    }
    return data;
  }
}

class CreateUser {
  String? sTypename;
  String? email;
  String? id;
  String? name;
  String? username;

  CreateUser({this.sTypename, this.email, this.id, this.name, this.username});

  CreateUser.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__typename'] = sTypename;
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    return data;
  }
}
