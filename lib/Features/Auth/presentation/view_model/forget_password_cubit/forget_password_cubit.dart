import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/forget_password_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/forget_password_cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState>{
  ForgetPasswordCubit(this.forgetPasswordUseCase): super(ForgetPasswordInitial());

  final ForgetPasswordUseCase forgetPasswordUseCase;
  Future<void> resetPassword(String email) async {
    emit(ForgetPasswordLoading());
    try {
      final result = await forgetPasswordUseCase.call(
        email: email,
      );
      emit(ForgetPasswordSuccess(forgetPasswordModel: result));
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString()));
    }
  }
}