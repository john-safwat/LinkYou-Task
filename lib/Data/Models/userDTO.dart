import 'package:linkyou_task/Domain/Models/MyUser.dart';

class UserDTO {
  UserDTO({
    num? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    _id = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _avatar = avatar;
  }

  UserDTO.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }

  num? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;

  num? get id => _id;

  String? get email => _email;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['avatar'] = _avatar;
    return map;
  }

  MyUser toDomain() {
    return MyUser(
        avatar: _avatar,
        email: _email,
        firstName: _firstName,
        id: _id,
        lastName: _lastName);
  }
}
