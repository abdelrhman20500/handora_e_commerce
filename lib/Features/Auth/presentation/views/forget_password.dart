import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Core/utilis/app_color.dart';
import 'package:handora_e_commerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/forget_password_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/forget_password_cubit/forget_password_state.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/verify_pin_screen.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_button.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_field.dart';

import '../../../../Core/utilis/error_dialog.dart';
import '../../../../Core/utilis/loading_dialog.dart';
import '../../../../Core/utilis/success_dialog.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});

  static const String routeName= "ForgetPassword";
  final TextEditingController emailController = TextEditingController();
  final  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(ForgetPasswordUseCase(AuthRepoImpl(
        apiService: ApiService(Dio(),),),),),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if(state is ForgetPasswordLoading){
            // You can show a loading indicator or message here
            showLoadingDialog(context);
          }else if(state is ForgetPasswordFailure){
            closeLoadingDialog(context);
            showErrorDialog(context, "try Later!!");
          }else if(state is ForgetPasswordSuccess){
            closeLoadingDialog(context);
            showSuccessDialog(context, "Email Successfully");
            Navigator.pushNamed(context, VerifyPinScreen.routeName,arguments: emailController.text);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back, color: AppColors.kBlackColor,)),
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height*0.07,),
                      const Align(
                          alignment: Alignment.center,
                          child: Text("Send PIN Code", style: TextStyle(color: AppColors.kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold),)),
                      SizedBox(height: height*0.05,),
                      const Text("Email*", style: TextStyle(color: AppColors.kGreyColor, fontSize: 22),),
                      SizedBox(height: height*0.03,),
                      CustomTextField(labelText: "Enter Your Email",controller: emailController,),
                      SizedBox(height: height*0.03,),
                      Container(
                          height: height*0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: CustomTextButton(text: "Send  PIN code", color: AppColors.kWhiteColor,onTab: (){
                            if(formKey.currentState!.validate()){
                              BlocProvider.of<ForgetPasswordCubit>(context).resetPassword(
                                emailController.text,
                              );
                            }
                          },)))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
