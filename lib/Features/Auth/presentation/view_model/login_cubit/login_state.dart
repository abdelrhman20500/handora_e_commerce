import 'package:handora_e_commerce/Features/Auth/data/model/login_model.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  LoginSuccess({required this.loginModel});
}

final class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure(this.errMessage);
}
