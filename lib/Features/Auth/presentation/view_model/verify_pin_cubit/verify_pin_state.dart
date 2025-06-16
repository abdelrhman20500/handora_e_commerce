import 'package:handora_e_commerce/Features/Auth/data/model/verify_pin_model.dart';

abstract class VerifyPinState {}

final class VerifyPinInitial extends VerifyPinState {}

final class VerifyPinLoading extends VerifyPinState {}

final class VerifyPinSuccess extends VerifyPinState {
  final VerifyPinModel verifyPinModel;

  VerifyPinSuccess({required this.verifyPinModel});
}

final class VerifyPinFailure extends VerifyPinState {
  final String errMessage;
  VerifyPinFailure(this.errMessage);
}
