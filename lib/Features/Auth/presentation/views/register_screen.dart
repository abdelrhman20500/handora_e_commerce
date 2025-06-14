import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handora_e_commerce/Core/function/api_service.dart';
import 'package:handora_e_commerce/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:handora_e_commerce/Features/Auth/domain/use_case/register_use_case.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/view_model/register_cubit/register_state.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_button.dart';
import 'package:handora_e_commerce/Features/Auth/presentation/views/widgets/custom_text_field.dart';
import '../../../../Core/utilis/app_color.dart';
import '../../../../Core/utilis/error_dialog.dart';
import '../../../../Core/utilis/loading_dialog.dart';
import '../../../../Core/utilis/success_dialog.dart';
import '../../../Home/presentation/views/home_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  static const String routeName= "RegisterScreen";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
   final TextEditingController userNameController = TextEditingController();
   final TextEditingController displayNameController = TextEditingController();
  final  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(RegisterUseCase(AuthRepoImpl(apiService: ApiService(Dio(),),),),),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              // You can show a loading indicator or message here
              showLoadingDialog(context);
            } else if (state is RegisterFailure) {
              // print(state.errMessage);
              showErrorDialog(context, state.errMessage);
            } else if (state is RegisterSuccess) {
              closeLoadingDialog(context);
              showSuccessDialog(context, "Register Successfully");
              Navigator.pushNamed(context, HomeScreen.routeName);
              // print(state.authLogin.token); // Adjust based on your response structure
              // Navigate to the next screen or show success message
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: height*0.03,),
                      const Text("Register Now", style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      SizedBox(height: height*0.01,),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                        color: AppColors.kWhiteColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(height: height*0.03,),
                              CustomTextField(labelText: "display Name",controller: displayNameController,keyboardType: TextInputType.text,suffixIcon: const Icon(Icons.person_outline),),
                              SizedBox(height: height*0.03,),
                              CustomTextField(labelText: "User Name",keyboardType: TextInputType.text,controller: userNameController,suffixIcon: const Icon(Icons.person),),
                              SizedBox(height: height*0.03,),
                              CustomTextField(labelText: "Email",keyboardType: TextInputType.emailAddress,controller: emailController, suffixIcon: const Icon(Icons.email_outlined),),
                              SizedBox(height: height*0.03,),
                              CustomTextField(labelText: "Password",isSecure: false,controller: passwordController,keyboardType: TextInputType.text,
                                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_off)),),
                              SizedBox(height: height*0.03,),
                              CustomTextField(labelText: "Confirm Password",isSecure: false,keyboardType: TextInputType.text,controller: confirmPasswordController,
                                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_off)),),
                              SizedBox(height: height*0.03,),
                              CustomTextField(labelText: "Phone Number",keyboardType: TextInputType.number,controller: phoneController, suffixIcon: const Icon(Icons.phone),),
                              SizedBox(height: height*0.03,),
                              Container(
                                  height: height*0.07,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppColors.kPrimaryColor,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(child: CustomTextButton(text: "Register",color: AppColors.kWhiteColor, onTab: ()
                                  {
                                    if(formKey.currentState!.validate()){
                                      BlocProvider.of<RegisterCubit>(context).userRegister(
                                          emailController.text,
                                          passwordController.text,
                                          confirmPasswordController.text,
                                          phoneController.text,
                                          userNameController.text,
                                          displayNameController.text
                                      );
                                    }
                                  },),
                                  ),),
                              SizedBox(height: height*0.03,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("You already have an account ?  ", style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                                  InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, LoginScreen.routeName);
                                      },
                                      child: const Text("Login", style: TextStyle(fontSize: 18 ,color: AppColors.kPrimaryColor, fontWeight: FontWeight.w500),))

                                ],
                              )
                            ],
                          ),
                        ),
                      )
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
