import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/verify_pin_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/verify_pin_cubit/verify_pin_state.dart';

class VerifyPinCubit extends Cubit<VerifyPinState> {
  VerifyPinCubit(this.verifyPinUseCase) : super(VerifyPinInitial());

  final VerifyPinUseCase verifyPinUseCase;
  Future<void> verifyCode(String code, String email) async {
    emit(VerifyPinLoading());
    try {
      final result = await verifyPinUseCase.call(
        code: code,
        email: email,
      );
      emit(VerifyPinSuccess(verifyPinModel: result));
    } catch (e) {
      emit(VerifyPinFailure(e.toString()));
    }
  }
}
