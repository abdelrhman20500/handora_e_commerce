import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/update_password_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/update_password_cubit/update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState>{
  UpdatePasswordCubit(this.updatePasswordUseCase):super(UpdatePasswordInitial());
  final UpdatePasswordUseCase updatePasswordUseCase;

  Future<void> updatePassword(String newPassword,String confirmPassword, String email) async {
    emit(UpdatePasswordLoading());
    try {
      final result = await updatePasswordUseCase.call(
          newPassword: newPassword,
          confirmPassword: confirmPassword,
          email: email);
      emit(UpdatePasswordSuccess(updatePasswordModel: result));
    } catch (e) {
      emit(UpdatePasswordFailure(e.toString()));
    }
  }
}