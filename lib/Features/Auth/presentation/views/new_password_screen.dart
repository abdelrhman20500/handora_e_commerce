import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/update_password_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/update_password_cubit/update_password_cubit.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/update_password_cubit/update_password_state.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/login_screen.dart';
import '../../../../Core/utilis/app_color.dart';
import '../../../../Core/utilis/error_dialog.dart';
import '../../../../Core/utilis/loading_dialog.dart';
import '../../../../Core/utilis/success_dialog.dart';
import 'widgets/custom_text_button.dart';
import 'widgets/custom_text_field.dart';

class NewPasswordScreen extends StatelessWidget {
   NewPasswordScreen({super.key});

  static const String routeName ="NewPasswordScreen";
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back, color: AppColors.kBlackColor,)),
      ),
      body: BlocProvider(
        create: (context) => UpdatePasswordCubit(UpdatePasswordUseCase(AuthRepoImpl(apiService: ApiService(Dio(),),),),),
        child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
          listener: (context, state) {
            if (state is UpdatePasswordLoading) {
              // You can show a loading indicator or message here
              showLoadingDialog(context);
            } else if (state is UpdatePasswordFailure) {
              // print(state.errMessage);
              closeLoadingDialog(context);
              showErrorDialog(context, state.errMessage);
            } else if (state is UpdatePasswordSuccess) {
              closeLoadingDialog(context);
              showSuccessDialog(context, "UpDate Password Successfully");
              Navigator.pushNamed(context, LoginScreen.routeName);
            }
          },
          builder: (context, state) {
            return  Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height*0.1,),
                      const Align(
                          alignment: Alignment.center,
                          child: Text("New Password", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),)),
                      SizedBox(height:height*0.05,),
                      const Text("New Password :", style: TextStyle(color: AppColors.kGreyColor, fontSize: 20),),
                      SizedBox(height: height*0.03,),
                      CustomTextField(labelText: "new password", controller: newPasswordController,
                        keyboardType: TextInputType.text,suffixIcon: const Icon(Icons.remove_red_eye),),
                      SizedBox(height: height*0.03,),
                      const Text("Confirm Password :", style: TextStyle(color: AppColors.kGreyColor, fontSize: 20),),
                      SizedBox(height: height*0.03,),
                      CustomTextField(labelText: "confirm password",controller:confirmPasswordController,
                          keyboardType: TextInputType.text,suffixIcon: const Icon(Icons.remove_red_eye)),
                      SizedBox(height:height*0.1,),
                      Container(
                        height: height*0.07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: CustomTextButton(text: "Reset Password", color: AppColors.kWhiteColor,onTab: (){
                          if(formKey.currentState!.validate()){
                            BlocProvider.of<UpdatePasswordCubit>(context).updatePassword(
                                newPasswordController.text,
                                confirmPasswordController.text,
                                email);
                          }
                        },),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
