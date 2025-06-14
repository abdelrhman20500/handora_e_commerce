import 'package:handora_e_commerce/Features/Auth/data/model/login_model.dart';
import 'package:handora_e_commerce/Features/Auth/domain/repo/auth_repo.dart';

class AuthUseCase{
  final AuthRepo authRepo;
  AuthUseCase(this.authRepo);
  Future<LoginModel> call({required String email,required String password}) async {
    return await authRepo.userLogin(email: email, password: password);
  }
}