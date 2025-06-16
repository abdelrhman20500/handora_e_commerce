import 'package:equatable/equatable.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/forget_password_model.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/login_model.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/verify_pin_model.dart';
import '../../data/model/new_password_model.dart';

abstract class AuthRepo {
  Future<LoginModel> userLogin({required String email, required String password});
  Future<LoginModel> userRegister(RegisterParameters parameters);
  Future<ForgetPasswordModel> forgetPassword({required String email});
  Future<VerifyPinModel> verificationCode({required String code,required String email,});
  Future<UpdatePasswordModel> update({
    required String email,
    required String newPassword,
    required String confirmPassword});
}

class RegisterParameters extends Equatable {
  final Map<String, dynamic> data;

  const RegisterParameters(this.data);

  @override
  List<Object?> get props => [
    data,
  ];
}