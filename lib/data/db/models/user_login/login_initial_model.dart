import 'package:cegid_app/domain/entities/user_login/login_initial.dart';

class LoginInitialModel extends LoginInitial{

  LoginInitialModel({
    String? user,
    String? pass,
    String? cif,
  }) : super(
          user: user,
          pass: pass,
          cif: cif,
        );

  factory LoginInitialModel.fromJson(Map<String, dynamic> json) =>
      LoginInitialModel(
        user: json['usuario'],
        pass: json['contrasena'],
        cif: json['cif'],
      );

  Map<String, dynamic> toJson() => {
        'usuario': user,
        'contrasena': pass,
        'cif': cif,
      };

}