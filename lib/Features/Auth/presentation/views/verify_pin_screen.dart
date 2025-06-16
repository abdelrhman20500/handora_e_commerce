import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/verify_pin_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/verify_pin_cubit/verify_pin_cubit.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/verify_pin_cubit/verify_pin_state.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_button.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/new_password_screen.dart';
import '../../../../Core/utilis/app_color.dart';
import '../../../../Core/utilis/error_dialog.dart';
import '../../../../Core/utilis/loading_dialog.dart';
import '../../../../Core/utilis/success_dialog.dart';

class VerifyPinScreen extends StatelessWidget {
  const VerifyPinScreen({super.key});

  static const String routeName ="VerifyPinScreen";

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    var height= MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => VerifyPinCubit(VerifyPinUseCase(AuthRepoImpl(
          apiService: ApiService(Dio(),),),),),
      child: BlocConsumer<VerifyPinCubit, VerifyPinState>(
        listener: (context, state) {
          if(state is VerifyPinLoading){
            // You can show a loading indicator or message here
            showLoadingDialog(context);
          }else if(state is VerifyPinFailure){
            closeLoadingDialog(context);
            showErrorDialog(context, "please try again later !");
          }else if(state is VerifyPinSuccess){
            closeLoadingDialog(context);
            showSuccessDialog(context, "Code is Successfully");
            Navigator.pushNamed(context, NewPasswordScreen.routeName,arguments: email);
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(height: height*0.1,),
                    const Text("Verification Code", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
                    SizedBox(height: height*0.04,),
                    OtpTextField(
                      fieldWidth: 46.0,
                      numberOfFields: 6,
                      borderColor: const Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every text-field is filled
                      onSubmit: (String verificationCode){
                        BlocProvider.of<VerifyPinCubit>(context).verifyCode(
                            verificationCode,
                            email,
                        );
                      }, // end onSubmit
                    ),
                    SizedBox(height: height*0.04,),
                    Container(
                      height: height*0.07,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: CustomTextButton(text: "Verify PIN code", color: AppColors.kWhiteColor,onTab: (){
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
    );
  }
}
