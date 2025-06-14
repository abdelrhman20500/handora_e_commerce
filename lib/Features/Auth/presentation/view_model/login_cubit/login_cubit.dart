import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/auth_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthUseCase authUseCase;

  LoginCubit(this.authUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final result = await authUseCase.call(
        email: email,
        password: password,
      );
      emit(LoginSuccess(loginModel: result));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
