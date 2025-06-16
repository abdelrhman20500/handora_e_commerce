import 'package:handora_e_commerce/Features/Auth/data/model/new_password_model.dart';

import '../repo/auth_repo.dart';

class UpdatePasswordUseCase {
  final AuthRepo authRepo;
  UpdatePasswordUseCase(this.authRepo);
  Future<UpdatePasswordModel> call(
      {required String newPassword,
      required String confirmPassword,
      required String email}) async {
    return await authRepo.update(
        email: email,
        newPassword: newPassword,
        confirmPassword: confirmPassword);
  }
}
