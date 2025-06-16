import 'package:handora_e_commerce/Features/Auth/data/model/new_password_model.dart';

abstract class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdatePasswordLoading extends UpdatePasswordState {}

final class UpdatePasswordSuccess extends UpdatePasswordState {
  final UpdatePasswordModel updatePasswordModel;

  UpdatePasswordSuccess({required this.updatePasswordModel});
}

final class UpdatePasswordFailure extends UpdatePasswordState {
  final String errMessage;
  UpdatePasswordFailure(this.errMessage);
}
