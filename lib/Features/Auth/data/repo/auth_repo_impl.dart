import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/login_model.dart';
import 'package:handora_e_commerce/Features/Auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<LoginModel> userLogin({required String email, required String password})async{
    final response = await apiService.post("Account/login", {
      "emailOrUserName": email,
      "password": password,
    });
   if(response.statusCode ==200){
     final loginModel = LoginModel.fromJson(response.data);
     return loginModel;
   }else{
     throw Exception('Failed to login'); // Handle error appropriately
   }
  }
}