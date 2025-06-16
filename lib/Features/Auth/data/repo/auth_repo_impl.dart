import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/forget_password_model.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/login_model.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/new_password_model.dart';
import 'package:handora_e_commerce/Features/Auth/data/model/verify_pin_model.dart';
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

  @override
  Future<LoginModel> userRegister(RegisterParameters parameters)async{
    final response = await apiService.post("Account/register", parameters.data);
    if(response.statusCode ==200){
      final loginModel = LoginModel.fromJson(response.data);
      return loginModel;
    }else{
      throw Exception('Failed to login'); // Handle error appropriately
    }
  }

  @override
  Future<ForgetPasswordModel> forgetPassword({required String email})async{
  final response= await apiService.post("Account/send_reset_code", {
    "email": email,
  });
  if(response.statusCode ==200){
    final forgetPassword= ForgetPasswordModel.fromJson(response.data);
    return forgetPassword;
  }else{
    throw Exception('Failed to forget Password'); // Handle error appropriately
  }
  }

  @override
  Future<VerifyPinModel> verificationCode({required String code, required String email})async{
    final response= await apiService.post("Account/verify_pin/$email", {
      "pin": code,
    });
    if(response.statusCode ==200){
      final verifyPinModel= VerifyPinModel.fromJson(response.data);
      // print("####");
      // print(verifyPinModel.message);
      return verifyPinModel;
    }else{
      throw Exception('Failed Verify Code'); // Handle error appropriately
    }
  }

  @override
  Future<UpdatePasswordModel> update({required String email, required String newPassword,
    required String confirmPassword})async{
    final response= await apiService.post("Account/forget_password/$email",{
      "confirmNewPassword": confirmPassword,
      "newPassword": newPassword
    });
    if(response.statusCode ==200){
      final updatePasswordModel= UpdatePasswordModel.fromJson(response.data);
      print("####");
      print(updatePasswordModel.message);
      return updatePasswordModel;
    }else{
      throw Exception('Failed Verify Code'); // Handle error appropriately
    }
  }
}