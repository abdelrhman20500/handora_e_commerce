import 'package:handora_e_commerce/Features/Auth/data/model/login_model.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final LoginModel model;

  RegisterSuccess({required this.model});
}

final class RegisterFailure extends RegisterState {
  final String errMessage;
  RegisterFailure(this.errMessage);
}
