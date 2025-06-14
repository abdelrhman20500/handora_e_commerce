import 'package:equatable/equatable.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/login_model.dart';

abstract class AuthRepo {
  Future<LoginModel> userLogin({required String email, required String password});
  Future<LoginModel> userRegister(RegisterParameters parameters);
}

class RegisterParameters extends Equatable {
  final Map<String, dynamic> data;

  const RegisterParameters(this.data);

  @override
  List<Object?> get props => [
    data,
  ];
}