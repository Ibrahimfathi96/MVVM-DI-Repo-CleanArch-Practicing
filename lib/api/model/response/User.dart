/// name : "Ahmed Abd Al-Muti"
/// email : "nabil1@route.com"
/// phone : "01234567801"
/// password : "$2a$12$Wp7A2bycw/orhD/vdlR9HeU3s0j7nNtdtidlLdOs4uRVwu5eDW3rm"
/// role : "user"
/// _id : "63cd78f9c57ec80280491b4d"
/// createdAt : "2023-01-22T17:57:13.885Z"
/// updatedAt : "2023-01-22T17:57:13.885Z"
/// __v : 0

class User {
  User({
      this.name, 
      this.email, 
      this.phone, 
      this.password, 
      this.role, 
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? name;
  String? email;
  String? phone;
  String? password;
  String? role;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['role'] = role;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}