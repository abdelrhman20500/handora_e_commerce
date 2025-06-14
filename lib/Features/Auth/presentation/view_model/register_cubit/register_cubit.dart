import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/register_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/register_cubit/register_state.dart';

import '../../../domain/repo/auth_repo.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit(this.registerUseCase): super(RegisterInitial());
  final RegisterUseCase registerUseCase;

  Future<void> userRegister(String email, String password, String confirmPassword,
      String phoneNumber, String userName, String displayName)async{
    emit(RegisterLoading());
    final parameters = RegisterParameters({
      "confirmPassword": confirmPassword,
      "displayName": displayName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "userName": userName
    });
    try {
      final result = await registerUseCase.call(parameters);
      emit(RegisterSuccess(model: result));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }

  }
}