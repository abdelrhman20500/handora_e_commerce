import 'package:handora_e_commerce/Features/Auth/data/model/login_model.dart';

abstract class AuthRepo {
  Future<LoginModel> userLogin({required String email, required String password});
}
