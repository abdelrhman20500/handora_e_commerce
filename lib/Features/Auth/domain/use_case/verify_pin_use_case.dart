import 'package:handora_e_commerce/Features/Auth/data/model/verify_pin_model.dart';
import 'package:handora_e_commerce/Features/Auth/domain/repo/auth_repo.dart';

class VerifyPinUseCase{
  final AuthRepo authRepo;
  VerifyPinUseCase(this.authRepo);
  Future<VerifyPinModel> call({required String code,  required String email})async{
    return await authRepo.verificationCode(code: code, email: email);
  }
}