import '../../data/model/login_model.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase{
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<LoginModel> call(RegisterParameters parameters) async {
    return await authRepo.userRegister(parameters);
  }
}