import 'package:handora_e_commerce/Features/Auth/data/model/forget_password_model.dart';
import 'package:handora_e_commerce/Features/Auth/domain/repo/auth_repo.dart';

class ForgetPasswordUseCase{
  final AuthRepo authRepo;
  ForgetPasswordUseCase(this.authRepo);
  Future<ForgetPasswordModel> call({required String email})async{
    return await authRepo.forgetPassword(email: email);
  }
}